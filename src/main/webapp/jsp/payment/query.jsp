<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<!DOCTYPE html>
<html>

<head>
    <title>缴费情况查询</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Fonts -->
    <link href='http://fonts.googleapis.com/css?family=Roboto+Condensed:300,400' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Lato:300,400,700,900' rel='stylesheet' type='text/css'>
    <!-- CSS Libs -->
    <link rel="stylesheet" type="text/css" href="../../lib/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="../../lib/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="../../lib/css/animate.min.css">
    <link rel="stylesheet" type="text/css" href="../../lib/css/bootstrap-switch.min.css">
    <link rel="stylesheet" type="text/css" href="../../lib/css/checkbox3.min.css">
    <link rel="stylesheet" type="text/css" href="../../lib/css/jquery.dataTables.min.css">
    <link rel="stylesheet" type="text/css" href="../../lib/css/dataTables.bootstrap.css">
    <link rel="stylesheet" type="text/css" href="../../lib/css/select2.min.css">
    <!-- CSS App -->
    <link rel="stylesheet" type="text/css" href="../../css/style.css">
    <link rel="stylesheet" type="text/css" href="../../css/themes/flat-blue.css">
</head>

<body class="flat-blue">
    <div class="app-container">
        <div class="row content-container">
            <nav class="navbar navbar-default navbar-fixed-top navbar-top">
                <div class="container-fluid">
                    <div class="navbar-header">
                        <button type="button" class="navbar-expand-toggle">
                            <i class="fa fa-bars icon"></i>
                        </button>
                        <ol class="breadcrumb navbar-breadcrumb">
                            <li>缴费管理</li>
                            <li class="active">缴费情况查询</li>
                        </ol>
                        <button type="button" class="navbar-right-expand-toggle pull-right visible-xs">
                            <i class="fa fa-th icon"></i>
                        </button>
                    </div>
                    <ul class="nav navbar-nav navbar-right">
                        <button type="button" class="navbar-right-expand-toggle pull-right visible-xs">
                            <i class="fa fa-times icon"></i>
                        </button>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-comments-o"></i></a>
                            <ul class="dropdown-menu animated fadeInDown">
                                <li class="title">
                                    Notification <span class="badge pull-right">0</span>
                                </li>
                                <li class="message">
                                    No new notification
                                </li>
                            </ul>
                        </li>
                        <li class="dropdown danger">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-star-half-o"></i> 4</a>
                            <ul class="dropdown-menu danger  animated fadeInDown">
                                <li class="title">
                                    Notification <span class="badge pull-right">4</span>
                                </li>
                                <li>
                                    <ul class="list-group notifications">
                                        <a href="#">
                                            <li class="list-group-item">
                                                <span class="badge">1</span> <i class="fa fa-exclamation-circle icon"></i> new registration
                                            </li>
                                        </a>
                                        <a href="#">
                                            <li class="list-group-item">
                                                <span class="badge success">1</span> <i class="fa fa-check icon"></i> new orders
                                            </li>
                                        </a>
                                        <a href="#">
                                            <li class="list-group-item">
                                                <span class="badge danger">2</span> <i class="fa fa-comments icon"></i> customers messages
                                            </li>
                                        </a>
                                        <a href="#">
                                            <li class="list-group-item message">
                                                view all
                                            </li>
                                        </a>
                                    </ul>
                                </li>
                            </ul>
                        </li>
                        <li class="dropdown profile">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><sec:authentication property="principal.username"></sec:authentication><span class="caret"></span></a>
                            <ul class="dropdown-menu animated fadeInDown">
                                <%--<li class="profile-img">--%>
                                <%--<img src="../img/profile/picjumbo.com_HNCK4153_resize.jpg" class="profile-img">--%>
                                <%--</li>--%>
                                <li>
                                    <div class="profile-info">
                                        <h4 class="username"><sec:authentication property="principal.username"></sec:authentication></h4>
                                        <div class="btn-group margin-bottom-2x" role="group">
                                            <button type="button" class="btn btn-default" id="logoutBtn"  name="logoutBtn"><i class="fa fa-sign-out"></i> Logout</button>
                                        </div>
                                    </div>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </nav>
            <div class="side-menu sidebar-inverse">
                <nav class="navbar navbar-default" role="navigation">
                    <div class="side-menu-container">
                        <div class="navbar-header">
                            <a class="navbar-brand" href="#">
                                <div class="icon fa fa-paper-plane"></div>
                                <div class="title">Property Service MS</div>
                            </a>
                            <button type="button" class="navbar-expand-toggle pull-right visible-xs">
                                <i class="fa fa-times icon"></i>
                            </button>
                        </div>
                        <ul class="nav navbar-nav">
                            <li>
                                <a href="../index.jsp">
                                    <span class="icon fa fa-tachometer"></span><span class="title">Dashboard</span>
                                </a>
                            </li>
                            <li class="active panel panel-default dropdown">
                                <a data-toggle="collapse" href="#dropdown-element">
                                    <span class="icon fa fa-desktop"></span><span class="title">缴费管理</span>
                                </a>
                                <!-- Dropdown level 1 -->
                                <div id="dropdown-element" class="panel-collapse collapse">
                                    <div class="panel-body">
                                        <ul class="nav navbar-nav">
                                            <li><a href="#">缴费情况查询</a>
                                            </li>
                                            <!-- 具有管理员权限 -->
                                            <sec:authorize access="hasRole('ROLE_ADMIN')">
                                                <li><a href="./rule.jsp">缴费细则编辑</a>
                                                </li>
                                                <li><a href="./ruleDistribute.jsp">缴费规则分配</a>
                                                </li>
                                                <li><a href="./interface.jsp">缴费接口配置</a>
                                                </li>
                                            </sec:authorize>
                                        </ul>
                                    </div>
                                </div>
                            </li>
                            <li class="panel panel-default dropdown">
                                <a data-toggle="collapse" href="#dropdown-table">
                                    <span class="icon fa fa-table"></span><span class="title">通知管理</span>
                                </a>
                                <!-- Dropdown level 1 -->
                                <div id="dropdown-table" class="panel-collapse collapse">
                                    <div class="panel-body">
                                        <ul class="nav navbar-nav">
                                            <li><a href="../notice/individual.jsp">推送通知至个别用户</a>
                                            </li>
                                            <li><a href="../notice/announce.jsp">推送公告至全部用户</a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </li>
                            <li class="panel panel-default dropdown">
                                <a data-toggle="collapse" href="#dropdown-form">
                                    <span class="icon fa fa-file-text-o"></span><span class="title">用户管理</span>
                                </a>
                                <!-- Dropdown level 1 -->
                                <div id="dropdown-form" class="panel-collapse collapse">
                                    <div class="panel-body">
                                        <ul class="nav navbar-nav">
