<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/6/20
  Time: 11:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>jQuery相册图片掀开切换代码 - 站长素材</title>

    <link rel="stylesheet" type="text/css" href="${BASE}/static/bootstrap/css/style.css" />
</head>
<body>
<div class="container" style="margin-top:100px" id="tably">

</div>
<div class="name">
    <p></p>
</div>
</body>
<script type="text/javascript" src="${BASE}/static/jquery/jquery.min.js"></script>
<script type="text/javascript">
    $(function(){

        findByPage()

        var interval;
        $(".container img").click(function cover(){
            $(this).addClass("zoom").fadeOut(700,append);
            function append(){
                $(this).removeClass("zoom").appendTo(".container").show();
                var name = $(".container").children("img").first().attr("alt");
                $(".name p").text("No "+name);
            }

        })

        function auto(){
            var play = $(".container").children("img").first();
            play.addClass("zoom").fadeOut(700,append);
            function append(){
                $(this).removeClass("zoom").appendTo(".container").show();
                var name = $(this).parent().children("img").first().attr("alt");
                $(".name p").text(name);
            }
            interval = setTimeout(auto,5000);
        }

        $(".container img").hover(function(){
            stopPlay();
        },function(){
            interval = setTimeout(auto,5000);
        })

        function stopPlay(){
            clearTimeout(interval)
        }
        auto();

    })

    function findByPage() {
        $.ajax({
            url: "${BASE}/tour/tourAllimg",
            type: "post",
            data: {
                <%--"aid": ${aid},--%>
            },
            type: "post",
            success: function (data) {
                if (data.result) {
                    let div = $("#tourShow")
                    let message = "";
                    $.each(data.tourList, function (index, tour) {

                        let tourimg=tour.tourimg
                        let imgs="";
                        if (tourimg!=null) {
                            imgs= tourimg.img;
                        }else {
                            imgs="../static/images/bg1.jpg"
                        }
                        message += "  <img src='"+imgs+"' alt='"+tour.tname+"' />";
                    });
                    $("#tably").html(message);
                }
            }
        });
    }


</script>
</html>
