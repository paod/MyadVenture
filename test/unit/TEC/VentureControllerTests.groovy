package TEC



import org.junit.*
import grails.test.mixin.*

@TestFor(VentureController)
@Mock(Venture)
class VentureControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/venture/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.ventureInstanceList.size() == 0
        assert model.ventureInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.ventureInstance != null
    }

    void testSave() {
        controller.save()

        assert model.ventureInstance != null
        assert view == '/venture/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/venture/show/1'
        assert controller.flash.message != null
        assert Venture.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/venture/list'

        populateValidParams(params)
        def venture = new Venture(params)

        assert venture.save() != null

        params.id = venture.id

        def model = controller.show()

        assert model.ventureInstance == venture
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/venture/list'

        populateValidParams(params)
        def venture = new Venture(params)

        assert venture.save() != null

        params.id = venture.id

        def model = controller.edit()

        assert model.ventureInstance == venture
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/venture/list'

        response.reset()

        populateValidParams(params)
        def venture = new Venture(params)

        assert venture.save() != null

        // test invalid parameters in update
        params.id = venture.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/venture/edit"
        assert model.ventureInstance != null

        venture.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/venture/show/$venture.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        venture.clearErrors()

        populateValidParams(params)
        params.id = venture.id
        params.version = -1
        controller.update()

        assert view == "/venture/edit"
        assert model.ventureInstance != null
        assert model.ventureInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/venture/list'

        response.reset()

        populateValidParams(params)
        def venture = new Venture(params)

        assert venture.save() != null
        assert Venture.count() == 1

        params.id = venture.id

        controller.delete()

        assert Venture.count() == 0
        assert Venture.get(venture.id) == null
        assert response.redirectedUrl == '/venture/list'
    }
}
