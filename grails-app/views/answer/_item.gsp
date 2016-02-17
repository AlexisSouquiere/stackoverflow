<!-- Rate bloc -->
<div class="rate-bloc col-md-2">
    <g:form controller="answer" id="${item.id}" method="PUT">
        <g:actionSubmitImage value="${message(code: 'question.vote.up')}" action="voteUp" src="${resource(dir: '/assets/stackoverflow', file: 'arrow.png')}" class="arrow-up"/>
        <strong class="rate">${item.rate}</strong>
        <g:actionSubmitImage value="${message(code: 'question.vote.down')}" action="voteDown" src="${resource(dir: '/assets/stackoverflow', file: 'arrow.png')}" class="arrow-down"/>
    </g:form>
</div>
<!-- /Rate bloc -->

<!-- Main bloc -->
<section class="col-md-10">
    <!-- Content body -->
    <div class="content-body">
    ${raw(item.description)}
    </div>
    <!-- /Content body -->

    <g:if test="${!question.isClosed}">
        <sec:ifAnyGranted roles='ROLE_USER, ROLE_ADMIN'>
            <g:if test="isUserThatCreatedTheQuestion(${question})">
                <!-- Actions bar -->
                <div class="actions-bar">
                    <!-- Edit -->
                    <g:link resource="/question" action="edit" id="${question.id}"><g:message
                            code="question.show.edit"/></g:link>
                    <!-- Delete -->
                    <g:form controller="question" id="${question.id}" method="DELETE">
                        <g:actionSubmit action="delete" value="${message(code: 'question.show.delete')}"/>
                    </g:form>
                </div>
            </g:if>
        </sec:ifAnyGranted>

        <%-- Comments --%>
        <div class="comments-list">
            <g:render template="/comment/index" model="${[comments: item.comments]}" var="comments"/>
        </div>

        <sec:ifAnyGranted roles='ROLE_USER, ROLE_ADMIN'>
        <%-- Add comment --%>
            <div class="add-comment">
                <g:message code="question.show.comment.add"/>
            </div>
            <g:render template="/comment/create" bean="${item}" var="item"/>
        </sec:ifAnyGranted>
        <!-- /Actions bar -->
    </g:if>
</section>