package TEC
import TEC.Specialization
import TEC.Skillset
import TEC.Venture
import TEC.Blog
import TEC.ConnectionRequest
import org.springframework.dao.DataIntegrityViolationException
import org.hibernate.criterion.CriteriaSpecification
import java.awt.image.BufferedImage;    
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import javax.imageio.ImageIO;
import net.coobird.thumbnailator.Thumbnails;
import groovy.sql.Sql

class ProfileController {
    def dataSource;
    static final String SERVER_PHOTO_THUMB_DIR="/home/jried/web-apps/pics/";
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
    
    def authenticate() {
        //Gets User object (if exists)
        def user = null;
        if(params.username.contains("@"))
        user = Profile.findByEmailAndPassword(params.username, params.password)
        else user = Profile.findByHandleAndPassword(params.username, params.password)
        
        if(user){
            session.user = user;
            redirect(controller:"profile",action:"page");
        }else{
            flash.message = "Invalid username or password";
            redirect(url:"/");
        }
    }

    def login(){
    }
    
    def logout() {
        //Teardown session then redirect back to login page
        flash.message = "Goodbye ${session?.user?.firstName}"
        session.user = null
        redirect(uri:"/")      
    }  
    
    def index() {
        redirect(action:"logout")         
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [profileInstanceList: Profile.list(params), profileInstanceTotal: Profile.count()]
    }

    def create() {
        [profileInstance: new Profile(params)]
    }

    def save() {
        def profileInstance = new Profile(params)
        if (!profileInstance.save(flush: true)) {
            flash.message = message(code: 'profile.not.created', args:["Profile"])
            redirect(url: "/")
            return
        }

	flash.message = message(code: 'profile.created', args:["Profile"])
        redirect(url: "/")
    }
    
