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
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>Top Questions</h1>
        <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
            <li class="active">Top Questions</li>
        </ol>
    </section>
    <section class="content-header">
        <ol class="button-bar">
            <li>
                <button class="btn btn-default btn-flat">Questions</button>
                <button class="btn btn-default btn-flat">Tags</button>
                <button class="btn btn-default btn-flat">Users</button>
                <button class="btn btn-default btn-flat">Badges</button>
            </li>
        </ol>
    </section>

    <!-- Main content -->
    <section class="content">
        <table class="table">
            <g:each var="question" in="${questions}">
                <tr>
                    <td>0 votes</td>
                    <td>0 answers</td>
                    <td>1 view</td>
                    <td>${question.title}</td>
                </tr>
            </g:each>
        </table>
    </section>
    <!-- /.content -->
</body>
</html>