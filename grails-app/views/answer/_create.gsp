<g:form controller="answer" method="POST" class="answerForm">
    <g:textArea name="description" value="" id="summernote"/>
    <br/>
    <g:hiddenField name="question.id" value="${question.id}"/>
    <g:actionSubmit action="save" value="${message(code: 'answer.add.submit')}"
                    class="btn btn-primary btn-save-answer"/>
</g:form>