<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title></title>
    <link rel="stylesheet" href="${BASE}/static/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${BASE}/static/css/public.css" />
    <link rel="stylesheet" type="text/css" href="${BASE}/static/css/style.css" />
    <script type="text/javascript" src="${BASE}/static/bootstrap/js/jquery.min.js"></script>
    <script type="text/javascript" src="${BASE}/static/bootstrap/js/zturn.js"></script>
    <script src="${BASE}/static/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>

<!--轮播-->
<div class="lb_gl" >
    <div class="container">
        <h1 class="turn_3d" style="font-family: 仿宋">身未动 心已远 </h1>
        <div class="pictureSlider poster-main">
            <div class="poster-btn poster-prev-btn"></div>
            <ul id="zturn" class="poster-list"  >

            </ul>
        </div>
    </div>
</div>
<div id="div2">
<%@ include file="../tour/newtourimg.jsp"%>
</div>
</body>
<script type="text/javascript">


   $(function () {

       tourShow();

   })

        function tourShow() {
            $.ajax({
                url: "${BASE}/address/addressAllimg",
                type: "post",
                data: {
                    "aid": $("#aid").val(),
                },
                type: "post",
                success: function (data) {
                    if (data.result) {
                        var message = "";
                        $.each(data.addressList, function (index, address) {
                            let addressimg=address.addressimg;
                            let imgs="";
                            if (addressimg!=null) {
                                imgs= addressimg.addimg;
                            }else {
                                imgs="../static/images/bg1.jpg"
                            }

                            message += "<li class='poster-item zturn-item'>";
                            message += " <p class='say' style='color: black;font-family: 楷体;margin-top: -15px'>TOURISM</p>";
                            message += " <p class='xxgy' style='color: black;font-family: 楷体'>"+address.address+"</p>";
                            message += "<div class=‘for_btn’ style='height: 300px'>";
                            message += "<img src='"+imgs+"' width='100%' height='100%'>";
                            message += " </div>";
                            message += "<div class='zwjs'></div>";
                            message += "<button type='button' class='btn btn-sm' style='margin:0 13%'>推荐方案</button>";
                            message += "<a href='#div2'><button type='button' class='btn btn-sm' style='margin:0 12%' onclick='changeTour("+address.aid+")' >私人订制</button></a>";
                            message += "</div>";
                            message += "</li>";

                        })
                        $("#zturn").html(message);

                        var aa=new zturn({
                            id:"zturn",
                            opacity:0.9,
                            width:382,
                            Awidth:1024,
                            scale:0.9
                        })
                        var ab=new zturn({
                            id:"zturn2",
                            opacity:0.8,
                            width:382,
                            Awidth:1024,
                            scale:0.6
                        })

                    }
                }
            })


        }


       function changeTour(aid){
           window.location.href="${BASE}/tour/tidimg?aid="+aid;
       }


</script>
</html>
