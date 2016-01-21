<g:form controller="question" method="POST">
    <g:textArea name="description" rows="5" cols="40" value="" class="wysihtml5"/>
    <br/>
    <g:hiddenField name="question.id" value="${question.id}"/>
    <g:actionSubmit action="addAnswer" value="${message(code: 'answer.add.submit')}"
                    class="btn btn-primary"/>
</g:form>