package fr.isima.grails

class Badge {

    String name;
    String description;
    Date dateCreated;

    static constraints = {
        name(nullable: false, blank: false, maxSize: 255)
        description(nullable: false, blank: false, maxSize: 255)
    }

    static mapping = {
        autoTimestamp true
    }

    static belongsTo = User

    static hasMany = [users : User]
}

