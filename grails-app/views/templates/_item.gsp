<!-- Rate bloc -->
<div class="rate-bloc col-md-2">
    <asset:image src="/stackoverflow/arrow.png" class="arrow-up"/>
    <strong class="rate">3</strong>
    <asset:image src="/stackoverflow/arrow.png" class="arrow-down"/>
    <asset:image src="/stackoverflow/check.png" class="check"/>
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
    <button class="tag">c#</button>
    <button class="tag">declaration</button>
    <button class="tag">literals</button>
    <button class="tag">variable-declaration</button>
</div>
<!-- /Tags bar -->

<!-- Actions bar -->
<div class="actions-bar">
    <!-- Edit -->
    <g:link resource="/question" action="edit" id="${question.id}"><g:message
            code="question.show.edit"/></g:link>
    <!-- Close -->
    <g:if test="${!question.isClosed}">
        <g:form controller="question" id="${question.id}" method="PUT">
            <g:actionSubmit action="close" value="${message(code: 'question.show.close')}"/>
        </g:form>
    </g:if>
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