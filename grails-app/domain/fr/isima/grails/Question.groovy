package fr.isima.grails

class Question {
    String title;
    String description;
    Date dateCreated;
    Boolean isClosed;
    Integer views;

    static constraints = {
        title(nullable: false, blank: false, maxSize: 255)
        description(nullable: false, blank: false, maxSize: 20000)
        isClosed(nullable: false, blank: false)
        views(nullable: true)
    }

    static mapping = {
        autoTimestamp true
    }

    static belongsTo = [user: User]

    static hasMany = [answers: Answer]
}
