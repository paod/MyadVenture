package TEC

import org.springframework.dao.DataIntegrityViolationException

class VentureController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        def profileInstance = Profile.get(session?.user?.id)
        if (!profileInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'profile.label', default: 'Profile')])
            redirect(action: "page")
            return
        }
        
        def ventureCriteria = Venture.createCriteria()
        def ventureList = ventureCriteria.list(){
            projections {
                property('id')
                property('name')
                property('logoUri')
                property('dateOfIncorporation')
            }
            eq("admin", profileInstance)
        }
        
        def ventureCount = ventureList.size()		
	
        [ventureInstanceList: ventureList, ventureInstanceTotal: ventureCount]
    }

    def create() {
        [ventureInstance: new Venture(params)]
    }
    
    def save() {
        def ventureInstance = new Venture(params)
        ventureInstance.admin = session?.user
        
        if (!ventureInstance.save(flush: true)) {
            redirect(action: "page")
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'venture.label', default: 'Venture'), ventureInstance.id])
        redirect(action: "list")
    }

    def show(Long id) {
        def ventureInstance = Venture.get(id)

        if (!ventureInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'venture.label', default: 'Venture'), id])
            redirect(action: "create", params: params)
            return
        }

        def blogCriteria = Blog.createCriteria()
        def blogList = blogCriteria.list(max: 10, offset: params.offset){
            or{
                eq("type", "Venture")
                eq("type", "Idea")
            }
            eq("creator", ventureInstance)
            order("lastUpdated", "desc")
        }
        def blogCount = blogList.getTotalCount()

        session.ventureInstance = ventureInstance


        [blogs: blogList, blogCount: blogCount, ventureInstance: ventureInstance]
    } 

        
    def edit(Long id) {
        def ventureInstance = Venture.get(id)
        if (!ventureInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'venture.label', default: 'Venture'), id])
            redirect(action: "list")
            return
        }

        [ventureInstance: ventureInstance]
    }

    def update(Long id, Long version) {
        def ventureInstance = Venture.get(id)
        if (!ventureInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'venture.label', default: 'Venture'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (ventureInstance.version > version) {
                ventureInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'venture.label', default: 'Venture')] as Object[],
                          "Another user has updated this Venture while you were editing")
                render(view: "edit", model: [ventureInstance: ventureInstance])
                return
            }
        }

        ventureInstance.properties = params

        if (!ventureInstance.save(flush: true)) {
            render(view: "edit", model: [ventureInstance: ventureInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'venture.label', default: 'Venture'), ventureInstance.id])
        redirect(action: "show", id: ventureInstance.id)
    }

    def delete(Long id) {
        def ventureInstance = Venture.get(id)
        if (!ventureInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'venture.label', default: 'Venture'), id])
            redirect(action: "list")
            return
        }

        try {
            ventureInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'venture.label', default: 'Venture'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'venture.label', default: 'Venture'), id])
            redirect(action: "show", id: id)
        }
    }
}
