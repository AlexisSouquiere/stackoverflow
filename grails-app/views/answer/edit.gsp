<%--
  Created by IntelliJ IDEA.
  User: Cedric
  Date: 06/01/2016
  Time: 19:29
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>
    <title><g:message code="answer.page.edit.title"/> - <g:message code="stackoverflow.title"/></title>
</head>

<body>
<%-- Header bar --%>
<g:render template="/templates/headerBar"/>

<%-- Main content --%>
<section class="content">
    <div class="row">
        <%-- Question --%>
        <section class="col-md-10 col-md-offset-1">
            <h1><g:message code="answer.page.edit.h1"/></h1>
            <g:form controller="answer" method="PUT" id="${answer?.id}" class="form-horizontal">
                <%-- Description --%>
                <div class="form-group">
                    <g:textArea name="description" value="${answer?.description}" id="summernote" />
                </div>

                <div class="row">
                    <div class="col-sm-1">
                        <g:actionSubmit action="update" value="${message(code: 'answer.edit.save.label')}"
                                        class="btn btn-primary"/>
                    </div>
                </div>
            </g:form>
        </section>
        <%-- /Question --%>
    </div>
</section>
<%-- /Main content --%>
</body>
</html>