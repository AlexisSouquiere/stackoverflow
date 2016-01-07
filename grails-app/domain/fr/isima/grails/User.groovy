package fr.isima.grails

class User {
    String pseudo;
    String description;
    String email;
    String password;
    Date createdAt;

    static constraints = {
        pseudo(nullable: false, blank: false, maxSize: 50, unique: true)
        description(nullable: false, blank: false, maxSize: 255)
        email(nullable: false, blank: false, email: true)
        password(nullable: false, blank: false)
    }

    static hasMany = [questions: Question]
}
