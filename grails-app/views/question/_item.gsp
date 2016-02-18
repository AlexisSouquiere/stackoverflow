<!-- Rate bloc -->
<div class="rate-bloc col-md-2">
    <g:form controller="question" id="${question.id}" method="PUT">
        <g:actionSubmitImage value="${message(code: 'question.vote.up')}" action="voteUp" src="${resource(dir: '/assets/stackoverflow', file: 'arrow.png')}" class="arrow-up"/>
        <strong class="rate">${question.rate}</strong>
        <g:actionSubmitImage value="${message(code: 'question.vote.down')}" action="voteDown" src="${resource(dir: '/assets/stackoverflow', file: 'arrow.png')}" class="arrow-down"/>
    </g:form>
    <g:if test="${question.getHasBest()}">
        <asset:image src="/stackoverflow/check.png" class="check"/>
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

<!-- Tags bar -->
<div class="tags-bar">
    <g:each var="tag" in="${question.tags}">
        <g:link resource="/question" action="indexByTag" id="${tag.id}"><button class="tag">${tag.label}</button></g:link>
    </g:each>
</div>
<!-- /Tags bar -->


<div style="position:relative; min-height:20px">
    <g:if test="${!question.isClosed}">
        <sec:ifAnyGranted roles='ROLE_USER, ROLE_ADMIN'>
            <sec:access expression="${sec.loggedInUserInfo(field: 'id').toLong() == question.userId} || hasRole('ROLE_ADMIN')">
                <!-- Actions bar -->
                <div class="actions-bar">
                    <!-- Edit -->
                    <g:link resource="/question" action="edit" id="${question.id}"><g:message
                            code="question.show.edit"/></g:link>
                    <!-- Close -->
                    <g:form controller="question" id="${question.id}" method="PUT">
                        <g:actionSubmit action="close" value="${message(code: 'question.show.close')}"/>
                    </g:form>
                    <!-- Delete -->
                    <g:form controller="question" id="${question.id}" method="DELETE">
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
            <g:link resource="/user" action="show" id="${question.user.id}">${question.user.username}</g:link>
        </div>
    </div>

    <%-- Comments --%>
    <div class="comments-list">
        <g:render template="/comment/index" model="${[comments: question.comments]}" var="comments"/>
    </div>

    <sec:ifAnyGranted roles='ROLE_USER, ROLE_ADMIN'>
        <%-- Add comment --%>
        <div class="add-comment">
            <g:message code="question.show.comment.add"/>
        </div>
        <g:render template="/comment/create" bean="${question}" var="item"/>
    </sec:ifAnyGranted>

    <!-- /Actions bar -->