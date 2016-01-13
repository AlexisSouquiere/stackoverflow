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
    <title><g:message code="question.page.create.title"/> - <g:message code="stackoverflow.title"/></title>
</head>

<body>
<!-- Header bar -->
<g:render template="/layouts/headerBar"/>

<!-- Main content -->
<section class="content">
    <div class="row">
        <!-- Question -->
        <section class="col-md-8 col-md-offset-1">
            <g:form controller="question" method="POST" id="${question.id}">
                <!-- Content body -->
                <div class="content-body">
                    <!-- Title -->
                    <div class="form-group">
                        <label for="title"><g:message code="question.title.label"/></label>
                        <g:field type="text" name="title" value=""/>
                    </div>
                    <!-- Description -->
                    <div class="form-group">
                        <g:textArea name="description" rows="5" cols="40" value=""/>
                    </div>

                </div>
                <!-- /Content body -->

                <!-- Tags bar -->
                <div class="tags-bar form-group">
                </div>
                <!-- /Tags bar -->

                <g:actionSubmit action="save" value="${message(code: 'question.edit.save.label')}"
                                class="btn btn-primary"/>
            </g:form>
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
<script type="text/javascript">
    CKEDITOR.replace('description');
</script>
<!-- /.content -->
</body>
</html>