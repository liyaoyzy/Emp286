<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/6/17
  Time: 9:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<script src="../../static/jquery/jquery-3.2.1.min.js"></script>
<link href="${APP_PATH}/static/css/bootstrap.min.css" rel="stylesheet" type="text/css" media="all">
<link href="${APP_PATH}/static/css/fontawesome-all.min.css" rel="stylesheet" type="text/css" media="all">
<link href="${APP_PATH}/static/css/style.css" rel='stylesheet' type='text/css' media="all">
<link href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900" rel="stylesheet">
<link rel="stylesheet" href="${APP_PATH}/static/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="${APP_PATH}/static/css/font-awesome.min.css">
<link rel="stylesheet" href="${APP_PATH}/static/css/main.css">
<script src="${APP_PATH}/static/layui/layui.js"></script>
<link type="text/css" rel="stylesheet" href="${APP_PATH}/static/layui/css/layui.css"/>
<!--css样式-->
<style>
    .out {
        margin-top: 50px;
        width: 100%;
        height: auto;
    }
    .coffeeOut{
        margin: 0 auto;
        width: 1200px;
        height: auto;
        text-align: center;
    }

    .titleButton{
        margin-left: 5px;
        width: 100px;
        height: 25px;
        background-color: #2aabd2;
    }
    .titleButton .one {
        width: 50px;
        height: 25px;
        text-align: left;
        float: left;
        background-color: #2aabd2;
    }
    .titleButton .two {
        width: 50px;
        height: 25px;
        text-align: left;
        float: left;
        background-color: #2aabd2;
    }

    /*轮播容器*/
    .container {
        margin-top: 50px;
        width: 1400px;
        height: 320px;
        border: 1px solid black;
        /*前后页按钮添加属性*/
        position: relative;
        overflow: hidden;
    }

    .person {
        margin-right: 16px;
        width: 280px;
        height: 318px;
        border: 1px solid deeppink;
        float: left;
        overflow: hidden;
    }
    .person:hover {
        background-color: lawngreen;
    }
    .person:hover .title {
        display: none;
    }
    .person:hover .detail {
        display: initial;
    }

    .label {
        margin-top: 20px;
        margin-left: 0;
        width: 160px;
        height: 24px;
        border: 1px solid blue;
        text-align: left;
        font-size: 18px;
        /*设置半圆形边框*/
        border-bottom-right-radius:12px;
        border-top-right-radius:12px;
        background-color: #2aabd2;
    }
    .exp {
        margin-top: 38px;
        text-align:center;
    }
    .first .img,{

        /*margin: 0 auto;*/
        /*width: 100px;*/
        /*height: 100px;*/
        /*-webkit-border-radius: 50px;*/
        /*-moz-border-radius: 50px;*/
        /*border-radius: 50px;*/
        /*border: 1px solid gray;*/
    }
    .first .name {
        margin: 10px auto;
        font-size: 24px;
        font-weight:bold;
    }
    .first .title {
        margin: 10px auto;
        width: 70%;
        font-size: 24px;
        font-weight:bold;
    }
    .first .detail {
        margin: 10px auto;
        width: 75%;
        font-size: 18px;
        /*超出部分显示省略号*/
        overflow: hidden;
        text-overflow: ellipsis;
        white-space: normal;
        display: none;
    }

    .buttons {
        width: 1200px;
        height: 111px;
        /*position: relative;*/
    }
    .slider-nav {
        margin-left: -38px;
    }
    .slider-nav li {
        width: 23px;
        background: #3e3e3e;
        cursor: pointer;
        margin: 0 5px;
        overflow: hidden;
        text-align: center;
        display: inline-block;
        height: 9px;
    }
    .slider-nav li:hover {
        background: #31b0d5;
    }
    .list {
        width: 3300px;
        height: 320px;
        position: absolute;
    }

    .arrow {
        position: absolute;
        display: none;
        width: 40px;
        height: 40px;
        line-height: 40px;
        z-index: 2;
        font-size: 36px;
        text-align: center;
        font-weight: bold;
        top: 140px;
        background-color: rgba(0, 0, 0, .3);
        color: #FFF;
    }
    #prev {
        left: 20px;
    }
    #next {
        right: 20px;
    }
    #container:hover .arrow {
        display: block;
    }
    .arrow:hover {
        background-color: rgba(0, 0, 0, .7);
    }
    .buttons .on {
        background: orange;
    }
