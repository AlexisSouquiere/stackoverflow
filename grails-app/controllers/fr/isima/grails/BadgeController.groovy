package fr.isima.grails

import grails.transaction.Transactional

@Transactional(readOnly = true)
class BadgeController {

    static allowedMethods = [index  :   "GET"
    ]

    def index(Integer max) {
        respond badges: Badge.listOrderByDateCreated(), model: [badgeCount: Badge.count()]
    }

}
