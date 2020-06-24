<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/6/17
  Time: 17:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html class="iframe-h">

<head>
    <meta charset="UTF-8">
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no"/>
    <title>网站后台管理模版</title>
    <link rel="stylesheet" type="text/css" href="../static/layui/css/layui.css"/>
    <link rel="stylesheet" type="text/css" href="${APP_PATH}/static/admin/css/admin.css"/>
</head>

<body class="iframe-h gray-bg">
<div class="wrap-container column-wrap clearfix">
    <div class="column-edge">
        <ul class="layui-nav layui-nav-tree layui-nav-no-bg" lay-filter="column">
            <li class="layui-nav-item">
                <a href="javascript:;">单页管理</a>
                <dl class="layui-nav-child">
                    <dd>
                        <a href="column-danye.html">关于我们</a>
                    </dd>
                    <dd>
                        <a href="column-danye.html">联系我们</a>
                    </dd>
                    <dd>
                        <a href="column-danye.html">网站地图</a>
                    </dd>
                </dl>
            </li>
            <li class="layui-nav-item">
                <a href="javascript:;">新闻中心</a>
                <dl class="layui-nav-child">
                    <dd>
                        <a href="column-news.html">公司新闻</a>
                    </dd>
                    <dd>
                        <a href="column-news.html">行业新闻</a>
                    </dd>
                </dl>
            </li>
            <li class="layui-nav-item layui-this">
                <a href="column-news.html">产品</a>
            </li>
            <li class="layui-nav-item">
                <a href="column-news.html">大数据</a>
            </li>
        </ul>

    </div>
    <div class="column-content">
        <div class="column-content-detail">
            <form class="layui-form" action="">
                <div class="layui-form-item">
                    <div class="layui-inline tool-btn">
                        <button class="layui-btn layui-btn-small layui-btn-normal addBtn"
                                onclick="window.location.href='${APP_PATH}/address/addForm'"><i class="layui-icon">&#xe654;</i>
                        </button>
                        <button class="layui-btn layui-btn-small layui-btn-danger delBtn"><i
                                class="layui-icon">&#xe640;</i></button>
                        <button class="layui-btn layui-btn-small layui-btn-warm listOrderBtn hidden-xs"><i
                                class="iconfont">&#xe656;</i></button>
                    </div>
                    <div class="layui-inline">
                        <input type="text" class="form-control" name="aname" id="aname" placeholder="请输入城市名称"></input>
                    </div>
                    <button class="layui-btn layui-btn-normal" lay-submit="search">搜索</button>
                </div>
            </form>
            <div class="layui-form" id="table-list">
                <table class="layui-table" lay-even lay-skin="nob">
                    <colgroup>
                        <col width="50">
                        <col class="hidden-xs" width="50">
                        <col>
                        <col width="200">
                    </colgroup>
                    <thead>
                    <tr>

                        <th><input type="checkbox" name="" lay-skin="primary" lay-filter="allChoose"></th>
                        <th class="hidden-xs">ID</th>
                        <th>地址名称</th>
                        <th>操作</th>

                    </tr>
                    </thead>
                    <tbody id="tbody1">
                    </tbody>
                    <tfoot>
                    <tr>
                        <td colspan="6" align="center">
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
<script src="https://cdn.bootcdn.net/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="../static/layui/layui.js" type="text/javascript" charset="utf-8"></script>
<script src="${APP_PATH}/static/admin/js/common.js" type="text/javascript" charset="utf-8"></script>