</style>
<head>
    <meta charset="UTF-8">
    <title>myBanner</title>
</head>
<body>
<%--<div class="news py-5">--%>
<%--    <div class="news-grids pb-lg-3 mt-3 text-center" >--%>
<div class="out">
    <div class="coffeeOut">
        <!--抬头-->
        <!--大神推荐-->
        <div class="container">
            <div class="list" style="left:-300px" id="tbody1">

<%--                <div class="person first">--%>
<%--                    <div class="col-md-4 mt-md-0 mt-5 newsgrid2">--%>
<%--                        <img src="images/g2.jpg" alt="news image" class="img-fluid">--%>
<%--                        <h4 class=" mt-4">Integer porttitor</h4>--%>
<%--                        <p class="mt-4">price</p>--%>
<%--                        <a class="btn btn-primary mt-lg-4 mt-3 agile-link-bnr1" href="single.html" role="button">Learn--%>
<%--                            More</a>--%>
<%--                    </div>--%>
<%--                </div>--%>


                <!--一共六位大神-->
            </div>
            <a href="#" id="prev" class="arrow"><</a>
            <a href="#" id="next" class="arrow">></a>
        </div>
        <div class="buttons">
            <ul class="slider-nav">
                <li class="on" index="1"></li>
                <li class="" index="2"></li>
                <li class="" index="3"></li>
            </ul>
        </div>
<%--        <!--三个点击按钮-->--%>
<%--        <div class="buttons">--%>
<%--            <div class="button1"></div>--%>
<%--            <div class="button3"></div>--%>
<%--            <div class="button2"></div>--%>
<%--        </div>--%>

    </div>
