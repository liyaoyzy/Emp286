<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/6/20
  Time: 15:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!--可无视-->
    <link rel="stylesheet" type="text/css" href="${BASE}/static/css/tcss/zzsc.css">
    <!--响应式框架-->
    <link rel="stylesheet" type="text/css" href="${BASE}/static/css/tcss/bootstrap-grid.min.css" />
    <!--图标库-->
    <link rel="stylesheet" href="${BASE}/static/css/tcss/fontawesome-all.min.css">
    <!--插件css基本库-->
    <link rel="stylesheet" href="${BASE}/static/css/tcss/owl.carousel.min.css">

    <style>
        .post-slide{
            background: #fff;
            margin: 0 15px;
            padding:27px 30px;
            border-bottom: 1px solid #fff;
            width: 350px;

        }
        .post-slide .post-header{
            margin-bottom: 10px;
        }
        .post-slide .subtitle{
            color:#0b99bc;
            font-size:14px;
            display: inline-block;
            margin-bottom:5px;
            text-transform: uppercase;
            transition: all 0.4s ease 0s;
        }
        .post-slide .subtitle:hover{
            color:#333;
            text-decoration: none;
        }
        .post-slide .post-title{
            margin: 0;
        }
        .post-slide .post-title a{
            color:#333;
            font-size:18px;
            font-weight: bold;
            text-transform:capitalize;
            transition: all 0.4s ease 0s;
        }
        .post-slide .post-title a:hover{
            color:#0b99bc;
            text-decoration: none;
        }
        .post-slide .pic{
            overflow: hidden;
            position: relative;
        }
        .post-slide .pic img{
            width: 100%;
            height: auto;
            transform: rotate(0deg) scale(1,1);
            transition: all 0.9s ease 0s;
        }
        .post-slide:hover img{
            transform: rotate(-2deg) scale(1.1,1.1);
        }
        .post-slide .pic:after{
            content: "";
            position: absolute;
            top:0;
            left:0;
            width: 100%;
            height: 100%;
            background: rgba(255,255,255,0);
            transition: all 0.9s ease 0s;

        }
        .post-slide:hover .pic:after{
            background: rgba(255,255,255,0.2);
        }
        .post-slide .post-bar{
            list-style: none;
            padding:12px 0;
            margin: 0;
        }
        .post-slide .post-bar li{
            display: inline-block;
            margin-right:3px;
            color:#aaa;
        }
        .post-slide .post-bar li:last-child{
            margin-right: 0;
        }
        .post-slide .post-bar li a{
            color:#aaa;
            transition:0.3s ease;
        }
        .post-slide .post-bar li a:hover{
            text-decoration: none;
            color:#0b99bc;
        }
        .post-slide .post-description{
            font-size: 14px;
            line-height: 24px;
            margin-bottom:15px;
            color:#767676;
        }
        .post-slide .read-more{
            color:#0b99bc;
            font-size: 14px;
            font-style: italic;
            text-transform: capitalize;
        }
        .post-slide .read-more:hover{
            color:#333;
            text-decoration:none;
        }
        @media only screen and (max-width: 479px) {
            .post-slide{
                padding: 15px;
            }
            .post-slide .post-bar li{
                margin-bottom: 5px;
            }
            .post-slide .post-bar li:last-child{
                margin-bottom: 0;
            }
        }
    </style>
</head>

<body  style="background: url('../../static/images/yun.jpg')">
<div class="demo" style="background:#f7f8fa;height: 100%;background: url('../../static/images/yun.jpg')"  >
    <div class="container">
        <div class="row">
            <div class="col-md-12" style="margin-top: 5%">
                <input type="hidden" value="${aid}" id="aid">
                <div id="news-slider" class="owl-carousel">

                </div>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript" src="${BASE}/static/jquery/tjs/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="${BASE}/static/jquery/tjs/owl.carousel.min.js"></script>
<script type="text/javascript">
    $(function(){

        findByPage();


    })


    function findByPage() {
        var aid=$("#aid").val();
        if(aid==null||aid==""){
            aid=null;
        }
        $.ajax({
            url: "${BASE}/tour/tourAllimg",
            type: "post",
            data: {
                "aid": aid,
            },
            type: "post",
            success: function (data) {
                if (data.result) {
                    let message = "";
                    $.each(data.tourList, function (index, tour) {

                        let tourimg=tour.tourimg
                        let imgs="";
                        if (tourimg!=null) {
                            imgs= tourimg.img;
                        }else {
                            imgs="../static/images/bg1.jpg"
                        }
                         message += " <div class='post-slide'>";
                        message += " <div class='post-header'>";
                        message += " <a href='#' class='subtitle'>ATTRACTIONS</a>";
                        message += " <h3 class='post-title'><a href='#'>"+tour.tname+"</a></h3>";
                        message += " </div>";
                        message += " <div class='pic'>";
                        message += " <img src='"+imgs+"' alt='' style='width: 100%;height: 50%'>";
                        message += " </div>";
                        message += "  <ul class='post-bar'>";
                        message += "  <li><i class='fa fa-users'></i> <a href=''>时间：</a></li>";
                        message += " <li><i class='fa fa-clock-o'></i> "+tour.times+"</li>";
                        message += " <li><i class='fa fa-comments'></i> <a href=''>价格：</a></li>";
                        message += " <li><i class='fa fa-clock-o'></i> "+tour.price+"</li>";
                        message += " </ul>";
                        message += " <p class='post-description'>";
                        message += " </p>";
                        message += " <a href='' class='read-more'>选择</a>";
                        message += " </div>";
                    });
                    $("#news-slider").html(message);

                    $("#news-slider").owlCarousel({
                        items : 3,
                        itemsDesktop:[1199,3],
                        itemsDesktopSmall:[1000,2],
                        itemsMobile : [650,1],
                        navigationText:false,
                        autoPlay:true
                    });
                }
            }
        });
    }

</script>
</body>
</html>
