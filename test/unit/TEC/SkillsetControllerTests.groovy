package TEC



import org.junit.*
import grails.test.mixin.*

@TestFor(SkillsetController)
@Mock(Skillset)
class SkillsetControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/skillset/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.skillsetInstanceList.size() == 0
        assert model.skillsetInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.skillsetInstance != null
    }

    void testSave() {
        controller.save()

        assert model.skillsetInstance != null
        assert view == '/skillset/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/skillset/show/1'
        assert controller.flash.message != null
        assert Skillset.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/skillset/list'

        populateValidParams(params)
        def skillset = new Skillset(params)

        assert skillset.save() != null

        params.id = skillset.id

        def model = controller.show()

        assert model.skillsetInstance == skillset
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/skillset/list'

        populateValidParams(params)
        def skillset = new Skillset(params)

        assert skillset.save() != null

        params.id = skillset.id

        def model = controller.edit()

        assert model.skillsetInstance == skillset
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/skillset/list'

        response.reset()

        populateValidParams(params)
        def skillset = new Skillset(params)

        assert skillset.save() != null

        // test invalid parameters in update
        params.id = skillset.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/skillset/edit"
        assert model.skillsetInstance != null

        skillset.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/skillset/show/$skillset.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        skillset.clearErrors()

        populateValidParams(params)
        params.id = skillset.id
        params.version = -1
        controller.update()

        assert view == "/skillset/edit"
        assert model.skillsetInstance != null
        assert model.skillsetInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/skillset/list'

        response.reset()

        populateValidParams(params)
        def skillset = new Skillset(params)

        assert skillset.save() != null
        assert Skillset.count() == 1

        params.id = skillset.id

        controller.delete()

        assert Skillset.count() == 0
        assert Skillset.get(skillset.id) == null
        assert response.redirectedUrl == '/skillset/list'
    }
}
