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
    <title><g:message code="stackoverflow.title"/> - <g:message code="question.page.index.title"/></title>
</head>

<body>
<g:render template="/layouts/headerBar"/>

    <!-- Main content -->
    <section class="content">
        <h1><g:message code="question.page.index.title"/></h1>
        <table class="table">
            <g:each var="question" in="${questions}">
                <tr>
                    <td>0 <g:message code="question.index.votes"/></td>
                    <td>0 <g:message code="question.index.answers"/></td>
                    <td>1 <g:message code="question.index.views"/></td>
                    <td><g:link resource="/question" action="show" id="${question.id}">${question.title}</g:link></td>
                </tr>
            </g:each>
        </table>
    </section>
    <!-- /.content -->
</body>
</html>