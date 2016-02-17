<%--
  Created by IntelliJ IDEA.
  User: alexis
  Date: 17/02/2016
  Time: 18:29
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
    <h1><g:message code='user.edit.label'/> ${user.username}</h1>
    <hr/>

    <div class="row">
        <!-- Profile -->
        <section class="col-md-11 indent">
        <s2ui:form type='update' beanName='user' focus='username' class='button-style'>
            <div class="form-group">
                <label for="username"><g:message code='user.username'/>:</label>
                <g:field type="text" name="username" value="${user?.username}" class="form-control"/>
            </div>
            <div class="form-group">
                <label for="email"><g:message code='user.email'/>:</label>
                <g:field type="text" name="email" value="${user?.email}" class="form-control"/>
            </div>
            <div class="form-group">
                <label for="password"><g:message code='user.password'/>:</label>
                <g:field type="password" name="password" value="${user?.password}" class="form-control"/>
            </div>
            <sec:ifAnyGranted roles='ROLE_ADMIN'>
                <div class="form-group">
                    <label for="accountLocked"><g:message code='user.account.locked'/>:</label>
                    <g:checkBox name="accountLocked" value="${user?.accountLocked}"/>
                </div>
            </sec:ifAnyGranted>

            <div style="display:none">
                    <g:each var='entry' in='${roleMap}'>
                        <g:set var='roleName' value='${uiPropertiesStrategy.getProperty(entry.key, 'authority')}'/>
                        <g:checkBox name='${roleName}' value='${entry.value}'/>
                    </g:each>
            </div>

            <div class="form-group">
                <input type="submit" id="submit" class="btn btn-warning" value="${message(code: 'user.save')}"/>
            </div>
        </s2ui:form>
        </section>
        <!-- /Profile -->
        <!-- /Main bloc -->
    </div>
</section>
<!-- /.content -->

<script>
    $(function() {
        $("#tabs").css('display', 'block');
    });
</script>
</body>
</html>