<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/6/9
  Time: 20:03
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
    <link rel="stylesheet" href="${BASE}/static/css/doc.min.css">
    <style>
    </style>
</head>

<body>
<%--<%@ include file="../static.jsp"%>--%>
<div class="container-fluid">
    <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
            <div class="tree">
                <%--                <%@ include file="../menu.jsp"%>--%>
            </div>
        </div>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
            <ol class="breadcrumb">
                <li><a href="#">首页</a></li>
                <li><a href="#">数据列表</a></li>
                <li class="active">新增</li>
            </ol>
            <div class="panel panel-default">
                <div class="panel-heading">表单数据<div style="float:right;cursor:pointer;" data-toggle="modal" data-target="#myModal"><i class="glyphicon glyphicon-question-sign"></i></div></div>
                <div class="panel-body">
                    <form role="form" id="from1"  enctype="multipart/form-data">
                        <div class="form-group">
                            <%--@declare id="exampleinputemail1"--%><label for="exampleInputEmail1">地址</label>
                            <input type="hidden" class="form-control" name="tid" id="tid" value="${tour.tid}">
                            <input type="text" readonly="true" class="form-control" name="address" id="address" value="${tour.tname}">
                        </div>
                        <div class="form-group">
                            <%--@declare id="exampleinputpassword1"--%><label for="exampleInputPassword1">请选择照片</label>
                            <input type="file" name="files" id="files"/>
                        </div>
                        <button type="button" class="btn btn-success" id="btnAdd"><i class="glyphicon glyphicon-plus"></i> 新增</button>
                        <button type="button" class="btn btn-danger"><i class="glyphicon glyphicon-refresh"></i> 重置</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="${BASE}/static/jquery/jquery-2.1.1.min.js"></script>
<script src="${BASE}/static/bootstrap/js/bootstrap.min.js"></script>
<script src="${BASE}/static/script/docs.min.js"></script>
<script src="${BASE}/static/layer/layer.js"></script>
<script type="text/javascript">
    $(function () {



        $("#btnAdd").click(function () {
            var data = new FormData();
            data.append("tid",$("#tid").val());
            data.append("files",$("#files").get(0).files[0]);
            $.ajax({
                url: "${pageContext.request.contextPath}/tourimg/saveimg",
                type: "post",
                contentType: false,
                data: data ,
                processData: false,
                success: function (data) {
                    if (data.result) {
                        layer.msg("图片新增成功", {time: 1000, icon: 6, shift: 6}, function () {
                        });
                        window.location.href = "${pageContext.request.contextPath}/tour/list";
                    } else {
                        layer.msg("图片新增失败", {time: 1000, icon: 5, shift: 6}, function () {
                        });
                    }
                }
            });
        });
    });
</script>
</body>
</html>
