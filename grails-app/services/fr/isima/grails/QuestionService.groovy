package fr.isima.grails

import grails.transaction.Transactional

@Transactional
class QuestionService {

    def getQuestionsByTagId(Tag tag) {
        return Question.executeQuery('select q from Question q where :tag in elements(q.tags)', [tag: tag])
    }

    def incViews(Question question) {
        question.views++;
        question.save(flush: true);
    }
}
