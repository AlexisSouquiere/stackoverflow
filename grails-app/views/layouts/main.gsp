<!doctype html>
<html lang="fr">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title><g:layoutTitle default="${message(code: 'stackoverflow.title')}"/></title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <asset:stylesheet src="application.css"/>
    <asset:javascript src="application.js"/>
    <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">

    <g:layoutHead/>
</head>

<body class="skin-yellow sidebar-mini">
<div class="wrapper">

    <!-- Main Header -->
    <header class="main-header">

        <!-- Logo -->
        <g:link resource="/question" action="index" class="logo">
            <!-- mini logo for sidebar mini 50x50 pixels -->
            <span class="logo-mini"><b>S</b>tack</span>
            <!-- logo for regular state and mobile devices -->
            <span class="logo-lg"><b>S</b>tack<b>O</b>verflow</span>
        </g:link>

        <!-- Header Navbar -->
        <nav class="navbar navbar-static-top" role="navigation">
            <!-- Navbar Right Menu -->
            <div class="navbar-custom-menu">
                <ul class="nav navbar-nav">
                    <li>
                        <g:link controller="register" class="create-account">${message(code:'header.sign.in')}</g:link>
                    </li>
                    <sec:ifNotLoggedIn>
                        <li>
                            <g:link controller="login" action='index' class="login-link">${message(code:'header.login')}</g:link>
                        </li>
                    </sec:ifNotLoggedIn>
                    <sec:ifLoggedIn>
                        <li>
                            <form name="logout" method="POST" action="${createLink(controller:'logout') }">
                                <input type="submit" value="${message(code:'header.logout')}" class="btn btn-link" id="logout">
                            </form>
                        </li>
                        <!-- User Account Menu -->
                        <li class="dropdown user user-menu">
                            <!-- Menu Toggle Button -->
                            <g:link resource="/user" action="show" id="${sec.loggedInUserInfo(field: 'id')}" class="my-profile">
                                ${currentUser.username}
                            </g:link>
                        </li>
                    </sec:ifLoggedIn>
                </ul>
            </div>
        </nav>
    </header>

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper" style="min-height: 385px;">
        <g:layoutBody/>
    </div>
    <!-- /.content-wrapper -->

    <!-- Main Footer -->
    <footer class="main-footer">
        <!-- To the right -->
        <div class="pull-right hidden-xs">
            Grails project
        </div>
        <!-- Default to the left -->
        <strong>Developed by <a href="#">Alexis Souquiere</a> & <a href="#">Cédric Gagnevin</a>.</strong>
    </footer>

    <!-- Control Sidebar -->
    <aside class="control-sidebar control-sidebar-dark">
        <!-- Create the tabs -->
        <ul class="nav nav-tabs nav-justified control-sidebar-tabs">
            <li class="active"><a href="#control-sidebar-home-tab" data-toggle="tab"><i class="fa fa-home"></i></a></li>
            <li><a href="#control-sidebar-settings-tab" data-toggle="tab"><i class="fa fa-gears"></i></a></li>
        </ul>
        <!-- Tab panes -->
        <div class="tab-content">
            <!-- Home tab content -->
            <div class="tab-pane active" id="control-sidebar-home-tab">
                <h3 class="control-sidebar-heading">Recent Activity</h3>
                <ul class="control-sidebar-menu">
                    <li>
                        <a href="javascript::;">
                            <i class="menu-icon fa fa-birthday-cake bg-red"></i>

                            <div class="menu-info">
                                <h4 class="control-sidebar-subheading">Langdon's Birthday</h4>

                                <p>Will be 23 on April 24th</p>
                            </div>
                        </a>
                    </li>
                </ul>
                <!-- /.control-sidebar-menu -->

                <h3 class="control-sidebar-heading">Tasks Progress</h3>
                <ul class="control-sidebar-menu">
                    <li>
                        <a href="javascript::;">
                            <h4 class="control-sidebar-subheading">
                                Custom Template Design
                                <span class="label label-danger pull-right">70%</span>
                            </h4>

                            <div class="progress progress-xxs">
                                <div class="progress-bar progress-bar-danger" style="width: 70%"></div>
                            </div>
                        </a>
                    </li>
                </ul>
                <!-- /.control-sidebar-menu -->

            </div>
            <!-- /.tab-pane -->
            <!-- Stats tab content -->
            <div class="tab-pane" id="control-sidebar-stats-tab">Stats Tab Content</div>
            <!-- /.tab-pane -->
            <!-- Settings tab content -->
            <div class="tab-pane" id="control-sidebar-settings-tab">
                <form method="post">
                    <h3 class="control-sidebar-heading">General Settings</h3>

                    <div class="form-group">
                        <label class="control-sidebar-subheading">
                            Report panel usage
                            <input type="checkbox" class="pull-right" checked="">
                        </label>

                        <p>
                            Some information about this general settings option
                        </p>
                    </div>
                    <!-- /.form-group -->
                </form>
            </div>
            <!-- /.tab-pane -->
        </div>
    </aside>
    <!-- /.control-sidebar -->
    <!-- Add the sidebar's background. This div must be placed
       immediately after the control sidebar -->
    <div class="control-sidebar-bg" style="position: fixed; height: auto;"></div>

    <!-- Left side column. contains the logo and sidebar -->
    <aside class="main-sidebar">

        <!-- sidebar: style can be found in sidebar.less -->
        <section class="sidebar" style="height: auto;">
            <!-- Sidebar user panel (optional) -->
            <div style="text-align:center; margin-top:15px;">
                <a href="?lang=fr" style="margin-right:15px;">
                    <span class="flag-icon flag-icon-fr"></span>
                </a>
                <a href="?lang=en">
                    <span class="flag-icon flag-icon-gb"></span>
                </a>
            </div>

            <div style="position:relative;left:55px; color:white;">
                <h3>${currentUser.username}</h3>
                <p>${currentUser.questions.size()} ${message(code:'question.label')}</p>
                <p>${currentUser.answers.size()} ${message(code:'answer.label')}</p>
                <p>${currentUser.comments.size()} ${message(code:'comment.label')}</p>
                <p>${currentUser.badges.size()} ${message(code:'badge.label')}</p>
            </div>
        </section>
    </aside>

</div>
<!-- ./wrapper -->
</div>

<div class="footer" role="contentinfo"></div>

<div id="spinner" class="spinner" style="display:none;"><g:message code="spinner.alt" default="Loading&hellip;"/></div>
</body>
</html>
