package fr.isima.grails

import grails.transaction.Transactional

import static org.springframework.http.HttpStatus.*

@Transactional(readOnly = true)
class QuestionController {

    static allowedMethods = [save  : "POST",
                             update: "PUT",
                             delete: "DELETE",
                             show  : "GET",
                             edit  : "GET",
                             close : "PUT"
    ]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond questions: Question.list(params), model: [questionCount: Question.count()]
    }

    def show(Question question) {
        respond question
    }

    def create() {
        respond new Question(params)
    }

    @Transactional
    def save() {
        Question question = new Question(params)
        User user = new User()
        user.id = 1
        question.isClosed = false
        question.createdAt = new Date()
        question.user = user

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

    def edit(Question question) {
        respond question
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
