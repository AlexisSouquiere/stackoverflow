import fr.isima.grails.Role
import fr.isima.grails.User
import fr.isima.grails.UserRole

class BootStrap {

    def init = {
        def adminRole = new Role('ROLE_ADMIN')
        def userRole = new Role('ROLE_USER')
        def userAdmin = new User('admin', 'admin')

        adminRole.save(flush: true)
        userRole.save(flush: true)
        userAdmin.save(flush: true)

        UserRole.create(userAdmin, adminRole, true)

        UserRole.withSession {
            it.flush()
            it.clear()
        }

        assert User.count() == 1
        assert Role.count() == 2
        assert UserRole.count() == 1
    }
    def destroy = {
    }
}