<sec:authorize access="hasRole('ROLE_ADMIN')">
                                            <li><a href="../user/power.jsp">权限管理</a>
                                            </li>
    </sec:authorize>
                                            <li><a href="../user/info.jsp">用户资料查询</a>
                                            </li>
                                            <li><a href="../user/check.jsp">用户房屋关系审查</a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </li>

                            <!-- Dropdown-->
                            <li class="panel panel-default dropdown">
                                <a data-toggle="collapse" href="#component-example">
                                    <span class="icon fa fa-cubes"></span><span class="title">Components</span>
                                </a>
                                <!-- Dropdown level 1 -->
                                <div id="component-example" class="panel-collapse collapse">
                                    <div class="panel-body">
                                        <ul class="nav navbar-nav">
                                            <li><a href="components/pricing-table.html">Pricing Table</a>
                                            </li>
                                            <li><a href="components/chartjs.html">Chart.JS</a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </li>
                            <!-- Dropdown-->
                            <li class="panel panel-default dropdown">
                                <a data-toggle="collapse" href="#dropdown-example">
                                    <span class="icon fa fa-slack"></span><span class="title">Page Example</span>
                                </a>
                                <!-- Dropdown level 1 -->
                                <div id="dropdown-example" class="panel-collapse collapse">
                                    <div class="panel-body">
                                        <ul class="nav navbar-nav">
                                            <li><a href="pages/login.html">Login</a>
                                            </li>
                                            <li><a href="pages/index.html">Landing Page</a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </li>
                            <!-- Dropdown-->
                            <li class="panel panel-default dropdown">
                                <a data-toggle="collapse" href="#dropdown-icon">
                                    <span class="icon fa fa-archive"></span><span class="title">Icons</span>
                                </a>
                                <!-- Dropdown level 1 -->
                                <div id="dropdown-icon" class="panel-collapse collapse">
                                    <div class="panel-body">
                                        <ul class="nav navbar-nav">
                                            <li><a href="icons/glyphicons.html">Glyphicons</a>
                                            </li>
                                            <li><a href="icons/font-awesome.html">Font Awesomes</a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <a href="license.html">
                                    <span class="icon fa fa-thumbs-o-up"></span><span class="title">License</span>
                                </a>
                            </li>
                        </ul>
                    </div>
                    <!-- /.navbar-collapse -->
                </nav>
            </div>
            <!-- Main Content -->
            <div class="container-fluid">
                <div class="side-body">
                    <div class="page-title">
                        <span class="title">缴费情况查询</span>
                        <div class="description">可以约束多个条件，便捷地查询所需的缴费信息</div>
                    </div>
                    <div class="row">
                        <div class="col-xs-12">
                            <div class="card">
                                <div class="card-header">
                                    <div class="card-title">
                                    <div class="title">缴费情况</div>
                                    </div>
                                </div>
                                <div class="card-body">
                                    <table id="menuTable" class="table" cellspacing="0" width="100%">
                                        <tr>
                                            <td>
                                                <label>起始日期</label>
                                            </td>
                                            <td>
                                                <input name="dateBegin" type="date"/>
                                            </td>
                                            <td>
                                                <label>终止日期</label>
                                            </td>
                                            <td>
                                                <input name="dateEnd" type="date">
                                            </td>
                                        </tr>
                                        <tr>
                                            <%--<td>--%>
                                                <%--<label>缴费类型</label>--%>
                                            <%--</td>--%>
                                            <%--<td>--%>
                                                <%--<select name="payType">--%>
                                                    <%--<option>所有</option>--%>
                                                    <%--<option value=""></option>--%>
                                                <%--</select>--%>
                                            <%--</td>--%>
                                            <td>
                                                <label>缴费类型</label>
                                            </td>
                                            <td>
                                                <select name="paymentType">
                                                    <option value="0" selected="selected">全部</option>
                                                    <option value="1">物业费</option>
                                                    <option value="3">停车费</option>
                                                    <option value="2">公共水电费</option>
                                                </select>
                                            </td>
                                            <td>
                                                <label>缴费情况</label>
                                            </td>
                                            <td>
                                                <select name="paymentState">
                                                    <option value="2" selected="selected">全部</option>
                                                    <option value="1">已缴费</option>
                                                    <option value="0">未缴费</option>
                                                </select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <label>房屋ID：</label>
                                            </td>
                                            <td>
                                                <input type="text" name="roomId" value="" placeholder="输入房屋ID"/>
                                            </td>
                                            <td>
                                                <label>房屋名称：</label>
                                            </td>
                                            <td>
                                                <input type="text" name="roomName" value="" placeholder="输入房屋名称关键字"/>
                                            </td>
                                            <td>
                                                <a href="javascript:queryPaymentInfo();"><i name="searchBtn" class="fa fa-search"></i>&nbsp;查询</a>
                                            </td>
                                        </tr>
                                    </table>
                                    <table id="paymentQuery" class="table table-striped" cellspacing="0" width="100%">
                                        <thead>
                                            <tr>
                                                <th>ID</th>
                                                <th>单元ID</th>
                                                <th>单元名称</th>
                                                <th>日期</th>
                                                <th>缴费类型</th>
                                                <th>缴费状态</th>
                                            </tr>
                                        </thead>
                                        <tbody id="queryTbody">
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <footer class="app-footer">
            <div class="wrapper">
                <span class="pull-right">2.1 <a href="#"><i class="fa fa-long-arrow-up"></i></a></span> © 2015 Copyright.
            </div>
        </footer>
    </div>
    <!-- Javascript Libs -->
    <script type="text/javascript" src="../../lib/js/jquery.min.js"></script>
    <script type="text/javascript" src="../../lib/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="../../lib/js/Chart.min.js"></script>
    <script type="text/javascript" src="../../lib/js/bootstrap-switch.min.js"></script>

    <script type="text/javascript" src="../../lib/js/jquery.matchHeight-min.js"></script>
    <script type="text/javascript" src="../../lib/js/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="../../lib/js/dataTables.bootstrap.min.js"></script>
    <script type="text/javascript" src="../../lib/js/select2.full.min.js"></script>
    <script type="text/javascript" src="../../lib/js/ace/ace.js"></script>
    <script type="text/javascript" src="../../lib/js/ace/mode-html.js"></script>
    <script type="text/javascript" src="../../lib/js/ace/theme-github.js"></script>
    <script type="text/javascript" src="../../lib/js/jquery.dateFormat.min.js"></script>
    <!-- Javascript -->
    <script type="text/javascript" src="../../js/app.js"></script>
    <script type="text/javascript" src="../../js/payment/query.js"></script>
</body>

</html>
