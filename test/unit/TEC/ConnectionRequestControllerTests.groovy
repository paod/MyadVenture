package TEC



import org.junit.*
import grails.test.mixin.*

@TestFor(ConnectionRequestController)
@Mock(ConnectionRequest)
class ConnectionRequestControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/connectionRequest/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.connectionRequestInstanceList.size() == 0
        assert model.connectionRequestInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.connectionRequestInstance != null
    }

    void testSave() {
        controller.save()

        assert model.connectionRequestInstance != null
        assert view == '/connectionRequest/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/connectionRequest/show/1'
        assert controller.flash.message != null
        assert ConnectionRequest.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/connectionRequest/list'

        populateValidParams(params)
        def connectionRequest = new ConnectionRequest(params)

        assert connectionRequest.save() != null

        params.id = connectionRequest.id

        def model = controller.show()

        assert model.connectionRequestInstance == connectionRequest
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/connectionRequest/list'

        populateValidParams(params)
        def connectionRequest = new ConnectionRequest(params)

        assert connectionRequest.save() != null

        params.id = connectionRequest.id

        def model = controller.edit()

        assert model.connectionRequestInstance == connectionRequest
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/connectionRequest/list'

        response.reset()

        populateValidParams(params)
        def connectionRequest = new ConnectionRequest(params)

        assert connectionRequest.save() != null

        // test invalid parameters in update
        params.id = connectionRequest.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/connectionRequest/edit"
        assert model.connectionRequestInstance != null

        connectionRequest.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/connectionRequest/show/$connectionRequest.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        connectionRequest.clearErrors()

        populateValidParams(params)
        params.id = connectionRequest.id
        params.version = -1
        controller.update()

        assert view == "/connectionRequest/edit"
        assert model.connectionRequestInstance != null
        assert model.connectionRequestInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/connectionRequest/list'

        response.reset()

        populateValidParams(params)
        def connectionRequest = new ConnectionRequest(params)

        assert connectionRequest.save() != null
        assert ConnectionRequest.count() == 1

        params.id = connectionRequest.id

        controller.delete()

        assert ConnectionRequest.count() == 0
        assert ConnectionRequest.get(connectionRequest.id) == null
        assert response.redirectedUrl == '/connectionRequest/list'
    }
}
