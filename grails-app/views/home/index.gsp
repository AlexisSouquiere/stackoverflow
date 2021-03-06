<%--
  Created by IntelliJ IDEA.
  User: Cedric
  Date: 06/01/2016
  Time: 16:06
--%>

<%@ page import="fr.isima.grails.Question" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>
    <title><g:message code="home.page.index.title"/> - <g:message code="stackoverflow.title"/></title>
</head>

<body>
<g:render template="/templates/headerBar"/>

    <!-- Main content -->
    <section class="content">
        <h1><g:message code="home.page.h1.title"/></h1>
        <table class="table table-responsive">
            <g:each var="question" in="${questions}">
                <g:render template="/question/listItem" model="${[question: question]}"/>
            </g:each>
        </table>
    </section>
    <!-- /.content -->
</body>
</html>