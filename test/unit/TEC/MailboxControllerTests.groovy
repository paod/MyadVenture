package TEC



import org.junit.*
import grails.test.mixin.*

@TestFor(MailboxController)
@Mock(Mailbox)
class MailboxControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/mailbox/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.mailboxInstanceList.size() == 0
        assert model.mailboxInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.mailboxInstance != null
    }

    void testSave() {
        controller.save()

        assert model.mailboxInstance != null
        assert view == '/mailbox/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/mailbox/show/1'
        assert controller.flash.message != null
        assert Mailbox.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/mailbox/list'

        populateValidParams(params)
        def mailbox = new Mailbox(params)

        assert mailbox.save() != null

        params.id = mailbox.id

        def model = controller.show()

        assert model.mailboxInstance == mailbox
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/mailbox/list'

        populateValidParams(params)
        def mailbox = new Mailbox(params)

        assert mailbox.save() != null

        params.id = mailbox.id

        def model = controller.edit()

        assert model.mailboxInstance == mailbox
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/mailbox/list'

        response.reset()

        populateValidParams(params)
        def mailbox = new Mailbox(params)

        assert mailbox.save() != null

        // test invalid parameters in update
        params.id = mailbox.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/mailbox/edit"
        assert model.mailboxInstance != null

        mailbox.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/mailbox/show/$mailbox.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        mailbox.clearErrors()

        populateValidParams(params)
        params.id = mailbox.id
        params.version = -1
        controller.update()

        assert view == "/mailbox/edit"
        assert model.mailboxInstance != null
        assert model.mailboxInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/mailbox/list'

        response.reset()

        populateValidParams(params)
        def mailbox = new Mailbox(params)

        assert mailbox.save() != null
        assert Mailbox.count() == 1

        params.id = mailbox.id

        controller.delete()

        assert Mailbox.count() == 0
        assert Mailbox.get(mailbox.id) == null
        assert response.redirectedUrl == '/mailbox/list'
    }
}
