package fr.isima.grails

import grails.transaction.Transactional

import static org.springframework.http.HttpStatus.*

class UserController extends grails.plugin.springsecurity.ui.UserController {

    def springSecurityService

    def show(User user) {
        if(user == null)
            respond springSecurityService.currentUser

        respond user
    }

    protected void notFound() {
            request.withFormat {
                form multipartForm {
                    flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), params.id])
                    redirect action: "index", method: "GET"
                }
                '*' { render status: NOT_FOUND }
            }
        }
}
