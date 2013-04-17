package TEC

class Message {
    Date dateCreated
    String thread
    String body
    
    static mapping = {
        thread index: 'myIndex'
        sort dateCreated: 'desc'
    }
      
    static constraints = {
        thread (nullable: false, blank:false)
        body(minSize:1,maxSize:320)
    }
}
