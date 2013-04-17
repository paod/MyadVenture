package TEC

class Keyword {
    String name
    static constraints = {
        name(unique:true,maxSize:30)
    }
}
