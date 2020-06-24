<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/6/18
  Time: 14:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="zxx">

<head>
    <title>Home</title>
    <!--meta tags -->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="keywords" content="" />
    <script>
        addEventListener("load", function () {
            setTimeout(hideURLbar, 0);
        }, false);

        function hideURLbar() {
            window.scrollTo(0, 1);
        }
    </script>
    <!--//meta tags ends here-->
    <!--booststrap-->
    <link href="${BASE}/static/css/bootstrap.min.css" rel="stylesheet" type="text/css" media="all">
    <!--//booststrap end-->
    <!-- font-awesome icons -->
    <link href="${BASE}/static/css/fontawesome-all.min.css" rel="stylesheet" type="text/css" media="all">
    <!-- //font-awesome icons -->
    <!--stylesheets-->
    <link href="${BASE}/static/css/style.css" rel='stylesheet' type='text/css' media="all">
    <!--//stylesheets-->
    <link href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900" rel="stylesheet">
    <style>
        #top1 {
            position: fixed;
            top: 0;
            width: 100%;
            z-index: 10001;
        }
    </style>
</head>
<body>
<div class="header-outs" >
    <header>
        <div class="container-fluid px-lg-5 ">
            <nav class="mnu mx-auto" id="top1">
                <label for="drop" class="toggle">Menu</label>
                <input type="checkbox" id="drop">
                <ul class="menu" >
                    <li class="mr-lg-0 active"><a href="index.html"><span style="color: #3599aae7;">首页</span></a></li>
                    <li class="mr-lg-0"><a href="#news" class="scroll"><span style="color: #3599aae7;">旅游方案</span></a></li>
                    <li class="mr-lg-0"><a href="#about" class="scroll"><span style="color: #3599aae7;">选择我们</span></a></li>
                    <li class="mr-lg-0"><a href="#services" class="scroll"><span style="color: #3599aae7;">出行计划</span></a></li>
                    <li><a href="#contact" class="scroll"><span style="color: #3599aae7;">加入我们</span></a></li>
                </ul>
            </nav>
        </div>
    </header>
    <!-- //Navigation -->
    <div class="style-banner" style="margin-top:-15%">

        <%@ include file="address/addresshome.jsp"%>

    </div>
    <div class="clearfix"></div>
</div>
</body>
</html>
