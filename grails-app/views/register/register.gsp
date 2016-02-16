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
                <s2ui:form beanName='registerCommand'>
                    <g:if test='${emailSent}'>
                        <br/>
                        <g:message code='spring.security.ui.register.sent'/>
                    </g:if>
                    <g:else>
                        <br/>
                        <table>
                            <tbody>
                            <s2ui:textFieldRow name='username' size='40' labelCodeDefault='Username'/>
                            <s2ui:textFieldRow name='email' size='40' labelCodeDefault='E-mail'/>
                            <s2ui:passwordFieldRow name='password' size='40' labelCodeDefault='Password'/>
                            <s2ui:passwordFieldRow name='password2' size='40' labelCodeDefault='Password (again)'/>
                            </tbody>
                        </table>
                        <s2ui:submitButton elementId='submit' messageCode='spring.security.ui.register.submit'/>
                    </g:else>
                </s2ui:form>
            </s2ui:formContainer>
        </section>
    </body>
</html>