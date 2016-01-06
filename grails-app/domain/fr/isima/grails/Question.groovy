package fr.isima.grails

class Question {
    String title;
    String description;
    Date createdAt;
    Boolean isClosed;

    static constraints = {
        title(nullable:false, blank: false, maxSize: 255)
        description(nullable:false, blank: false, maxSize: 2000)
    }

    static belongsTo = [user: User]
}
