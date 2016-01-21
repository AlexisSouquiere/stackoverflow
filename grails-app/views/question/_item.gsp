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

<g:if test="${!question.isClosed}">
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

    <div class="add-comment">
        <g:link resource="/question" action="show" id="${question.id}"><g:message
                code="question.show.comment.add"/></g:link>
    </div>
    <!-- /Actions bar -->
</g:if>