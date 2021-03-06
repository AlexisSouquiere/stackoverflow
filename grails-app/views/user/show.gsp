<%--
  Created by IntelliJ IDEA.
  User: Cedric
  Date: 25/01/2016
  Time: 10:24
--%>

<%@ page import="fr.isima.grails.User" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>${user.username} - <g:message code="stackoverflow.title"/></title>
</head>

<body>
<!-- Header bar -->
<g:render template="/templates/headerBar"/>

<!-- Main content -->
<section class="content">
    <h1>${user.username}</h1>
    <hr/>

    <div class="row">
        <!-- Profile -->
        <section class="col-md-11 indent">
            <h2><g:message code="user.page.profile"/></h2><hr/>
            <g:render template="/user/details" model="${[user: user]}" var="user"/>

            <g:link resource="/user" action="edit" id="${user.id}">
                <g:message code="user.show.edit.profile"/>
            </g:link>
        </section>

        <!-- Badges -->
        <section class="col-md-11 indent">
            <h2><g:message code="user.page.badges"/></h2><hr/>
            <div class="row so-badge">
                <g:each var="badge" in="${user.badges}">
                    <g:render template="/user/badge/listItem" model="${[badge: badge]}" var="badge"/>
                </g:each>
            </div>
        </section>
        <!-- /Badges -->

        <!-- Answers -->
        <section class="col-md-11 indent">
            <h2><g:message code="user.page.answers"/></h2><hr/>
            <table class="table table-responsive">
                <g:each var="answer" in="${user.answers}">
                    <g:render template="/user/answer/listItem" model="${[answer: answer]}" var="answer"/>
                </g:each>
            </table>
        </section>
        <!-- /Answers -->

        <!-- Questions -->
        <section class="col-md-11 indent">
            <h2><g:message code="user.page.questions"/></h2><hr/>
            <table class="table table-responsive">
                <g:each var="question" in="${user.questions}">
                    <g:render template="/user/question/listItem" model="${[question: question]}" var="question"/>
                </g:each>
            </table>
        </section>
        <!-- /Questions -->

        <!-- /Main bloc -->
    </div>
</section>
<!-- /.content -->
</body>
</html>