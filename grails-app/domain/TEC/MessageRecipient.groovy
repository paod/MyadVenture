package TEC

class MessageRecipient {
    String thread
    Profile recipient
    boolean unread = true
    
    static mapping = {
        thread index: 'myIndex'
    } 
    
    static constraints = {
        thread( 
            validator: { val, obj ->
                def existingMessageThread = Message.findByThread(obj.thread)
                return !existingMessageThread
            }
        )
    }
}
