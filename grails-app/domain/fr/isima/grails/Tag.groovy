package fr.isima.grails

class Tag {
    String label;

    static constraints = {
        label(nullable: false, blank: false, maxSize: 50)
    }

    static hasMany = [questions : Question]

    static belongsTo = [Question]

    public Tag(String label) {
        this.label = label;
    }
}
