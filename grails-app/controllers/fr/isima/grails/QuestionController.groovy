package fr.isima.grails

import grails.transaction.Transactional

import static org.springframework.http.HttpStatus.*
import grails.plugin.springsecurity.annotation.Secured
import grails.plugin.springsecurity.SpringSecurityUtils

@Transactional(readOnly = true)
class QuestionController {

    static allowedMethods = [save       : "POST",
                             update     : "PUT",
                             delete     : "DELETE",
                             show       : "GET",
                             edit       : "GET",
                             close      : "PUT",

                             addAnswer  : "POST",
                             voteUp     : "PUT",
                             voteDown   : "PUT",
                             indexByTag : "GET"
    ]

    def springSecurityService
    QuestionService questionService
    HookService hookService

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond questions: Question.list(params), model: [questionCount: Question.count()]
    }

    def indexByTag(Integer id) {
        Tag tag = Tag.get(id)

        respond questions: questionService.getQuestionsByTagId(tag),
                model: [questionCount: Question.count(), tag: tag]
    }

    @Transactional
    def show(Question question) {
        questionService.incViews(question)
        respond question
    }

    @Secured(['ROLE_USER', 'ROLE_ADMIN'])
    def create() {
        respond new Question(params), model : [allTags: Tag.listOrderByLabel()]
    }

    @Transactional
    def save() {
        Question question = new Question(params)
        question.views = 0
        question.rate = 0
        question.isClosed = false
        question.user = springSecurityService.currentUser

        if (question == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (question.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond question.errors, view: 'create'
            return
        }

        if (question.save(flush: true, failOnError: true)) {
            //Hook : Question created
            hookService.manageHook(EnumHook.QUESTION_CREATED, springSecurityService.currentUser)

            request.withFormat {
                form multipartForm {
                    flash.message = message(code: 'default.created.message', args: [message(code: 'question.label', default: 'Question'), question.id])
                    redirect question
                }
                '*' { respond question, [status: CREATED] }
            }
        } else {
            redirect action: create, model: [question: question]
        }
    }

    @Secured(['ROLE_USER', 'ROLE_ADMIN'])
    def edit(Question question) {
        def user = springSecurityService.currentUser

        if(!SpringSecurityUtils.ifAllGranted('ROLE_ADMIN') && user.id != question.userId)
            redirect controller: "login", action: "denied"

        respond question, model : [allTags: Tag.listOrderByLabel(),
                                   selectedTags: question.tags]
    }

    @Transactional
    def update(Question question) {
        if (question == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (question.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond question.errors, view: 'edit'
            return
        }

        question.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'question.label', default: 'Question'), question.id])
                redirect question
            }
            '*' { respond question, [status: OK] }
        }
    }

    @Transactional
    def delete(Question question) {

        if (question == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        question.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'question.label', default: 'Question'), question.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    @Transactional
    def close(Question question) {
        if (question == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        question.isClosed = true

        if (question.save(flush: true, failOnError: true)) {
            request.withFormat {
                form multipartForm {
                    flash.message = message(code: 'default.closed.message', args: [message(code: 'question.label', default: 'Question')])
                    redirect question
                }
                '*' { respond question, [status: UPDATED] }
            }
        } else {
            redirect action: show, model: [question: question]
        }
    }

    @Transactional
    def addAnswer(Answer answer) {
        answer.user = springSecurityService.currentUser
        answer.rate = 0
        if (answer.save(flush: true, failOnError: true)) {
            //Hook : Question created
            hookService.manageHook(EnumHook.ANSWER_CREATED, springSecurityService.currentUser)

            request.withFormat {
                form multipartForm {
                    flash.message = message(code: 'default.created.message', args: [message(code: 'answer.label', default: 'Answer')])
                    redirect action: "show", id: answer.question.id, model: [question: answer.question]
                }
                '*' { respond answer.question, [status: UPDATED] }
            }
        }
    }

    @Transactional
    def voteUp(Question question) {
        vote(question, 1);
    }

    @Transactional
    def voteDown(Question question) {
        vote(question, -1);
    }

    def vote(Question question, int value) {
        if (question == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        question.rate += value;

        if (question.save(flush: true, failOnError: true)) {
            request.withFormat {
                form multipartForm {
                    flash.message = message(code: 'default.vote.message', args: [message(code: 'question.label', default: 'Question')])
                    redirect question
                }
                '*' { respond question, [status: UPDATED] }
            }
        } else {
            redirect action: show, model: [question: question]
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.error = message(code: 'default.not.found.message', args: [message(code: 'question.label', default: 'Question'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }

}
