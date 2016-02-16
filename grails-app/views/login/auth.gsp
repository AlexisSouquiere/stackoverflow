<%--
  Created by IntelliJ IDEA.
  User: alexis
  Date: 16/02/2016
  Time: 09:20
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
            <h1><g:message code="question.page.index.title"/></h1>
            <div id="login">
                <div class="inner">
                    <div class="fheader"><g:message code='springSecurity.login.header'/></div>

                    <g:if test='${flash.message}'>
                        <div class="login_message">${flash.message}</div>
                    </g:if>

                    <form action="${postUrl ?: '/login/authenticate'}" method="POST" id="loginForm" class="cssform" autocomplete="off">
                        <p>
                            <label for="username"><g:message code='springSecurity.login.username.label'/>:</label>
                            <input type="text" class="text_" name="${usernameParameter ?: 'username'}" id="username"/>
                        </p>

                        <p>
                            <label for="password"><g:message code='springSecurity.login.password.label'/>:</label>
                            <input type="password" class="text_" name="${passwordParameter ?: 'password'}" id="password"/>
                        </p>

                        <p id="remember_me_holder">
                            <input type="checkbox" class="chk" name="${rememberMeParameter ?: 'remember-me'}" id="remember_me" <g:if test='${hasCookie}'>checked="checked"</g:if>/>
                            <label for="remember_me"><g:message code='springSecurity.login.remember.me.label'/></label>
                        </p>

                        <p>
                            <input type="submit" id="submit" value="${message(code: 'springSecurity.login.button')}"/>
                        </p>
                    </form>
                </div>
            </div>
            <script>
                (function() {
                    document.forms['loginForm'].elements['${usernameParameter ?: 'username'}'].focus();
                })();
            </script>
        </section>
    </body>
</html>