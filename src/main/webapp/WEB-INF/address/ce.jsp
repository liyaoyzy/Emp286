<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/6/18
  Time: 14:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="${APP_PATH}/static/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${APP_PATH}/static/css/font-awesome.min.css">
    <link rel="stylesheet" href="${APP_PATH}/static/css/main.css">
</head>
<body>


<div class="layui-carousel" id="carouselView">
    <div carousel-item="" id="preview">

    </div>
</div>



<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
        <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
        <li data-target="#carousel-example-generic" data-slide-to="1"></li>
        <li data-target="#carousel-example-generic" data-slide-to="2"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner" id="tbody1">
<%--        <div class="item active" >--%>

<%--            <div class="carousel-caption">--%>

<%--            </div>--%>
<%--        </div>--%>

    </div>


    <!-- Controls -->
    <a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
        <span class="glyphicon glyphicon-chevron-left"></span>
    </a>
    <a class="right carousel-control" href="#carousel-example-generic" data-slide="next">
        <span class="glyphicon glyphicon-chevron-right"></span>
    </a>
</div>
<script src="${APP_PATH}/static/jquery/jquery-2.1.1.min.js"></script>
<script src="${APP_PATH}/static/bootstrap/js/bootstrap.min.js"></script>
<script src="${APP_PATH}/static/script/docs.min.js"></script>
<script src="${APP_PATH}/static/layer/layer.js"></script>
<script type="text/javascript">

    $(function () {
        $("#btnSelect").click(function () {
            findByPage();
        });
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

    <!--查询-->
    // function select(){
    //     alert("h")
    //     findByPage(1);
    // }

    function findByPage(nowPage) {
        $.ajax({
            url: "${pageContext.request.contextPath}/addressimg/addressimgAll",
            type: "post",
            data:{
                "nowPage": nowPage,
                "aid": $("#aid").val(),
            },
            success: function (data) {
                if (data.result) {
                    var message = "";
                    $.each(data.addressimgList, function (index, addressimg) {
                        message += "<tr>";
                        message += "<td>" + (index + 1) + "</td>";
                        message += "<td><input type='checkbox' class='abc' name='aids' value='"+addressimg.addid+"'></td>";
                        message += "<td><img src='"+addressimg.addimg+"' height='60px' width='100px' style='margin-bottom:-10px'></td>";
                        message += "<td>" + addressimg.address.address+ "</td>";
                        message += "<td>";
                        message += "<button type='button' id='changeUpdatePay'  onclick='changeUpdate(" +addressimg.addid+")' class='btn btn-primary btn-xs'><i class='glyphicon glyphicon-pencil'></i></button>";
                        message += "<button type='button' id='changeUpdateDelivery'  onclick='changeDelete("+addressimg.addid+ ")' class='btn btn-danger btn-xs'><i class=' glyphicon glyphicon-minus '></i></button>";
                        message += "</td>";
                        message += "</tr>";
                    });
                    $("#").html(message);
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
    <!--修改-->

    function changeUpdate(uid){
        window.location.href="${pageContext.request.contextPath}/user/UpdateOne?uid="+uid;
    }
    <!--赋予角色-->
    function changeRole(uid){
        window.location.href="${pageContext.request.contextPath}/user/assignRole?uid="+uid;
    }
    <!--批量删除-->
    function changeDeleteAll() {
        layer.confirm("是否删除选中的用户？", {icon: 3, title: '提示'}, function (cindex) {
            var uids = '';
            $('input:checkbox').each(function(){
                if(this.checked == true){
                    uids += this.value + ',';
                }
            });
            $.ajax({
                url: "${pageContext.request.contextPath}/user/DeleteAll",
                type: "post",
                data: {"uids": uids,},
                success: function (data) {
                    if (data.result) {
                        layer.msg("发货成功", {time: 1000, icon: 6, shift: 6}, function () {
                        });
                        window.location.href = "${pageContext.request.contextPath}/user/list";
                    } else {
                        layer.msg("发货失败", {time: 1000, icon: 5, shift: 6}, function () {
                        });
                    }
                }
            });
            layer.close(cindex);
        }, function (cindex) {
            layer.close(cindex);
        });
    }

    <!--单个删除-->
    function changeDelete(uid) {
        layer.confirm("是否删除选中的用户？", {icon: 3, title: '提示'}, function (cindex) {
            $.ajax({
                url: "${pageContext.request.contextPath}/user/DeleteOne",
                type: "post",
                data: {"uid": uid,},
                success: function (data) {
                    if (data.result) {
                        layer.msg("用户删除成功", {time: 1000, icon: 6, shift: 6}, function () {
                        });
                        window.location.href = "${pageContext.request.contextPath}/user/list";
                    } else {
                        layer.msg("用户删除失败", {time: 1000, icon: 5, shift: 6}, function () {
                        });
                    }
                }
            });
            layer.close(cindex);
        }, function (cindex) {
            layer.close(cindex);
        });
    }

    function findByPage() {
        $.ajax({
            url: "${APP_PATH}/address/addressAllimg",
            type: "post",
            data:{
                "aid": $("#aid").val(),
            },
            success: function (data) {
                if (data.result) {
                    var message = "";
                    $.each(data.addressList, function (index, address) {
                        message +="<div class='carousel-item' >"
                        message += "<img src='"+address.addressimg.addimg+"' style='height: 300px' width='300px' alt=''>";
                        message +="<div class='carousel-caption'><p>"+address.address+"</p></div>"
                        message +="</div>"
                    });
                    $("#tbody1").html(message);
                }
            }
        });
    }

    $("tbody .btn-success").click(function(){
        window.location.href = "assignRole.html";
    });
    $("tbody .btn-primary").click(function(){
        window.location.href = "edit.html";
    });
</script>
</body>
</html>
