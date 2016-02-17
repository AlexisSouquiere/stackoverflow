package fr.isima.grails

import grails.transaction.Transactional

import static org.springframework.http.HttpStatus.*

@Transactional(readOnly = true)
class CommentController {

    static allowedMethods = [save       : "POST"
    ]

    def springSecurityService

    def create() {
        respond new Comment(params)
    }

    @Transactional
    def save() {
        Comment comment = new Comment(params)
        comment.user = springSecurityService.currentUser

         if (comment == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (comment.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond comment.errors, view: 'create'
            return
        }

        if (comment.save(flush: true, failOnError: true)) {
            flash.message = message(code: 'default.created.message', args: [message(code: 'comment.label', default: 'Comment'), comment.id])
        } else {
            flash.error = message(code: 'default.error.created.message', args: [message(code: 'comment.label', default: 'Comment'), comment.id])
        }

        Question question = comment.question == null ? Question.get(comment.answer.question.id) : Question.get(comment.question.id)
        redirect controller: "question", action: "show",id: question.id, params: [question: question]
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
