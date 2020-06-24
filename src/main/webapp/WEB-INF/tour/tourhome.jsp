<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
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
    <link href="${BASE}/static/css/bootstrap.min.css" rel="stylesheet" type="text/css" media="all">
    <link href="${BASE}/static/css/fontawesome-all.min.css" rel="stylesheet" type="text/css" media="all">
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

<body >

<header >
    <div class="container-fluid px-lg-5 " >
        <nav class="mnu mx-auto" id="top1" >
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
<div class="clearfix" ></div>

<section class="news py-5" id="news">
    <div class="container py-lg-5" >
        <h6 class="intr ser1 mx-auto" style="margin-bottom: -5px"></h6>
        <div class="row news-grids pb-lg-5 mt-3 text-center" id="tourShow">
        </div>
    </div>
</section>

</body>
<script src="${BASE}/static/jquery/jquery-2.1.1.min.js"></script>
<script src="${BASE}/static/layer/layer.js"></script>
<script>
    $(document).ready(function () {

        function tourShow() {
            $.ajax({
                url: "${BASE}/tour/tourAllimg",
                type: "post",
                data: {
                    "aid": ${aid},
                    "destination": $("#destination").val()
                },
                type: "post",
                success: function (data) {
                    if (data.result) {
                        let div = $("#tourShow")
                        let img = "";
                        $.each(data.tourList, function (index, tour) {

                            let tourimg=tour.tourimg
                            let imgs="";
                            if (tourimg!=null) {
                                imgs= tourimg.img;
                            }else {
                                imgs="../static/images/bg1.jpg"
                            }
                            img += "<div class='col-md-4 newsgrid1'>";
                            img +=
                                "<img src='"+imgs+"' alt='news image' class='img-fluid' style='height: 350px;width: 300px'/>";
                            img += "<h4 class='mt-4'>" + tour.tname + "</h4>";
                            img += "<p class ='mt-4'>所需天数："+tour.times+"</p>";
                            img += "<p class ='mt-4'>门票价格：" +tour.price +"元</p>";
                            img +=
                                "<a class='btn btn-primary mt-lg-4 mt-3 agile-link-bnr1' onclick='changeTour(" +tour.tid +")' role='button'  style='color:beige;'>推荐方案</a></div>";
                        })
                        div.html(img);
                        $("#tourShow").children().hide();
                        $("#tourShow").children().eq(0).show();
                        $("#tourShow").children().eq(1).show();
                        // $("#tourShow").children().eq(2).show();
                    }
                }
            })
        }
        tourShow();

        function show() {
            $("#tourShow").children().hide();
            $("#tourShow").children().eq(0).appendTo($("#tourShow"));
            $("#tourShow").children().eq(0).show();
            $("#tourShow").children().eq(1).show();
            // $("#tourShow").children().eq(2).show();
        }
        let timer = setInterval(show, 2000);
        $("#tourShow").mouseleave(function () {
            timer = setInterval(show, 2000);
        })
        $("#tourShow").mouseenter(function () {
            clearInterval(timer);
        })
    })


    function changeTour(aid){
        window.location.href="${BASE}/tour/tid?aid="+aid;
    }
</script>

</html>