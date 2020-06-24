<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
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
<div class="container-fluid">
    <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
            <div class="tree">
                                <%@ include file="../menu.jsp"%>
            </div>
        </div>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
            <ol class="breadcrumb">
                <li><a href="#">首页</a></li>
                <li><a href="#">数据列表</a></li>
                <li class="active">修改</li>
            </ol>
            <div class="panel panel-default">
                <div class="panel-heading">表单数据<div style="float:right;cursor:pointer;" data-toggle="modal" data-target="#myModal"><i class="glyphicon glyphicon-question-sign"></i></div></div>
                <div class="panel-body">
                    <form role="form" id="form1">
                        <div class="form-group">
                            <%--@declare id="exampleinputpassword"--%><label for="exampleInputPassword">地址名称</label>
                                <input type="hidden" class="form-control" value="${tour.tid}" name="tid" id="tid" >
                                <select type="email" class="form-control" name="aid" id="aid">
                                </select>
                        </div>
                        <div class="form-group">
                            <label for="exampleInputPassword">景区名称</label>
                            <input type="text" class="form-control" value="${tour.tname}" name="tname" id="tname" placeholder="请输入景区名称">
                        </div>
                        <div class="form-group">
                            <%--@declare id="exampleinputpassword"--%><p><label for="exampleInputPassword">图片</label></p>
                            <img src="${tour.tourimg.img}" style="height: 200px;width: 300px">
                        </div>
                        <div class="form-group">
                            <%--@declare id="exampleinputpassword1"--%><label for="exampleInputPassword1">修改图片</label>
                            <input type="file" name="files" id="files"/>
                        </div>
                        <div class="form-group">
                            <label for="exampleInputPassword">需要时间</label>
                            <input type="text" class="form-control" value="${tour.times}" name="times" id="times" placeholder="请输入需要时间">
                        </div>
                        <div class="form-group">
                            <label for="exampleInputPassword">价格</label>
                            <input type="text" class="form-control" value="${tour.price}" name="price" id="price" placeholder="请输入价格">
                        </div>
                        <button type="button" class="btn btn-success" id="btnUpdate"><i class="glyphicon glyphicon-plus"></i> 确认修改</button>
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

        $(document).ready(function () {
            $.ajax({
                url: "${pageContext.request.contextPath}/address/addresslist",
                success: function (data) {
                    var message = " <option value='${tour.address.aid}'>${tour.address.address}</option>";
                    $.each(data.addressList, function (index, address) {
                        message += "<option value=" + address.aid + ">" + address.address + "</option>";
                    });
                    $("#aid").html(message);
                }
            });
        });


        $("#btnUpdate").click(function(){
            var data = new FormData();
            data.append("aid",$("#aid").val());
            data.append("tid",$("#tid").val());
            data.append("tname",$("#tname").val());
            data.append("times",$("#times").val());
            data.append("price",$("#price").val());
            data.append("files",$("#files").get(0).files[0]);
            $.ajax({
                url:"${BASE}/tour/updateTour",
                type:"post",
                contentType: false,
                data: data ,
                processData: false,
                success:function(data){
                    if(data.result){
                        layer.msg("信息角色成功", {time:1000, icon:6, shift:6},function(){});
                        window.location.href="${BASE}/tour/list";
                    }else{
                        layer.msg("信息角色失败", {time:1000, icon:5, shift:6},function(){});
                    }
                }
            });
        });
        $("#btnReset").click(function(){
            $("#form1")[0].reset();
        });
    });
</script>
</body>
</html>
