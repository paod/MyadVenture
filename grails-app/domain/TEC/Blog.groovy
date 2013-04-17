package TEC

class Blog {
	String body
	String title
	String tagLine
	String type
	Date lastUpdated
        Date dateCreated
	static hasMany = [comments:Comment, keywords:Keyword]
	static hasOne = [creator:Profile]
    
	static constraints = {
		title (blank:false, nullable:false,maxSize:30)
                tagLine(nullable:true,maxSize:30)
		body (blank:false, nullable:false,maxSize:500)
		type (inList: ["Project","Venture", "Profile", "Idea"])
	}
}