<script type="text/javascript">


    $(function () {

        $("#btnSelect").click(function () {
            findByPage(1);
        });
        <!--分页-->
        findByPage(1);

    })

    function findByPage(nowPage) {
        $.ajax({
            url: "${pageContext.request.contextPath}/address/paginationAddress",
            type: "post",
            data: {
                "nowPage": nowPage,
                "fname": $("#name").val(),
            },
            success: function (data) {
                if (data.result) {
                    var message = "";
                    $.each(data.addressList, function (index, address) {
                        message += "<tr>";
                        message += "<td><input type='checkbox' class='abc' name='aids' value='" + address.aid + "' lay-skin='primary' lay-filter='allChoose'></td>";
                        message += "<td>" + (index + 1) + "</td>";
                        message += "<td>" + address.address + "</td>";
                        message += "<td>";
                        message += "<button type='button' id='changeUpdatePay'  onclick='changeUpdate(" + address.aid + ")' class='layui-btn layui-btn-small layui-btn-normal go-btn' data-id='1'><i class='layui-icon'>&#xe642;</i></button>";
                        message += "<button type='button' id='changeUpdateDelivery'  onclick='changeDelete(" + address.aid + ")' class='layui-btn layui-btn-small layui-btn-danger del-btn' data-id='1'><i class='layui-icon'>&#xe640;</i></button>";
                        message += "<button type='button' id='changeUpdateDelivery'  onclick='changeSaveimg(" + address.aid + ")' class='layui-btn layui-btn-small layui-btn-warm go-btn data-id='1''><i class='layui-icon'>&#xe64a;</i></button>";
                        message += "</td>";
                        message += "</tr>";
                    });
                    $("#tbody1").html(message);
                    var pageInfo = "";
                    pageInfo += "<li " + (data.pageBean.nowPage == 1 ? "class='disabled'" : "") + "><a onclick='findByPage(" + (data.pageBean.nowPage == 1 ? 1 : data.pageBean.nowPage - 1) + ")'>«</a></li>";
                    for (var i = 1; i <= data.pageBean.countPage; i++) {
                        pageInfo += "<li " + (data.pageBean.nowPage == i ? "class='active'" : "") + "><a onclick='findByPage(" + (i) + ")'>" + i + "</a></li>";
                    }
                    pageInfo += "<li " + (data.pageBean.nowPage == data.pageBean.countPage ? "class='disabled'" : "") + "><a  onclick='findByPage(" + (data.pageBean.nowPage == data.pageBean.countPage ? data.pageBean.countPage : data.pageBean.nowPage + 1) + ")'>»</a></li>";
                    $("#byPage").html(pageInfo);
                }
            }
        });
    }

    <!--修改-->
    function changeUpdate(aid) {
        window.location.href = "${pageContext.request.contextPath}/address/slelectOne?aid=" + aid;
    }

    <!--新增照片-->
    function changeSaveimg(aid) {
        window.location.href = "${pageContext.request.contextPath}/address/saveImg?aid=" + aid;
    }

    <!--单个删除-->
    function changeDelete(aid) {
        layui.use('layer', function () {
            alert(222);
            var layer = layui.layer;
            layer.msg('你确定删除么？', {
                time: 2000,//2秒自动关闭
                btn: ['确定', '取消'],
                yes: function (index) {
                    console.log(aid);
                    $.ajax({
                        url: "${pageContext.request.contextPath}/address/deleteOne",
                        type: "post",
                        data: {"aid": aid,},
                        success: function (data) {
                            alert(123);
                            if (data.result) {
                                layer.msg("信息删除成功", {time: 1000, icon: 6, shift: 6}, function () {
                                });
                                window.location.href = "${pageContext.request.contextPath}/address/list";
                            } else {
                                layer.msg("信息删除失败", {time: 1000, icon: 5, shift: 6}, function () {
                                });
                            }
                        }
                    });
                    layer.close(cindex);
                }, function(cindex) {
                    layer.close(cindex);
                }
                });
        });
    }



    <!--批量删除-->
    function changeDeleteAll() {
        var layer = layui.layer;
        layer.confirm("是否删除选中的信息？", {icon: 3, title: '提示'}, function (cindex) {
            var aids = '';
            $('input:checkbox').each(function () {
                if (this.checked == true) {
                    aids += this.value + ',';
                }
            });
            $.ajax({
                url: "${pageContext.request.contextPath}/address/deleteAll",
                type: "post",
                data: {"aids": aids,},
                success: function (data) {
                    if (data.result) {
                        layer.msg("删除成功", {time: 1000, icon: 6, shift: 6}, function () {
                        });
                        window.location.href = "${pageContext.request.contextPath}/address/list";
                    } else {
                        layer.msg("删除失败", {time: 1000, icon: 5, shift: 6}, function () {
                        });
                    }
                }
            });
            layer.close(cindex);
        }, function (cindex) {
            layer.close(cindex);
        });
    }

    <!--新增-->
    <%--function changeSave() {--%>
    <%--    var layer = layui.layer;--%>
    <%--    $.ajax({--%>
    <%--        url: "${pageContext.request.contextPath}/address/saveOne",--%>
    <%--        type: "post",--%>
    <%--        data: $("#from1").serialize(),--%>
    <%--        success: function (data) {--%>
    <%--            if (data.result) {--%>
    <%--                layer.msg("信息新增成功", {time: 1000, icon: 6, shift: 6}, function () {--%>
    <%--                });--%>
    <%--                window.location.href = "${pageContext.request.contextPath}/address/list";--%>
    <%--            } else {--%>
    <%--                layer.msg("信息新增失败", {time: 1000, icon: 5, shift: 6}, function () {--%>
    <%--                });--%>
    <%--            }--%>
    <%--        }--%>
    <%--    });--%>
    <%--}--%>


    $("tbody .btn-success").click(function () {
        window.location.href = "assignRole.html";
    });
    $("tbody .btn-primary").click(function () {
        window.location.href = "edit.html";
    });


</script>
</body>

</html>
