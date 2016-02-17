<g:form controller="comment" method="POST" class="form-horizontal comment-form">
    <g:if test="${item instanceof fr.isima.grails.Question}">
        <g:hiddenField name="question.id" value="${item?.id}"/>
    </g:if>
    <g:if test="${item instanceof fr.isima.grails.Answer}">
        <g:hiddenField name="answer.id" value="${item?.id}"/>
    </g:if>
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