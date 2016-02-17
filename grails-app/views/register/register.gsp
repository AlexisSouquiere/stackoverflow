<%--
  Created by IntelliJ IDEA.
  User: alexis
  Date: 16/02/2016
  Time: 11:36
--%>
<%@ page import="fr.isima.grails.Question" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>
    <title><g:message code="stackoverflow.title"/> - <g:message code="question.page.index.title"/></title>
</head>

<body>
<g:render template="/templates/headerBar"/>

<!-- Main content -->
<section class="content">
    <s2ui:formContainer type='register' focus='username' width='800px'>
        <s2ui:form beanName='registerCommand' class="col-md-6">
            <g:if test='${emailSent}'>
                <br/>
                <g:message code='spring.security.ui.register.sent'/>
            </g:if>
            <g:else>
                <br/>
                <div class="form-group">
                    <label for="username"><g:message code='springSecurity.register.username.label'/>:</label>
                    <input type="text" value class="form-control" name="username" id="username"/>
                </div>
                <div class="form-group">
                    <label for="email"><g:message code='springSecurity.register.email.label'/>:</label>
                    <input type="text" value class="form-control" name="email" id="email"/>
                </div>
                <div class="form-group">
                    <label for="password"><g:message code='springSecurity.register.password.label'/>:</label>
                    <input type="password" value class="form-control" name="password" id="password"/>
                </div>
                <div class="form-group">
                    <label for="password2"><g:message code='springSecurity.register.password.again.label'/>:</label>
                    <input type="password" value class="form-control" name="password2" id="password2"/>
                </div>

                <input type="submit" id="submit" class="btn btn-warning" value="${message(code: 'springSecurity.register.button')}"/>
            </g:else>
        </s2ui:form>
    </s2ui:formContainer>
</section>
</body>
</html>