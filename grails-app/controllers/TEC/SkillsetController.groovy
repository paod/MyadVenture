package TEC

import groovy.sql.Sql
import grails.converters.JSON;
import org.springframework.dao.DataIntegrityViolationException
import TEC.Profile
import org.codehaus.groovy.grails.web.json.JSONObject
import org.codehaus.groovy.grails.web.json.JSONArray

class SkillsetController {
    def dataSource
    static allowedMethods = [save: "POST", update: "POST", delete: ["GET"]]

    def index() {
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [skillsetInstanceList: Skillset.list(params), skillsetInstanceTotal: Skillset.count()]
    }

    def create() {
        [skillsetInstance: new Skillset(params)]
    }

    def save() {
        def skillsetInstance = new Skillset(params)
        
        if (!skillsetInstance.save(flush: true)) {
            flash.message = message(code: 'default.not.created.message', args: [message(code: 'skillset.label', default: 'Skillset'), id])
            if(skillsetInstance?.type.equals("Personal"))
            {
                redirect(controller:"profile", action: "page")
                return
            }
        }
        
        if(skillsetInstance?.type.equals("Personal"))
        {
            def user = Profile.get(session?.user?.id)
            if(!user){
                flash.message = message(code: 'default.not.created.message', args: ['Skillset'])
                redirect(controller:"profile", action: "page")
                return
            }
            user.addToSkillsets(skillsetInstance)

            if (!user.save(flush: true)) {
                flash.message = message(code: 'default.not.created.message', args: ['Skillset'])
            }else {
                flash.message = message(code: 'default.created.message', args: [message(code: 'skillset.label', default: 'Skillset'), skillsetInstance.id])
            }
            redirect(controller:"profile", action: "page")
            return
        }
    }

    def show(Long id) {
        def skillsetInstance = Skillset.get(id)
        if (!skillsetInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'skillset.label', default: 'Skillset'), id])
            redirect(action: "list")
            return
        }

        [skillsetInstance: skillsetInstance]
    }

    def edit(Long id) {
        def skillsetInstance = Skillset.get(id)
        if (!skillsetInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'skillset.label', default: 'Skillset'), id])
            redirect(action: "list")
            return
        }

        [skillsetInstance: skillsetInstance]
    }

    def update(Long id, Long version) {
        def skillsetInstance = Skillset.get(id)
        if (!skillsetInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'skillset.label', default: 'Skillset'), id])
            if(skillsetInstance?.type.equals("Personal"))
                redirect(controller:"profile",action: "page")
            return
        }

        if (version != null) {
            if (skillsetInstance.version > version) {
                skillsetInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'skillset.label', default: 'Skillset')] as Object[],
                          "Another user has updated this Skillset while you were editing")
                //Redirecting based upon the type
                if(skillsetInstance?.type.equals("Personal"))
                    redirect(controller:"profile",action: "page")
                return
            }
        }

        skillsetInstance.properties = params

        if (!skillsetInstance.save(flush: true)) {
           //Redirecting based upon the
            if(skillsetInstance?.type.equals("Personal"))
                redirect(controller:"profile",action: "page")
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'skillset.label', default: 'Skillset'), skillsetInstance.id])
        
        //Redirecting based upon the type
        if(skillsetInstance?.type.equals("Personal"))
            redirect(controller:"profile",action: "page")
    }

    def delete(Long id) {
        def skillsetInstance = Skillset.get(id)
        if (!skillsetInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'skillset.label', default: 'Skillset'), id])
            //Redirecting based upon the type
            if(skillsetInstance?.type.equals("Personal"))
                redirect(controller:"profile",action: "page")
            return
        }

        try {
            //Remove the skillset link from the user
            if(skillsetInstance?.type.equals("Personal")){
                def user = Profile.get(session?.user?.id)
                if(user){
                    user.removeFromSkillsets(skillsetInstance)
                    if (!user.save(flush: true)) {
                        flash.message = message(code: 'default.deleted.message', args: [message(code: 'skillset.label', default: 'Skillset'), id])
                        redirect(controller:"profile",action: "page")
                        return
                    }
                    
                    flash.message = message(code: 'default.deleted.message', args: [message(code: 'skillset.label', default: 'Skillset'), id])
                    redirect(controller:"profile",action: "page")
                    return
                }
            }
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'skillset.label', default: 'Skillset'), id])
            //Redirecting based upon the type
            if(skillsetInstance?.type.equals("Personal"))
                redirect(controller:"profile",action: "page")
        }
    }
}
