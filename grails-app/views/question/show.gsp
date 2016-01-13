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
<g:render template="/layouts/headerBar"/>

<!-- Main content -->
<section class="content">
    <h1>${question.title}</h1>
    <hr/>

    <div class="row">
        <!-- Rate bloc -->
        <div class="rate-bloc col-md-1">
            <asset:image src="/stackoverflow/arrow.png" class="arrow-up"/>
            <strong class="rate">3</strong>
            <asset:image src="/stackoverflow/arrow.png" class="arrow-down"/>
            <asset:image src="/stackoverflow/check.png" class="check"/>
        </div>
        <!-- /Rate bloc -->

        <!-- Question -->
        <section class="col-md-8">
            <!-- Content body -->
            <div class="content-body">
                ${question.description}
            </div>
            <!-- /Content body -->

            <!-- Tags bar -->
            <div class="tags-bar">
                <button class="tag">c#</button>
                <button class="tag">declaration</button>
                <button class="tag">literals</button>
                <button class="tag">variable-declaration</button>
            </div>
            <!-- /Tags bar -->

            <!-- Actions bar -->
            <div class="actions-bar">
                <!-- Edit -->
                <g:link resource="/question" action="edit" id="${question.id}"><g:message
                        code="question.show.edit"/></g:link>
                <!-- Close -->
                <g:if test="${!question.isClosed}">
                    <g:form controller="question" id="${question.id}" method="PUT">
                        <g:actionSubmit action="close" value="${message(code: 'question.show.close')}"/>
                    </g:form>
                </g:if>
                <!-- Delete -->
                <g:form controller="question" id="${question.id}" method="DELETE">
                    <g:actionSubmit action="delete" value="${message(code: 'question.show.delete')}"/>
                </g:form>
            </div>

            <div class="add-comment">
                <g:link resource="/question" action="show" id="${question.id}"><g:message
                        code="question.show.comment.add"/></g:link>
            </div>
            <!-- /Actions bar -->

        </section>
        <!-- /Question -->

        <!-- Rate bloc -->
        <div class="right-bloc col-md-3">
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
        </div>
        <!-- /Rate bloc -->
    </div>
</section>
<!-- /.content -->
</body>
</html>