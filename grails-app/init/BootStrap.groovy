import fr.isima.grails.Badge
import fr.isima.grails.EnumBadge
import fr.isima.grails.Role
import fr.isima.grails.User
import fr.isima.grails.UserRole

class BootStrap {

    def init = {
        def adminRole = new Role('ROLE_ADMIN')
        def userRole = new Role('ROLE_USER')
        def userAdmin = new User('admin', 'admin@stackoverflow.fr', 'admin')

        adminRole.save(flush: true)
        userRole.save(flush: true)
        userAdmin.save(flush: true)

        UserRole.create(userAdmin, adminRole, true)

        UserRole.withSession {
            it.flush()
            it.clear()
        }

        // Init badges
        Badge badgeFirstQuestion = new Badge(['id': EnumBadge.FIRST_QUESTION.id, 'name': 'First Question !', 'description': 'Congratulation'])
        Badge badgeFirstAnswer = new Badge(['id': EnumBadge.FIRST_ANSWER.id, 'name': 'First Answer !', 'description': 'Congratulation'])
        badgeFirstQuestion.save(flush: true)
        badgeFirstAnswer.save(flush: true)

        assert User.count() == 1
        assert Role.count() == 2
        assert UserRole.count() == 1
    }
    def destroy = {
    }
}
