package fr.isima.grails

class Comment {

    String description;
    Date dateCreated;

    static constraints = {
        description(nullable: false, blank: false, maxSize: 20000)
        answer(nullable: true)
        question(nullable: true)
    }

    static belongsTo = [user     : User,
                        answer   : Answer,
                        question : Question]

    static mapping = {
        autoTimestamp true
        sort: 'dateCreated'
    }
}
