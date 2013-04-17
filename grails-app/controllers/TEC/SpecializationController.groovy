package TEC

import groovy.sql.Sql
import grails.converters.JSON;
import org.springframework.dao.DataIntegrityViolationException
import TEC.Profile
import org.codehaus.groovy.grails.web.json.JSONObject
import org.codehaus.groovy.grails.web.json.JSONArray

class SpecializationController {
    def dataSource
    static allowedMethods = [save: "POST", update: "POST", delete: "GET"]

    def index() {
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [specializationInstanceList: Specialization.list(params), specializationInstanceTotal: Specialization.count()]
    }

    def create() {
        [specializationInstance: new Specialization(params)]
    }

    
    def save() {
        def specializationInstance = new Specialization(params)
        
        if (!specializationInstance.save(flush: true)) {
            flash.message = message(code: 'default.not.created.message', args: ['Specialization'])
            if(specializationInstance?.type.equals("Personal"))
            {
                redirect(controller:"profile", action: "page")
                return
            }
        }
        
        if(specializationInstance?.type.equals("Personal"))
        {
            
            def user = Profile.get(session?.user?.id)
            user.addToSpecializations(specializationInstance)
        
            if (!user.save(flush: true)) {
                flash.message = message(code: 'default.not.created.message', args: ['Specialization'])
            }else {
                flash.message = message(code: 'profile.created', args:["Specialization"])
            }
            redirect(controller:"profile", action: "page")
            return
        }
        
    }
   
    def show(Long id) {
        def specializationInstance = Specialization.get(id)
        if (!specializationInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'specialization.label', default: 'Specialization'), id])
            redirect(action: "list")
            return
        }

        [specializationInstance: specializationInstance]
    }

    def edit(Long id) {
        def specializationInstance = Specialization.get(id)
        if (!specializationInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'specialization.label', default: 'Specialization'), id])
            redirect(action: "list")
            return
        }

        [specializationInstance: specializationInstance]
    }

    def update(Long id, Long version) {
        def specializationInstance = Specialization.get(id)
        if (!specializationInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'specialization.label', default: 'Specialization'), id])
            if(specializationInstance?.type.equals("Personal"))
                redirect(controller:"profile",action: "page")
            return
        }

        if (version != null) {
            if (specializationInstance.version > version) {
                specializationInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'specialization.label', default: 'Specialization')] as Object[],
                          "Another user has updated this Specialization while you were editing")
                
                //Redirecting based upon the type of specialization
                if(specializationInstance?.type.equals("Personal"))
                    redirect(controller:"profile",action: "page")
                return
            }
        }

        specializationInstance.properties = params

        if (!specializationInstance.save(flush: true)) {
                //Redirecting based upon the type of specialization
                if(specializationInstance?.type.equals("Personal"))
                    redirect(controller:"profile",action: "page")
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'specialization.label', default: 'Specialization'), specializationInstance.id])
        
        //Redirecting based upon the type of specialization
        if(specializationInstance?.type.equals("Personal"))
            redirect(controller:"profile",action: "page")
    }

    def delete(Long id) {
        def specializationInstance = Specialization.get(id)
        if (!specializationInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'specialization.label', default: 'Specialization'), id])
            
            //Redirecting based upon the type of specialization
            if(specializationInstance?.type.equals("Personal"))
                redirect(controller:"profile",action: "page")
            return
        }

        try {
            //Remove the specialization link from the user
            if(specializationInstance?.type.equals("Personal")){
                def user = Profile.get(session?.user?.id)
                if(user){
                    user.removeFromSpecializations(specializationInstance)
                    if (!user.save(flush: true)) {
                        flash.message = message(code: 'default.deleted.message', args: [message(code: 'specialization.label', default: 'Specialization'), id])
                        redirect(controller:"profile",action: "page")
                        return
                    }
                    
                    
                    flash.message = message(code: 'default.deleted.message', args: [message(code: 'specialization.label', default: 'Specialization'), id])
                    redirect(controller:"profile",action: "page")
                    return
                }
            }
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'specialization.label', default: 'Specialization'), id])

            //Redirecting based upon the type of specialization
            if(specializationInstance?.type.equals("Personal"))
                redirect(controller:"profile",action: "page")
        }
    }
}