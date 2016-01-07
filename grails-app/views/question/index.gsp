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
    <title>StackOverflow - Top Questions</title>
</head>

<body>
<g:render template="/layouts/headerBar"/>

    <!-- Main content -->
    <section class="content">
        <h1>Top Questions</h1>
        <table class="table">
            <g:each var="question" in="${questions}">
                <tr>
                    <td>0 votes</td>
                    <td>0 answers</td>
                    <td>1 view</td>
                    <td><g:link resource="/question" action="show" id="${question.id}">${question.title}</g:link></td>
                </tr>
            </g:each>
        </table>
    </section>
    <!-- /.content -->
</body>
</html>