</div>
</body>
<script src="${APP_PATH}/static/jquery/jquery-2.1.1.min.js"></script>
<script src="${APP_PATH}/static/bootstrap/js/bootstrap.min.js"></script>
<script src="${APP_PATH}/static/script/docs.min.js"></script>
<script src="${APP_PATH}/static/layer/layer.js"></script>
<script type="text/javascript">
    window.onload = function () {
        var container = document.getElementsByClassName('container').item(0);
        var list = document.getElementsByClassName('list').item(0);
        var buttons = document.getElementsByClassName('buttons').item(0).getElementsByTagName('li');
        var prev = document.getElementById('prev');
        var next = document.getElementById('next');
        var index = 1;
        var animated = false;
        var timer;

        function showBtn() {
            for (var i = 0; i < buttons.length; i++) {
                if (buttons[i].className == 'on') {
                    buttons[i].className = '';
                }
            }
            buttons[index - 1].className = 'on';
        }

        function animate(offset) {
            animated = true;
            var newL = parseInt(list.style.left) + offset;
            var time = 600;
            var interval =10;
            var speed = offset / (time / interval);

            function go() {
                if ((speed < 0 && parseInt(list.style.left) > newL) || (speed > 0 && parseInt(list.style.left) < newL)) {
                    list.style.left = parseInt(list.style.left) + speed + 'px';
                    setTimeout(go, interval);
                } else {
                    animated = false;
                    list.style.left = newL + 'px';
                    if (newL < -1800) {
                        list.style.left = -300 + 'px';
                    } else if (newL > -300) {
                        list.style.left = -1800 + 'px';
                    }
                }
            }

            go();
        }

        function play() {
            timer = setInterval(function () {
                next.onclick();
            }, 3000);
        }

        function stop() {
            clearInterval(timer);
        }

        next.onclick = function () {
            if (index == 3) {
                index = 1;
            } else {
                index += 1;
            }
            if (animated == false) {
                animate(-300);
            }
            showBtn();
        }
        prev.onclick = function () {
            if (index == 1) {
                index =3;
            } else {
                index -= 1;
            }
            if (animated == false) {
                animate(300);
            }
            showBtn();
        }
        for (var i = 0; i < buttons.length; i++) {
            buttons[i].onclick = function () {
                var myindex = parseInt(this.getAttribute('index'));
                var offset = -300 * (myindex - index);
                if (animated == false) {
                    animate(offset);
                }
                index = myindex;
                showBtn();
            }
        }
        container.onmouseover = stop;
        container.onmouseout = play;
        play();
    }

    $(function () {

        // $("#btnSelect").click(function () {
        //     findByPage();
        // });
        <!--分页-->
        findByPage();

        <%--$(document).ready(function () {--%>
        <%--    $.ajax({--%>
        <%--        url: "${pageContext.request.contextPath}/address/addresslist",--%>
        <%--        success: function (data) {--%>
        <%--            var message = "<option>请选择地址</option>";--%>
        <%--            $.each(data.addressList, function (index, address) {--%>
        <%--                message += "<option value=" + address.aid + ">" + address.address + "</option>";--%>
        <%--            });--%>
        <%--            $("#aid").html(message);--%>
        <%--        }--%>
        <%--    });--%>

        <%--});--%>
    })

    function findByPage() {
        $.ajax({
            url: "${pageContext.request.contextPath}/addressimg/addressimgAllimg",
            type: "post",
            data:{
                "aid": $("#aid").val(),
            },
            success: function (data) {
                if (data.result) {
                    var message = "";
                    $.each(data.addressimgList, function (index, addressimg) {
                        var D="海上生明月，天涯共此时";
                        message += "<div class='person first'>";
                        message += " <div class=‘col-md-4 mt-md-0 mt-5 newsgrid2’>";
                        message += "<div style='padding-bottom: 15px'><img src='"+addressimg.addimg+"'  height='250px' width='280px' style='margin-bottom:-10px'></div>";
                        message += "<div><h4 class=‘mt-4'>" + addressimg.address.address+ "</h4></div>";
                        message += "<h5 class=‘mt-4'>" + D+ "</h5>";
                        message += "</div>";
                        message += "</div>";



                        // message += "<tr>";
                        // message += "<td>" + (index + 1) + "</td>";
                        // message += "<td><input type='checkbox' class='abc' name='aids' value='"+addressimg.addid+"'></td>";
                        // message += "<td><img src='"+addressimg.addimg+"' height='60px' width='100px' style='margin-bottom:-10px'></td>";
                        // message += "<td>" + addressimg.address.address+ "</td>";
                        // message += "<td>";
                        // message += "<button type='button' id='changeUpdatePay'  onclick='changeUpdate(" +addressimg.addid+")' class='btn btn-primary btn-xs'><i class='glyphicon glyphicon-pencil'></i></button>";
                        // message += "<button type='button' id='changeUpdateDelivery'  onclick='changeDelete("+addressimg.addid+ ")' class='btn btn-danger btn-xs'><i class=' glyphicon glyphicon-minus '></i></button>";
                        // message += "</td>";
                        // message += "</tr>";
                    });
                    $("#tbody1").html(message);
                    var pageInfo = "";
                    pageInfo += "<li " + (data.pageBean.nowPage == 1 ? "class='disabled'" : "") + "><a onclick='findByPage(" + (data.pageBean.nowPage == 1 ? 1 : data.pageBean.nowPage - 1) + ")'>上一页</a></li>";
                    for (var i = 1; i <= data.pageBean.countPage; i++) {
                        pageInfo += "<li " + (data.pageBean.nowPage == i ? "class='active'" : "") + "><a onclick='findByPage(" + (i) + ")'>" + i + "<span class='sr-only'>(current)</span></a></li>";
                    }
                    pageInfo += "<li " + (data.pageBean.nowPage == data.pageBean.countPage ? "class='disabled'" : "") + "><a  onclick='findByPage(" + (data.pageBean.nowPage == data.pageBean.countPage ? data.pageBean.countPage : data.pageBean.nowPage + 1) + ")'>下一页</a></li>";
                    $("#byPage").html(pageInfo);
                }
            }
        });
    }

</script>
</html>
