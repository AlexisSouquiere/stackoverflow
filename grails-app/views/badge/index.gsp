<%--
  Created by IntelliJ IDEA.
  User: Cedric
  Date: 20/01/2016
  Time: 22:50
--%>

<%@ page import="fr.isima.grails.Badge" %>
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
                <h1><g:message code="badge.page.index.title"/></h1>
            </div>
        </div>
        <hr/>
        <div class="row">
            <div class="col-md-12">
                <p><g:message code="badge.page.intro"/></p>
            </div>
        </div>
        <br/>
        <div class="row badges">
            <div class="col-md-12">
                <%-- Grid of all badges --%>
                <g:each var="badge" in="${badges}">
                    <hr/>
                    <g:render template="/badge/listItem" model="${[badge: badge]}"/>
                </g:each>
            </div>
        </div>
    </section>
    <%-- /.content --%>
</body>
</html>