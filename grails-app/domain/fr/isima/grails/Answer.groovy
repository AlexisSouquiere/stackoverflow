package fr.isima.grails

class Answer {
    String description;
    Boolean isBest;
    Date dateCreated;
    Date lastUpdated;
    Integer rate;

    static constraints = {
        description(nullable: false, blank: false, maxSize: 20000)
        isBest(nullable: true)
        rate(nullable: true)
    }

    static mapping = {
        autoTimestamp true
        sort dateCreated: "asc"
    }

    static belongsTo = [question: Question,
                        user    : User]
}
