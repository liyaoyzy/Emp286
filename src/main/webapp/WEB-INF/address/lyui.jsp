<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/6/18
  Time: 15:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="${APP_PATH}/static/layui/css/layui.css">
    <script src="${APP_PATH}/static/layui/layui.js"></script>
</head>
<body>

<div class="layui-carousel" id="carouselView" style="margin:0 auto;">
    <div carousel-item="" id="preview">

    </div>
</div>
<script src="${APP_PATH}/static/jquery/jquery-2.1.1.min.js"></script>
<script src="${APP_PATH}/static/bootstrap/js/bootstrap.min.js"></script>
<script src="${APP_PATH}/static/script/docs.min.js"></script>
<script src="${APP_PATH}/static/layui/layui.js"></script>
<script type="text/javascript">

    $(function () {
        initCarousel()
    })
    function initCarousel(){
        layui.use(['carousel', 'form'], function(){
            var carousel = layui.carousel;
            $.ajax({
                url: "${APP_PATH}/address/addressAllimg",
                type: "post",
                data:{
                    "aid": $("#aid").val(),
                },
                success:function (data) {
                    var message ="";
                    $.each(data.addressList, function (index, address) {
                        // var str = '<div>\n' + '<p>'+address.address+'</p>'
                        //     '         <img src="'+address.addressimg.addimg+'" style="height: 300px" width="600px">' +
                        //     '      </div>';

                        message +="<div class='carousel-item' style='margin: 0 auto'>"
                        message +="<div class='carousel-caption' style='text-align:center'><h2 style='color: hotpink'>" + address.address+ "</h2></div>"
                        message += "<img src='"+address.addressimg.addimg+"' style='height: 100%' width='100%' alt='' onclick='changeTour(" +address.aid +")'>";

                        message +="</div>"
                        // $('#preview').append(str);
                        $('#preview'). html(message);
                    });
                    //改变下时间间隔、动画类型、高度
                    var ins = carousel.render({
                        elem: '#carouselView'
                        ,interval: 3000
                        ,arrow: 'always'
                        ,anim: 'default'
                        ,width:'80%'
                        ,height:'70%'
                    });
                    ins.reload({
                        elem: '#carouselView'
                        ,interval: 3000
                        ,arrow: 'always'
                        ,anim: 'default'
                        ,width:'80%'
                        ,height:'70%'
                    });
                },
                error:function () {
                    alert("数据库查询失败，请联系管理员！")
                }
            });
        });
    }


    <!--根据选择的城市显示景区-->
    function changeTour(aid){
        window.location.href="${APP_PATH}/tour/tid?aid="+aid;
    }

</script>
</body>
</html>
