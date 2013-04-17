package TEC

import org.springframework.dao.DataIntegrityViolationException

class ConnectionRequestController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def connectionRequest(Long id) {        
        //Check if connection exists
        def to = Profile.get(id)
        def from = Profile.get(session?.user?.id)
        
        //Check if connection request exists
        def connectionRequest = ConnectionRequest.findAllByFromAndTo(from,to,[max:1])        
        if(connectionRequest.size() > 0 ){
            flash.message = message(code: 'connection.request.exists')
            redirect(controller:"profile",action: "page", id: id)
            return
        }
        
        //Check if the connection exists
        def connectionCriteria = Profile.createCriteria()
        def connectionsList = connectionCriteria.list() {
            createAlias('connections', 'p')
            projections {
                groupProperty('p.id')
                groupProperty('p.firstName')
                groupProperty('p.lastName')
                groupProperty('p.handle')
                groupProperty('p.hasAvatar')
            }
            eq("p.id", to?.id)
        }
        if(connectionsList.size() > 0 ){
            flash.message = message(code: 'connection.exists')
            redirect(controller:"profile",action: "page", id: id)
            return 
        }
        
        def connectionRequestInstance = new ConnectionRequest(from:from, to:to)
        if (!connectionRequestInstance.save(flush: true)) {
            flash.message = message(code: 'default.not.created.message', args: [message(code: 'connectionRequest.label', default: 'ConnectionRequest'), connectionRequestInstance.id])
            redirect(controller:"profile",action: "page", id: id)
            return
        }

        flash.message = message(code: 'connection.request.sent')
        redirect(controller:"profile",action: "page", id: id)
        return
    }
    
    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [connectionRequestInstanceList: ConnectionRequest.list(params), connectionRequestInstanceTotal: ConnectionRequest.count()]
    }

    def create() {
        [connectionRequestInstance: new ConnectionRequest(params)]
    }

    def save() {
        def connectionRequestInstance = new ConnectionRequest(params)
        if (!connectionRequestInstance.save(flush: true)) {
            render(view: "create", model: [connectionRequestInstance: connectionRequestInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'connectionRequest.label', default: 'ConnectionRequest'), connectionRequestInstance.id])
        redirect(action: "show", id: connectionRequestInstance.id)
    }

    def show(Long id) {
        def connectionRequestInstance = ConnectionRequest.get(id)
        if (!connectionRequestInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'connectionRequest.label', default: 'ConnectionRequest'), id])
            redirect(action: "list")
            return
        }

        [connectionRequestInstance: connectionRequestInstance]
    }

    def edit(Long id) {
        def connectionRequestInstance = ConnectionRequest.get(id)
        if (!connectionRequestInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'connectionRequest.label', default: 'ConnectionRequest'), id])
            redirect(action: "list")
            return
        }

        [connectionRequestInstance: connectionRequestInstance]
    }

    def update(Long id, Long version) {
        def connectionRequestInstance = ConnectionRequest.get(id)
        if (!connectionRequestInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'connectionRequest.label', default: 'ConnectionRequest'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (connectionRequestInstance.version > version) {
                connectionRequestInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'connectionRequest.label', default: 'ConnectionRequest')] as Object[],
                          "Another user has updated this ConnectionRequest while you were editing")
                render(view: "edit", model: [connectionRequestInstance: connectionRequestInstance])
                return
            }
        }

        connectionRequestInstance.properties = params

        if (!connectionRequestInstance.save(flush: true)) {
            render(view: "edit", model: [connectionRequestInstance: connectionRequestInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'connectionRequest.label', default: 'ConnectionRequest'), connectionRequestInstance.id])
        redirect(action: "show", id: connectionRequestInstance.id)
    }

    def delete(Long id) {
        def connectionRequestInstance = ConnectionRequest.get(id)
        if (!connectionRequestInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'connectionRequest.label', default: 'ConnectionRequest'), id])
            redirect(action: "list")
            return
        }

        try {
            connectionRequestInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'connectionRequest.label', default: 'ConnectionRequest'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'connectionRequest.label', default: 'ConnectionRequest'), id])
            redirect(action: "show", id: id)
        }
    }
}
