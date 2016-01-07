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
    <title>${question.title} - StackOverflow</title>
</head>

<body>
<!-- Header bar -->
<g:render template="/layouts/headerBar"/>

<!-- Main content -->
<section class="content">
    <h1>${question.title}</h1>
    <hr/>

    <!-- Rate bloc -->
    <!-- /Rate bloc -->

    <!-- Question -->
    <section>
        ${question.description}
    </section>
</section>
<!-- /.content -->
</body>
</html>