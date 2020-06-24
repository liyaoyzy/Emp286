<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/6/9
  Time: 11:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="zh-CN">
<head>
    <meta charset="GB18030">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="stylesheet" href="${BASE}/static/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${BASE}/static/css/font-awesome.min.css">
    <link rel="stylesheet" href="${BASE}/static/css/main.css">
    <style>
        .tree li {
            list-style-type: none;
            cursor:pointer;
        }
        table tbody tr:nth-child(odd){background:#F4F4F4;}
        table tbody td:nth-child(even){color:#C00;}
    </style>
</head>

<body>
<%@ include file="../static.jsp"%>
<div class="layui-carousel" id="carouselView">
    <div carousel-item="" id="preview">
    </div>
</div>
<div class="container-fluid">
    <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
            <div class="tree">
                                <%@ include file="../menu.jsp"%>
            </div>
        </div>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title"><i class="glyphicon glyphicon-th"></i> 数据列表</h3>
                </div>
                <div class="panel-body">
                    <form class="form-inline" role="form" style="float:left;">
                        <div class="form-group has-feedback">
                            <div class="input-group">
                                <div class="input-group-addon">查询条件</div>
                                <select type="email" class="form-control" name="aid" id="aid"
                                        placeholder="请输入地址名称"></select>
                            </div>
                        </div>
                        <button type="button" class="btn btn-warning" id="btnSelect" onclick="select()"><i class="glyphicon glyphicon-search"></i> 查询</button>
                    </form>
                    <button type="button" class="btn btn-danger" onclick="changeSave()" style="float:right;margin-left:10px;"><i class=" glyphicon glyphicon-remove"></i>批量删除</button>
                    <button type="button" class="btn btn-primary" style="float:right;" ><i class="glyphicon glyphicon-plus"></i> 新增</button>
                    <br>
                    <hr style="clear:both;">
                    <div class="table-responsive" >
                        <table class="table  table-bordered">
                            <thead>
                            <tr >
                                <th width="30">#</th>
                                <th width="30"><input type="checkbox"></th>
                                <th>图片</th>
                                <th>地址</th>
                                <th>时间</th>
                                <th>价格</th>
                                <th width="100">操作</th>
                            </tr>
                            </thead>
                            <tbody id="tbody1">
                            </tbody>
                            <tfoot>
                            <tr >
                                <td colspan="7" align="center">
                                    <ul class="pagination" id="byPage">
                                    </ul>
                                </td>
                            </tr>
                            </tfoot>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="${BASE}/static/jquery/jquery-2.1.1.min.js"></script>
<script src="${BASE}/static/bootstrap/js/bootstrap.min.js"></script>
<script src="${BASE}/static/script/docs.min.js"></script>
<script src="${BASE}/static/layer/layer.js"></script>
<script >
    $(function () {


        $("#btnSelect").click(function () {
            findByPage(1);
        });
        <!--分页-->
        findByPage(1);

        $(document).ready(function () {
            $.ajax({
                url: "${BASE}/tourimg/tourimgAll",
                success: function (data) {
                    var message = "<option>请选择地址</option>";
                    $.each(data.addressList, function (index, address) {
                        message += "<option value=" + address.aid + ">" + address.address + "</option>";
                    });
                    $("#aid").html(message);
                }
            });

        });
    })

    function findByPage(nowPage) {
        var roles=$("#role").val();
        $.ajax({
            url: "${BASE}/tourimg/tourimgAll",
            type: "post",
            data:{
                "nowPage": nowPage,
                "aid": $("#aid").val(),
            },
            success: function (data) {
                if (data.result) {
                    var message = "";
                    $.each(data.tourimgList, function (index, tourimg) {
                        message += "<tr>";
                        message += "<td>" + (index + 1) + "</td>";
                        message += "<td><input type='checkbox' class='abc' name='aids' value='"+tourimg.imgid+"'></td>";
                        message += "<td><img src='"+tourimg.img+"' height='60px' width='100px' style='margin-bottom:-10px'></td>";
                        message += "<td>" + tourimg.tour.tname+ "</td>";
                        message += "<td>" + tourimg.tour.times+ "</td>";
                        message += "<td>" + tourimg.tour.price+ "</td>";
                        message += "<td>";
                        message += "<button type='button' id='changeUpdatePay'  onclick='changeUpdate(" +tourimg.imgid+")' class='btn btn-primary btn-xs'><i class='glyphicon glyphicon-pencil'></i></button>";
                        message += "<button type='button' id='changeUpdateDelivery'  onclick='changeDelete("+tourimg.imgid+ ")' class='btn btn-danger btn-xs'><i class=' glyphicon glyphicon-minus '></i></button>";
                        message += "</td>";
                        message += "</tr>";
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
    <!--修改-->

    function changeUpdate(uid){
        window.location.href="${BASE}/user/UpdateOne?uid="+uid;
    }
    <!--赋予角色-->
    function changeRole(uid){
        window.location.href="${BASE}/user/assignRole?uid="+uid;
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
                url: "${BASE}/user/DeleteAll",
                type: "post",
                data: {"uids": uids,},
                success: function (data) {
                    if (data.result) {
                        layer.msg("发货成功", {time: 1000, icon: 6, shift: 6}, function () {
                        });
                        window.location.href = "${BASE}/user/list";
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
                url: "${BASE}/user/DeleteOne",
                type: "post",
                data: {"uid": uid,},
                success: function (data) {
                    if (data.result) {
                        layer.msg("用户删除成功", {time: 1000, icon: 6, shift: 6}, function () {
                        });
                        window.location.href = "${BASE}/user/list";
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

    function initCarousel(){
        layui.use(['layer', 'form'], function(){
            var carousel = layui.carousel;
            $.ajax({
                url: "/addressimg/addressimgAll",
                type: "post",
                data:{
                    "aid": $("#aid").val(),
                },
                success: function (data) {
                    if (data.result) {
                        var message = "";
                        $.each(data.addressimgList, function (index, addressimg) {
                            var str = '<div>\n' +
                                '         <img src="+addressimg.addimg+" alt="" style="width: 600px;height: 320px;">\n' +
                                '      </div>';
                            $('#preview').append(str);

                        });
                        //改变下时间间隔、动画类型、高度
                        var ins = carousel.render({
                            elem: '#carouselView'
                            , interval: 2000
                            , arrow: 'always'
                            , anim: 'default'
                            , width: '600px'
                            , height: '320px'
                        });
                        ins.reload({
                            elem: '#carouselView'
                            , interval: 2000
                            , arrow: 'always'
                            , anim: 'default'
                            , width: '600px'
                            , height: '320px'
                        });
                    }

                },
                error:function () {
                    alert("数据库查询失败，请联系管理员！")
                }
            });
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
