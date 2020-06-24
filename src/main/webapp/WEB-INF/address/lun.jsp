<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/6/20
  Time: 11:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>jQuery图片叠加滚动切换代码 - 站长素材</title>
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
    <link rel="stylesheet" href="${APP_PATH}/static/bootstrap/css/public.css" />
    <link rel="stylesheet" type="text/css" href="${APP_PATH}/static/bootstrap/css/index.css" />
    <script type="text/javascript" src="${APP_PATH}/static/jquery/jquery-2.2.4.min.js"></script>
    <script type="text/javascript" src="${APP_PATH}/static/jquery/zturn.js"></script>
</head>

<body>
<div style="height: 700px;width: 800px;margin:0 auto;">
    <!--轮播-->

    <div class="lb_gl">
        <div class="container">
            <div class="pictureSlider poster-main">
                <ul id="zturn" class="poster-list">
<%--                    <li class="poster-item  zturn-item">--%>
<%--                        <p class="xxgy">我是滚动1</p>--%>
<%--                        <p class="say">明月几时有</p>--%>
<%--                        <div class="for_btn">--%>
<%--                            <img src="img/a1.png" width="100%">--%>
<%--                        </div>--%>


<%--                    </li>--%>

<%--                    <li class="poster-item zturn-item">--%>
<%--                        <p class="xxgy">我是滚动2</p>--%>
<%--                        <p class="say">明月几时有</p>--%>
<%--                        <div class="for_btn">--%>
<%--                            <img src="img/a2.png" width="100%">--%>
<%--                        </div>--%>

<%--                    </li>--%>

<%--                    <li class="poster-item zturn-item">--%>
<%--                        <p class="xxgy">我是滚动3</p>--%>
<%--                        <p class="say">明月几时有</p>--%>
<%--                        <div class="for_btn">--%>
<%--                            <img src="img/a3.png" width="100%">--%>
<%--                        </div>--%>

<%--                    </li>--%>

<%--                    <li class="poster-item zturn-item">--%>
<%--                        <p class="xxgy">我是滚动4</p>--%>
<%--                        <p class="say">明月几时有</p>--%>
<%--                        <div class="for_btn">--%>
<%--                            <img src="img/a4.png" width="100%">--%>
<%--                        </div>--%>

<%--                    </li>--%>

<%--                    <li class="poster-item zturn-item">--%>
<%--                        <p class="xxgy">我是滚动5</p>--%>
<%--                        <p class="say">明月几时有</p>--%>
<%--                        <div class="for_btn">--%>
<%--                            <img src="img/a5.png" width="100%">--%>
<%--                        </div>--%>

<%--                    </li>--%>
<%--                    <li class="poster-item  zturn-item">--%>
<%--                        <p class="xxgy">我是滚动6</p>--%>
<%--                        <p class="say">明月几时有</p>--%>
<%--                        <div class="for_btn">--%>
<%--                            <img src="img/a1.png" width="100%">--%>
<%--                        </div>--%>

<%--                    </li>--%>

<%--                    <li class="poster-item zturn-item">--%>
<%--                        <p class="xxgy">我是滚动7</p>--%>
<%--                        <p class="say">明月几时有</p>--%>
<%--                        <div class="for_btn">--%>
<%--                            <img src="img/a2.png" width="100%">--%>
<%--                        </div>--%>

<%--                    </li>--%>

<%--                    <li class="poster-item zturn-item">--%>
<%--                        <p class="xxgy">我是滚动8</p>--%>
<%--                        <p class="say">明月几时有</p>--%>
<%--                        <div class="for_btn">--%>
<%--                            <img src="img/a3.png" width="100%">--%>
<%--                        </div>--%>
<%--                    </li>--%>
                </ul>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">

    $(function () {

        tourShow();
    })

    function tourShow() {
        $.ajax({
            url: "${APP_PATH}/address/addressAllimg",
            type: "post",
            data: {
                "aid": $("#aid").val(),
                "destination": $("#destination").val()
            },
            type: "post",
            success: function (data) {
                if (data.result) {
                    let div = $("#tourShow")
                    var message = "";
                    $.each(data.addressList, function (index, address) {
                        let addressimg=address.addressimg;
                        let imgs="";
                        if (addressimg!=null) {
                            imgs= addressimg.addimg;
                        }else {
                            imgs="../static/images/bg1.jpg"
                        }
                        message += "<li class='poster-item  zturn-item'>";
                        message += " <p class='xxgy' style='text-align: center;color: black;font-family: 楷体'>"+address.address+"</p>";
                        // message += "<p class='say'>海上生明月</p>";
                        message += "<div class='for_btn' >";
                        message += "<img src='"+imgs+"' width='100%' height='100%' >";
                        message += "</div>";
                        message += "</li>";
                    })
                    $("#zturn").html(message);


                    var aa = new zturn({
                        id: "zturn",
                        opacity: 0.9,
                        width: 200,
                        Awidth: 300,
                        scale: 0.9,
                        auto: true,//是否轮播 默认5000
                        turning: 2000//轮播时长
                    })

                }
            }
        })

    }

</script>
</body>
</html>