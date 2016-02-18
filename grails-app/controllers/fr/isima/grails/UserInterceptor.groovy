package fr.isima.grails


class UserInterceptor {

    def springSecurityService

    public UserInterceptor() {
        matchAll()
    }

    boolean before() {
        if (springSecurityService.isLoggedIn()){
            request.setAttribute("currentUser", springSecurityService.currentUser);
        }
        true
    }

    boolean after() { true }

    void afterView() {
        // no-op
    }
}