    def show() {
        def id = session?.user?.id
        def profileInstance = Profile.get(id)
        if (!profileInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'profile.label', default: 'Profile'), params.id])
            redirect(action: "logout")
            return
        }

        [profileInstance: profileInstance]
    }
    
    
    static final int CONNECTION_REQUEST_EXISTS=0
    static final int CONNECTION_REQUEST_SENT=1
    static final int CONNECTION_REQUEST_NOT_PROCESSED=3
    static final int CONNECTION_EXISTS=0
    
    def connectionRequest(Long id) {        
        //Check if connection exists
        def to = Profile.get(id)
        def from = Profile.get(session?.user?.id)
        
        def contactCriteria = Profile.createCriteria()
        def contactList = contactCriteria.list(max:1) {
            createAlias('connections', 'c')
            projections {
                groupProperty('c.id')
                groupProperty('c.firstName')
            }
            or{
                eq("id", session?.user?.id)
                eq("c.id",to?.id)
            }
        }
        
        if(contactList.size() > 0 ){
            flash.message = message(code: 'connection.exists', args: [contactList[0][1].toString()])
            String val = message(code: 'connection.exists', args: [contactList[0][1].toString()]);//ProfileController.CONNECTION_EXISTS
            render val
            return
        }
        
        //See if connection request already existsaabss
        def connectionCriteria = ConnectionRequest.createCriteria()
        def connectionList = connectionCriteria.list(max:1) {
            projections {
                property('from')
                property('to')
            }
            eq("from", session?.user)
            eq("to",to)
        }
        
        if(connectionList.size() > 0 ){
            flash.message = message(code: 'connection.request.exists')
            String val = message(code: 'connection.request.exists');//ProfileController.CONNECTION_REQUEST_EXISTS
            render text: val, contentType: 'text/plain'
            return 
        }
        
        def connectionRequestInstance = new ConnectionRequest(from:from, to:to)
        if (!connectionRequestInstance.save(flush: true)) {
            flash.message = message(code: 'default.not.created.message', args: [message(code: 'connectionRequest.label', default: 'ConnectionRequest'), connectionRequestInstance.id])
            String val =  message(code: 'default.not.created.message', args: [message(code: 'connectionRequest.label', default: 'ConnectionRequest'), connectionRequestInstance.id]);//ProfileController.CONNECTION_REQUEST_NOT_PROCESSED
            render text: val, contentType: 'text/plain'
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'connectionRequest.label', default: 'ConnectionRequest'), connectionRequestInstance.id])
        String val = message(code: 'default.created.message', args: [message(code: 'connectionRequest.label', default: 'ConnectionRequest'), connectionRequestInstance.id]);//ProfileController.CONNECTION_REQUEST_SENT
        render text: val, contentType: 'text/plain'
        return
    }
    
    def page(Long id) {
        id = id ? id : session?.user?.id
        def profileInstance = Profile.get(id)
	def userInstance = Profile.get(session?.user?.id)
        
        if (!profileInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'profile.label', default: 'Profile')])
            redirect(action: "page")
            return
        }
       
        def profileCriteria = Profile.createCriteria()
        def isConnected = profileCriteria.list (max:1) {
            createAlias('connections', 'c')
            projections {
                count('c.id')//count the comments
            }
            eq("id",session?.user?.id)
            eq("c.id",id)
        }
        
        isConnected = isConnected[0].value == 0 ? 0:1
        
        def blogCriteria = Blog.createCriteria()
        def blogList = blogCriteria.list {
            //comments is the reference name to comments and 'c' is the alias
            createAlias('comments', 'c', CriteriaSpecification.LEFT_JOIN)
            projections {
                groupProperty('id')
                groupProperty('title')
                groupProperty('dateCreated')
                count('c.id')//count the comments
            }
            or{
                eq("type", "Profile")
                eq("type", "Idea")
            }
            eq("creator", profileInstance)
            order("lastUpdated", "desc")
	}
        def blogCount = blogList.size()
        //-----------------------
        
        //Skills
        def skillCriteria = Profile.createCriteria()
        def skillList = skillCriteria.list() {
            createAlias('skillsets', 's')
            projections {
                groupProperty('s.id')
                groupProperty('s.name')
                groupProperty('s.yearsOfExperience')
                groupProperty('s.proficiency')
            }
            eq("id", id)
            order("s.name", "asc")
        }
        def skillCount = skillList.size()

        //Specializations
        def specCriteria = Profile.createCriteria()
        def specList = specCriteria.list() {
            createAlias('specializations', 's')
            projections {
                groupProperty('s.id')
                groupProperty('s.name')
                groupProperty('s.yearsOfExperience')
                groupProperty('s.proficiency')
            }
            eq("id", id)
            order("s.name", "asc")
        }
        def specCount = specList.size()	
	//-----------
        println specList
        
        //roles
        /*
        def roleCriteria = Role.createCriteria()
        def roleList = roleCriteria.list() {
            createAlias('ventures', 'v')
            projections {
                groupProperty('v.id')
                groupProperty('v.name')
                groupProperty('v.logoUri')
                groupProperty('id')
                groupProperty('name')
                count('v.id')
            }
            eq("owner.id", id)
            order("v.name", "asc")
	}
        */
        
        def ventureCriteria = Profile.createCriteria()
        def ventureList = ventureCriteria.list{
            ventures {
                eq("admin.id",session?.user?.id)
            }
        }
        def ventureCount = ventureList.size()
        println "Results: "
        println ventureList
        println ventureCount
        //println roleList
        println "HELLO THERE"
        //def roleCount = roleList.size()
        
        
        def db = new Sql(dataSource)
        def connectionRequests = db.executeQuery("SELECT * FROM profile p JOIN connection_request c ON p.id=c.from_id WHERE c.to_id="+userInstance?.id)
        
        render(view: "page", model: [connected: isConnected,ventures:ventureList,ventureCount:ventureCount,blogs: blogList, blogCount: blogCount, skills: skillList, skillCount: skillCount, specializations: specList, specCount: specCount, connectionRequests: connectionRequests, profileInstance: profileInstance])		
    }

    def edit() {
        def id=session?.user?.id
        def profileInstance = Profile.get(id)
        if (!profileInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'profile.label', default: 'Profile'), id])
            redirect(action: "page")
            return
        }
        [profileInstance: profileInstance]
    }

    def update() {
        def id = session?.user?.id
        def version = params.version
        
        def profileInstance = Profile.get(id)
        if (!profileInstance) {
            flash.message = message(code: 'not.found.message.one.arg', args: ['Profile'])
            redirect(action: "logout")
            return
        }

        if (version != null) {
            if (profileInstance.version > version) {
                profileInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                    [message(code: 'profile.label', default: 'Profile')] as Object[],
                          "Another user has updated this Profile while you were editing")
                //render(view: "page")
                
                render(view: "edit", model: [profileInstance: profileInstance])
                return
            }
        }
        // Get the avatar file from the multi-part request
        def picture = request.getFile('avatar')
        byte[] pictureAsBytes = null;
        //If a photo is uploaded and the size is < 500KB
        if(!picture.empty)
        {
            // List of OK mime-types 
            def okcontents = ['image/png', 'image/jpeg', 'image/gif'] 
            if (! okcontents.contains(picture.getContentType())) { 
                flash.message = "Avatar must be one of: ${okcontents}" 
                
                render(view: "edit", model: [profileInstance: profileInstance])
                //render(view:"page");
                return; 
            }
            
            // Save the image and mime type
            pictureAsBytes = picture.getBytes()
            
            File file = new File((ProfileController.SERVER_PHOTO_THUMB_DIR + profileInstance.handle+".jpg"));
            InputStream input = new ByteArrayInputStream(pictureAsBytes);
            BufferedImage originalImage = ImageIO.read(input);
            
            //Save scaled down regular photo version
            BufferedImage thumbnail = Thumbnails.of(originalImage)
            .size(200, 200)
            .outputFormat("jpg")
            .toFile(file);
        }
        
        profileInstance.properties = params
        
        //Setting hasAvatar to if avatar has been existing, otherwise the default image is used
        if(!picture.empty)
        profileInstance.hasAvatar=true;
            
        if (!profileInstance.save(flush: true)) {
            flash.message = message(code: 'profile.updated', args: ['Profile'])
            render(view: "edit", model: [profileInstance: profileInstance])
            //redirect(action: "page")
            return
        }

        flash.message = message(code: 'profile.updated', args: ['Profile'])
        redirect(action: "page")
    }

    def delete() {
        def id = session?.user?.id
        def profileInstance = Profile.get(id)
        if (!profileInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'profile.label', default: 'Profile'), id])
            redirect(action: "page")
            return
        }
        
        //Suspend the user not delete them
        //TODO: Update the response messages
        profileInstance.suspended=1
    
        try {
            profileInstance.save(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'profile.label', default: 'Profile'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'profile.label', default: 'Profile'), id])
            redirect(action: "show", id: id)
        }
    }
}
