<g:form controller="comment" method="POST" class="form-horizontal comment-form">
    <g:hiddenField name="question.id" value="${question?.id}"/>
    <g:hiddenField name="answer.id" value="${answer?.id}"/>
    <%-- Description --%>
    <div class="row">
        <div class="col-md-10">
            <g:textArea name="description" class="comment-field" value="" />
        </div>
        <div class="col-md-2">
            <g:actionSubmit action="save" value="${message(code: 'question.comment.add.btn.label')}" class="btn"/>
        </div>
    </div>
</g:form>