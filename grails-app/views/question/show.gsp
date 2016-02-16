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
    <title>${question.title} - <g:message code="stackoverflow.title"/></title>
</head>

<body>
<!-- Header bar -->
<g:render template="/templates/headerBar"/>

<!-- Main content -->
<section class="content">
    <h1>${question.title}</h1>
    <hr/>

    <div class="row">
        <section class="col-md-9">
            <!-- Question -->
            <div class="row">
                <g:render template="/question/item" model="${[item: question]}"/>
            </div>

            <!-- Answers -->
            <g:each var="answer" in="${question.answers}">
                <div class="row">
                    <hr/>
                    <g:render template="/answer/item" model="${[item: answer]}"/>
                </div>
            </g:each>
            <!-- /Answers -->

            <!-- Your Answer -->
            <g:if test="${!question.isClosed}">
                <hr/>
                <div class="row">
                    <section class="col-md-12">
                        <h2><g:message code="answer.add.title"/></h2>
                        <sec:ifAnyGranted roles='ROLE_USER, ROLE_ADMIN'>
                            <g:render template="/answer/create" model="${[question: question]}"/>
                        </sec:ifAnyGranted>
                        <sec:ifNotLoggedIn>
                            <a href="/login/authenticate">test</a>
                        </sec:ifNotLoggedIn>
                    </section>
                </div>
            </g:if>
            <!-- /Your Answer -->


            <!-- /Main bloc -->
        </section>

        <!-- Rate bloc -->
        <section class="right-bloc col-md-3">
            <g:render template="/question/details" model="${[question: question]}"/>
        </section>
        <!-- /Rate bloc -->
    </div>
</section>
<!-- /.content -->
</body>
</html>