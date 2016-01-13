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
                <g:render template="/templates/item" model="${[item: question]}"/>
            </div>

        <!-- Answers -->
            <g:each var="answer" in="${question.answers}">
                <div class="row">
                    <hr/>
                    <g:render template="/templates/item" model="${[item: answer]}"/>
                </div>
            </g:each>

            <hr/>

            <!-- Your Answer -->
            <div class="row">
                <section class="col-md-12">
                    <h2><g:message code="answer.add.title"/></h2>
                    <g:form controller="question" method="POST">
                        <g:textArea name="description" rows="5" cols="40" value=""/>
                        <br/>
                        <g:hiddenField name="question.id" value="${question.id}"/>
                        <g:actionSubmit action="addAnswer" value="${message(code: 'answer.add.submit')}"
                                        class="btn btn-primary"/>
                    </g:form>
                </section>
            </div>
            <!-- /Your Answer -->


            <!-- /Main bloc -->
        </section>

        <!-- Rate bloc -->
        <section class="right-bloc col-md-3">
            <table>
                <tr>
                    <td>asked</td>
                    <td>1 year ago</td>
                </tr>
                <tr>
                    <td>viewed</td>
                    <td>662 times</td>
                </tr>
                <tr>
                    <td>active</td>
                    <td>today</td>
                </tr>
            </table>
        </section>
        <!-- /Rate bloc -->
    </div>
</section>
<script type="text/javascript">
    CKEDITOR.replace('description');
</script>
<!-- /.content -->
</body>
</html>