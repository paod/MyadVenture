package TEC

/*
 * Role is meant to be the position within the company, which should be unique
 * EG: Chief Tech Officer, Chief Information Officer, etc
*/
class Role {
    Profile owner
    String name
    
    static hasMany = [specializations:Specialization,skillsets:Skillset]
    static belongsTo = [ventures:Venture]
    static constraints = {
        owner(nullable:true)
        name(maxSize:25)
    }
    
    static mapping = {
		skillsets cascade: "all-delete-orphan"
		specializations cascade: "all-delete-orphan"
	}
}
