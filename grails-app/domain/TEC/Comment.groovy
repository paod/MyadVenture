package TEC

class Comment {
    String body
    Date dateCreated
    String affinity
    Profile creator
    static belongsTo = [blogs:Blog]
    
    static constraints = {
	body (blank:false, nullable:false,maxSize:500)
        affinity (inList: ["Like it", "Love it", "Hate it", "Too vague", "It's OK", "Don't do it", "It's been done"])
    }
}
