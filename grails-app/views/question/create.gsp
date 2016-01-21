<%--
  Created by IntelliJ IDEA.
  User: Cedric
  Date: 06/01/2016
  Time: 19:29
--%>

<%@ page import="fr.isima.grails.Question" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>
    <title><g:message code="question.page.create.title"/> - <g:message code="stackoverflow.title"/></title>
</head>

<body>
    <%-- Header bar --%>
    <g:render template="/templates/headerBar"/>

    <%-- Main content --%>
    <section class="content question-create">
        <div class="row">
            <%-- Question --%>
            <section class="col-md-10 col-md-offset-1">
                <g:form controller="question" method="POST" id="${question?.id}" class="form-horizontal">
                    <%-- Title --%>
                    <div class="form-group">
                        <label for="title" class="col-sm-1 control-label"><g:message code="question.title.label"/></label>
                        <div class="col-sm-11">
                            <g:field type="text" name="title" value="${question?.title}" class="form-control"/>
                        </div>
                    </div>
                    <%-- Description --%>
                    <div class="form-group">
                        <g:textArea name="description" rows="20" value="${question?.description}" class="wysihtml5" />
                    </div>

                    <%-- Tags bar --%>
                    <div class="form-group">
                        <label for="tags" class="col-sm-1 control-label"><g:message code="question.tags.label"/></label>
                        <div class="col-sm-11">
                            <g:select name="tags" id="tags" from="${allTags}" optionKey="id" optionValue="label" multiple="true" class="form-control select2" />
                        </div>
                    </div>
                    <%-- /Tags bar --%>

                    <div class="row">
                        <div class="col-sm-1">
                            <g:actionSubmit action="save" value="${message(code: 'question.edit.save.label')}"
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