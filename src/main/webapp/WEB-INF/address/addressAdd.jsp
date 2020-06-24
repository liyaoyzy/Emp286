<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/6/17
  Time: 19:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
    <title>网站后台管理模版</title>
    <link href="${BASE}/static/admin/layui/css/layui.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="${BASE}/static/admin/css/admin.css" />
</head>
<body>
<div class="wrap-container">
    <form class="layui-form" style="width: 90%;padding-top: 20px;" id="from1">
        <div class="layui-form-item">
            <label class="layui-form-label">地址名称：</label>
            <div class="layui-input-block">
                <input type="text" name="address" required lay-verify="required" placeholder="请输入地址名称" autocomplete="off" class="layui-input">
            </div>

        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn layui-btn-normal" lay-submit lay-filter="formDemo" onclick="changeSave()" type="button">立即提交</button>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
    </form>
</div>

<script src="${BASE}/static/admin/layui/layui.js" type="text/javascript" charset="utf-8"></script>
<script src="${BASE}/static/admin/layui/layui.js" type="text/javascript" charset="utf-8"></script>
<script src="${BASE}/static/admin/js/common.js" type="text/javascript" charset="utf-8"></script>
<script src="${BASE}/static/admin/jquery/jquery-2.1.1.min.js"></script>
<script type="text/javascript">
    <!--新增-->
    function changeSave() {
        $.ajax({
            url: "${pageContext.request.contextPath}/address/saveOne",
            type: "post",
            data:  $("#from1").serialize(),
            success: function (data) {
                if (data.result) {
                    alert(data.result)
                    // layer.msg("信息新增成功", {time: 1000, icon: 6, shift: 6}, function () {
                    // });
                    window.location.href = "${pageContext.request.contextPath}/address/list";
                } else {
                    // layer.msg("信息新增失败", {time: 1000, icon: 5, shift: 6}, function () {
                    // });
                }
            }
        });
    }
</script>
</body>

</html>