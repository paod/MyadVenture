import TEC.*;
class BootStrap {

    def init = { servletContext ->
        Profile p1 = new Profile(firstName:"Jerrid",lastName:"Matthews",handle:"assos",email:"a@b.com",password:"dddddd")
        p1.save(flush:true)
        
        Profile p2 = new Profile(firstName:"Jerel",lastName:"Thompson",handle:"rel",email:"b@b.com",password:"dddddd")
        p2.save(flush:true)
    }
    def destroy = {
    }
}
