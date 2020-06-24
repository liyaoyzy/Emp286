<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/6/17
  Time: 9:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="${APP_PATH}/static/css/bootstrap.min.css" rel="stylesheet" type="text/css" media="all">
    <link href="${APP_PATH}/static/css/fontawesome-all.min.css" rel="stylesheet" type="text/css" media="all">
    <link href="${APP_PATH}/static/css/style.css" rel='stylesheet' type='text/css' media="all">
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
<section class="news py-5" id="news">
    <div class="container py-lg-5">
        <h6 class="intr ser1 mx-auto">OUR NEWS</h6>
        <div class="row news-grids pb-lg-5 mt-3 text-center">
            <div class="col-md-4 newsgrid1">
                <img src="images/g7.jpg" alt="news image" class="img-fluid">
                <h4 class="mt-4">Integer porttitor</h4>
                <p class="mt-4">Nulla pellentesque mi non laoreet eleifend. Integer porttitor mollisar lorem, at
                    molestie arcu pulvinar ut. </p>
                <a class="btn btn-primary mt-lg-4 mt-3 agile-link-bnr1" href="single.html" role="button">Learn
                    More</a>
            </div>
            <div class="col-md-4 mt-md-0 mt-5 newsgrid2">
                <img src="images/g2.jpg" alt="news image" class="img-fluid">
                <h4 class=" mt-4">Integer porttitor</h4>
                <p class="mt-4">Nulla pellentesque mi non laoreet eleifend. Integer porttitor mollisar lorem, at
                    molestie arcu pulvinar ut.</p>
                <a class="btn btn-primary mt-lg-4 mt-3 agile-link-bnr1" href="single.html" role="button">Learn
                    More</a>
            </div>
            <div class="col-md-4  newsgrid3">
                <img src="images/g3.jpg" alt="news image" class="img-fluid">
                <h4 class=" mt-4">Integer porttitor</h4>
                <p class="mt-4">Nulla pellentesque mi non laoreet eleifend. Integer porttitor mollisar lorem, at
                    molestie arcu pulvinar ut.</p>
                <a class="btn btn-primary mt-lg-4 mt-3 agile-link-bnr1" href="single.html" role="button">Learn
                    More</a>
            </div>
        </div>
    </div>
</section>
</body>
</html>
