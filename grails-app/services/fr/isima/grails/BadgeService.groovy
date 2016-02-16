package fr.isima.grails

import grails.transaction.Transactional

@Transactional
class BadgeService {

    def addBadge(User user, EnumBadge badgeEnum) {
        Badge badge = Badge.get(badgeEnum.id)
        user.badges.add(badge)

        user.save(flush: true)
    }
}
