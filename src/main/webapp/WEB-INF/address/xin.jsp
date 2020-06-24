<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/6/19
  Time: 11:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div id="header">
    <div id="gla">
        <div id="gla_box">
            <ul>
            </ul>
        </div>
    </div>
</div>
    <div style="text-align:center;margin:50px 0; font:normal 14px/24px 'MicroSoft YaHei';">
        <p>适用浏览器：360、FireFox、Chrome、Safari、Opera、傲游、搜狗、世界之窗. 不支持IE8及以下浏览器。</p>
        <p>来源：<a href="http://sc.chinaz.com/" target="_blank">站长素材</a></p>
    </div>
</body>
<script src="${APP_PATH}/static/jquery/jquery-2.1.1.min.js"></script>
<script src="${APP_PATH}/static/layer/layer.js"></script>
<script>
    $(document).ready(function () {

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
                        let img = "";
                        $.each(data.addressList, function (index, address) {
                            let addressimg=address.addressimg;
                            let imgs="";
                            if (addressimg!=null) {
                                imgs= addressimg.addimg;
                            }else {
                                imgs="../static/images/bg1.jpg"
                            }
                            img += "<li>";
                            img += "<div class='gla_inbox'>";
                            img +="<p>" + address.address + "</p>"
                            mg +=
                                "<img src='"+imgs+"' alt='news image' class='img-fluid' style='height: 350px;width: 300px'/><a href='ITDetail.aspx?ID=310'>learn more</a>";
                            img += "</div>";
                            img +=
                                "</li>"
                        })
                        div.html(img);
                    }
                }
            })
        }
        tourShow();

    })

    function changeTour(aid){
        window.location.href="${APP_PATH}/tour/tidimg?aid="+aid;
    }
</script>
</html>
