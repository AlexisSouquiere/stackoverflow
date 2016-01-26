package fr.isima.grails

class Question {
    String title;
    String description;
    Date dateCreated;
    Boolean isClosed;
    Boolean hasBest;
    Integer views;
    Integer rate;

    public Boolean getHasBest() {
        if(hasBest == null) {
            def result = this.answers?.find { answer -> answer.isBest == true }
            hasBest = result == null ? false : true
        }
        return hasBest
    }

    static constraints = {
        title(nullable: false, blank: false, maxSize: 255)
        description(nullable: false, blank: false, maxSize: 20000)
        isClosed(nullable: false, blank: false)
        views(nullable: true)
        rate(nullable: true)
    }

    static mapping = {
        autoTimestamp true
        comments sort: 'dateCreated'
    }

    static transients = ['hasBest']

    static belongsTo = [user: User]

    static hasMany = [answers : Answer,
                      tags    : Tag,
                      comments: Comment]
}
