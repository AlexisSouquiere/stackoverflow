<%--
  Created by IntelliJ IDEA.
  User: Cedric
  Date: 20/01/2016
  Time: 22:50
--%>

<%@ page import="fr.isima.grails.Tag" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>
    <title><g:message code="tag.page.index.title"/> - <g:message code="stackoverflow.title"/></title>
</head>

<body>
    <g:render template="/templates/headerBar"/>

    <%-- Main content --%>
    <section class="content">
        <div class="row">
            <div class="col-md-12">
                <h1><g:message code="tag.page.index.title"/></h1>
            </div>
        </div>
        <hr/>
        <div class="row">
            <div class="col-md-12">
                <p><g:message code="tag.page.intro"/></p>
            </div>
        </div>
        <div class="row tags">
            <div class="col-md-1"></div>
        <%-- Grid of all tags --%>
        <g:each var="tag" in="${tags}" status="i">
            <%-- End --%>
            <g:if test="${(i+1)%6 == 0 && (i+1) == tags.size()}">
                </div>
            </g:if>
            <g:else>
                <%-- Begin of the row --%>
                <g:if test="${(i+1)%6 == 0}">
                    </div>
                    <div class="row tags">
                        <div class="col-md-1"></div>
                </g:if>
                <g:else>
                    <%-- Tag --%>
                    <div class="col-md-2 tag-cell">
                        <div class="tag">
                            <g:link resource="/question" action="indexByTag" id="${tag.id}">${tag.label}</g:link>
                        </div>
                        <p>
                            ${tag.questions.size()} <g:message code="tag.page.question.label" args="${[tag.questions.size()]}" />
                        </p>
                    </div>
                </g:else>
            </g:else>
        </g:each>
    </section>
    <%-- /.content --%>
</body>
</html>