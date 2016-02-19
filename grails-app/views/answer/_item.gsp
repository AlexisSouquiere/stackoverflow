<!-- Rate bloc -->
<div class="rate-bloc col-md-2">
    <g:form controller="answer" id="${item.id}" method="PUT">
        <sec:ifLoggedIn>
            <sec:access expression="${sec.loggedInUserInfo(field: 'id').toLong() != item.userId} || hasRole('ROLE_ADMIN')">
                <g:actionSubmitImage value="${message(code: 'question.vote.up')}" action="voteUp"
                                     src="${resource(dir: '/assets/stackoverflow', file: 'arrow.png')}"
                                     class="arrow-up"/>
            </sec:access>
        </sec:ifLoggedIn>
        <strong class="rate">${item.rate}</strong>
        <sec:ifLoggedIn>
            <sec:access expression="${sec.loggedInUserInfo(field: 'id').toLong() != item.userId} || hasRole('ROLE_ADMIN')">
                <g:actionSubmitImage value="${message(code: 'question.vote.down')}" action="voteDown"
                                     src="${resource(dir: '/assets/stackoverflow', file: 'arrow.png')}"
                                     class="arrow-down"/>
            </sec:access>
        </sec:ifLoggedIn>
    </g:form>
    <g:if test="${item.isBest}">
        <asset:image src="/stackoverflow/check.png" class="check"/>
    </g:if>
    <g:if test="${sec.loggedInUserInfo(field: 'id').toLong() == item.user.id && !item.question.isClosed && !item.question.hasBest}">
        <g:form controller="answer" id="${item.id}" method="PUT">
            <g:actionSubmitImage value="${message(code: 'answer.isbest')}" action="selectAsTheBest" src="${resource(dir: '/assets/stackoverflow', file: 'check-grey.png')}" class="check-disabled"/>
        </g:form>
    </g:if>
</div>
<!-- /Rate bloc -->

<!-- Main bloc -->
<section class="col-md-10">
    <!-- Content body -->
    <div class="content-body">
    ${raw(item.description)}
    </div>
    <!-- /Content body -->

    <div style="position:relative; min-height:20px">
        <g:if test="${!question.isClosed}">
            <sec:ifAnyGranted roles='ROLE_USER, ROLE_ADMIN'>
                <sec:access expression="${sec.loggedInUserInfo(field: 'id').toLong() == item.userId} || hasRole('ROLE_ADMIN')">
                    <!-- Actions bar -->
                    <div class="actions-bar">
                        <!-- Edit -->
                        <g:link resource="/answer" action="edit" id="${item.id}"><g:message
                                code="question.show.edit"/></g:link>
                        <!-- Delete -->
                        <g:form controller="answer" id="${item.id}" method="DELETE">
                            <g:actionSubmit action="delete" value="${message(code: 'question.show.delete')}"/>
                        </g:form>
                    </div>
                </sec:access>
            </sec:ifAnyGranted>
        </g:if>
        <div class="qr-info">
            <g:message code="home.page.question.item.dateauthor"
                       args="${[formatDate(format:'dd/MM/yyyy',date:question.dateCreated),
                                formatDate(format:'H:m',date:question.dateCreated)]}"/>
            <g:link resource="/user" action="show" id="${item.user.id}">${item.user.username}</g:link>
        </div>
    </div>

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
</section>