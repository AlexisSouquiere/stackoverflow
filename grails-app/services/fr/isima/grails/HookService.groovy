package fr.isima.grails

import grails.transaction.Transactional

@Transactional
class HookService {

    BadgeService badgeService

    def manageHook(EnumHook enumHook, User user) {
        switch (enumHook) {
            case EnumHook.QUESTION_CREATED:
                //Badge for first question created
                if(user.getQuestions().size() == 1) {
                    badgeService.addBadge(user, EnumBadge.FIRST_QUESTION)
                }

                break;

            case EnumHook.ANSWER_CREATED:
                //Badge for first answer created
                if(user.getAnswers().size() == 1) {
                    badgeService.addBadge(user, EnumBadge.FIRST_ANSWER)
                }

                break;
        }
    }
}
