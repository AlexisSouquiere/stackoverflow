package fr.isima.grails

class Answer {
    String description;
    Date dateCreated;

    static constraints = {
        description(nullable: false, blank: false, maxSize: 20000)
    }

    static mapping = {
        autoTimestamp true
        sort dateCreated: "asc"
    }

    static belongsTo = [question: Question]
}
