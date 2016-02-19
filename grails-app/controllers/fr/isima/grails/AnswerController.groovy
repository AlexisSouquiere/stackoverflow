package fr.isima.grails

import grails.transaction.Transactional

import static org.springframework.http.HttpStatus.*

@Transactional(readOnly = true)
class AnswerController {

    static allowedMethods = [save     : "POST",
                             update   : "PUT",
                             delete   : "DELETE",
                             show     : "GET",
                             edit     : "GET",
                             close    : "PUT",

                             addAnswer: "POST",
                             voteUp   : "PUT",
                             VoteDown : "PUT"
    ]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond answers: Answer.list(params), model: [answerCount: Answer.count()]
    }

    @Transactional
    def update(Answer answer) {
        if (answer == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (answer.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond answer.errors, view: 'edit'
            log.error "Answer contains errors"
            return
        }

        answer.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'answer.label', default: 'Answer'), answer.id])
                redirect answer
            }
            '*' { respond answer, [status: OK] }
        }
    }

    @Transactional
    def delete(Answer answer) {

        if (answer == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        answer.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'answer.label', default: 'Answer'), answer.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    @Transactional
    def save(Answer answer) {
        answer.user = springSecurityService.currentUser

        if (answer.save(flush: true, failOnError: true)) {
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
    def voteUp(Answer answer) {
        vote(answer, 1);
        log.info "Vote up - Answer " + answer.id
    }

    @Transactional
    def voteDown(Answer answer) {
        vote(answer, -1);
        log.info "Vote down - Answer " + answer.id
    }

    def vote(Answer answer, int value) {
        if (answer == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        answer.rate += value;

        if (answer.save(flush: true, failOnError: true)) {
            request.withFormat {
                form multipartForm {
                    flash.message = message(code: 'default.vote.message', args: [message(code: 'answer.label', default: 'Answer')])
                    redirect(controller: "question", action: "show", id: answer.question.id)
                }
                '*' { respond answer, [status: UPDATED] }
            }
        } else {
            log.error "An error occurred during vote for answer " + answer.id
            redirect action: show, model: [answer: answer]
        }
    }

    protected void notFound() {
        log.info "Answer not found, rollback"
        request.withFormat {
            form multipartForm {
                flash.error = message(code: 'default.not.found.message', args: [message(code: 'answer.label', default: 'Answer'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }


}
