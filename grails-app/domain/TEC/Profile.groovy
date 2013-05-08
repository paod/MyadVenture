package TEC

class Profile {
	String firstName
	String lastName
	String handle		//	nickname
	String headline		//	job title
	String phone
	String email
	String password
        String personalWebpage
	String location
	Date birthDate
        boolean hasAvatar=0
	boolean suspended = 0

	static hasMany = [connections:Profile, blogs:Blog, skillsets:Skillset, specializations:Specialization, ventures:Venture]

	static constraints = {
                personalWebpage(nullable:true,url:true)
		handle (unique:true)
		headline (nullable:true)
		phone ( phone:true, nullable:true)
		email (email:true, unique:true, blank:false, nullable:false)
		password (password:true, blank:false, nullable:false,minSize:6,maxSize:15)
		location (nullable:true)
		birthDate (nullable: true)
	}

	static mapping = {
		skillsets cascade: "all-delete-orphan"
		specializations cascade: "all-delete-orphan"
                connections cascade: "all-delete-orphan"
                blogs cascade: "all-delete-orphan"
	}
}
