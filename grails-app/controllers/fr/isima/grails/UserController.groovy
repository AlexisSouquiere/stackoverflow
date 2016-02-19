package fr.isima.grails

import grails.plugin.springsecurity.annotation.Secured
import grails.plugin.springsecurity.SpringSecurityUtils

import static org.springframework.http.HttpStatus.*

class UserController extends grails.plugin.springsecurity.ui.UserController {

    def springSecurityService

    def show(User user) {
        if(user == null)
            respond springSecurityService.currentUser

        respond user
    }

    @Secured(['ROLE_USER', 'ROLE_ADMIN'])
    def edit() {
        def user = springSecurityService.currentUser

        if(!SpringSecurityUtils.ifAllGranted('ROLE_ADMIN') && user.id != params.id.toLong()) {
            log.error "Access denied to question edit"
            redirect controller: "login", action: "denied"
        }

        super.edit();
    }

    protected void notFound() {
        log.info "User not found"
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
