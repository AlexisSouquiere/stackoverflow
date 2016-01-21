package fr.isima.grails

import grails.transaction.Transactional

import static org.springframework.http.HttpStatus.*

@Transactional(readOnly = true)
class TagController {

    static allowedMethods = [index  :   "GET"
    ]

    def index(Integer max) {
        respond tags: Tag.listOrderByLabel(), model: [tagCount: Tag.count()]
    }

}
