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
        <button class="btn btn-default btn-flat btn-active">
            <g:link resource="/question" action="index"><g:message code="stackoverflow.header.bar.questions"/></g:link>
        </button>
        <button class="btn btn-default btn-flat btn-inactive"><g:message code="stackoverflow.header.bar.tags"/></button>
        <button class="btn btn-default btn-flat btn-inactive"><g:message
                code="stackoverflow.header.bar.users"/></button>
        <button class="btn btn-default btn-flat btn-inactive"><g:message
                code="stackoverflow.header.bar.badges"/></button>
        <button class="btn btn-default btn-flat btn-inactive">
            <g:link resource="/question" action="create"><g:message
                    code="stackoverflow.header.bar.question.add"/></g:link>
        </button>
    </div>
</section>