package fr.isima.grails

import org.jsoup.Jsoup;

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
        comments sort: 'dateCreated'
    }

    static belongsTo = [question: Question,
                        user    : User]

    public String getDescriptionEscaped() {
        return Jsoup.parse(description).text();
    }
}
