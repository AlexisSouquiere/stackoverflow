<!-- Content Header (Page header) -->
<section class="content-header">
    <g:if test="${flash.error}">
        <div class="alert alert-danger" role="alert">
            ${flash.error}
        </div>
    </g:if>
    <g:if test="${flash.message}">
        <div class="alert alert-success" role="alert">
            ${flash.message}
        </div>
    </g:if>
    <asset:image src="/stackoverflow/so-logo.png" class="logo"/>
    <div class="button-bar">
        <g:link resource="/question" action="index">
            <button class="btn btn-default btn-flat btn-active"><g:message code="stackoverflow.header.bar.questions"/></button>
        </g:link>
        <g:link resource="/tag" action="index">
            <button class="btn btn-default btn-flat btn-inactive"><g:message code="stackoverflow.header.bar.tags"/></button>
        </g:link>
        <sec:ifAnyGranted roles='ROLE_ADMIN'>
            <button class="btn btn-default btn-flat btn-inactive">
                <g:message
                    code="stackoverflow.header.bar.users"/>
            </button>
        </sec:ifAnyGranted>
        <button class="btn btn-default btn-flat btn-inactive">
            <g:message
                code="stackoverflow.header.bar.badges"/>
        </button>
        <g:link resource="/question" action="create">
            <button class="btn btn-default btn-flat btn-inactive"><g:message code="stackoverflow.header.bar.question.add"/></button>
        </g:link>
    </div>
</section>