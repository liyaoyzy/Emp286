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
                                <input type="text" class="form-control" name="name" id="name"  placeholder="请输入饮食名称"></input>
                            </div>
                        </div>
                        <button type="button"  class="btn btn-warning" id="btnSelect" ><i class="glyphicon glyphicon-search"></i> 查询</button>
                    </form>
                    <button type="button" class="btn btn-danger" onclick="changeDeleteAll()" style="float:right;margin-left:10px;"><i class=" glyphicon glyphicon-remove"></i>批量删除</button>
                    <button type="button" class="btn btn-primary"  data-toggle="modal" data-target="#myModal" style="float:right;" ><i class="glyphicon glyphicon-plus"></i> 新增</button>

                    <!-- Modal -->
                    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content" style="padding: 15px 15px">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                    <h4 class="modal-title" id="myModalLabel">新增饮食</h4>
                                </div>
                                <form role="form" id="from1"  enctype="multipart/form-data">
                                    <div class="form-group">
                                        <%--@declare id="exampleinputpassword1"--%><label for="exampleInputPassword1">饮食名称</label>
                                        <input type="text" class="form-control" name="fname" id="fname" placeholder="请输入饮食名称">
                                    </div>
                                    <div class="form-group">
                                        <%--@declare id="exampleinputpassword1"--%><label for="exampleInputPassword1">价格</label>
                                        <input type="text" class="form-control" name="price" id="price" placeholder="请输入价格">
                                    </div>
                                    <button type="button" class="btn btn-success" id="btnAdd" onclick="changeSave()"><i class="glyphicon glyphicon-plus"></i> 新增</button>
                                </form>
                            </div><!-- /.modal-content -->
                        </div><!-- /.modal-dialog -->
                    </div><!-- /.modal -->

                    <br>
                    <hr style="clear:both;">
                    <div class="table-responsive" >
                        <table class="table  table-bordered">
                            <thead>
                            <tr >
                                <th width="30">#</th>
                                <th width="30"><input type="checkbox"></th>
                                <th>饮食名称</th>
                                <th>价格</th>
                                <th width="100" >操作</th>
                            </tr>
                            </thead>
                            <tbody id="tbody1">
                            </tbody>
                            <tfoot>
                            <tr >
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
    </div>
</div>
<script src="${BASE}/static/jquery/jquery-2.1.1.min.js"></script>
<script src="${BASE}/static/bootstrap/js/bootstrap.min.js"></script>
<script src="${BASE}/static/script/docs.min.js"></script>
<script src="${BASE}/static/layer/layer.js"></script>
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
            url: "${pageContext.request.contextPath}/food/paginationFood",
            type: "post",
            data:{
                "nowPage": nowPage,
                "fname": $("#name").val(),
            },
            success: function (data) {
                if (data.result) {
                    var message = "";
                    $.each(data.foodList, function (index, food) {
                        message += "<tr>";
                        message += "<td>" + (index + 1) + "</td>";
                        message += "<td><input type='checkbox' class='abc' name='aids' value='"+food.fid+"'></td>";
                        message += "<td>" + food.fname+ "</td>";
                        message += "<td>" + food.price+ "</td>";
                        message += "<td>";
                        message += "<button type='button' id='changeUpdatePay'  onclick='changeUpdate(" +food.fid +")' class='btn btn-primary btn-xs'><i class='glyphicon glyphicon-pencil'></i></button>";
                        message += "<button type='button' id='changeUpdateDelivery'  onclick='changeDelete("+food.fid+ ")' class='btn btn-danger btn-xs'><i class=' glyphicon glyphicon-minus '></i></button>";
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

    function changeUpdate(fid){
        window.location.href="${pageContext.request.contextPath}/food/selectOne?fid="+fid;
    }

    <!--单个删除-->
    function changeDelete(fid) {
        layer.confirm("是否删除选中的信息？", {icon: 3, title: '提示'}, function (cindex) {
            $.ajax({
                url: "${pageContext.request.contextPath}/food/deleteOne",
                type: "post",
                data: {"fid": fid,},
                success: function (data) {
                    if (data.result) {
                        layer.msg("信息删除成功", {time: 1000, icon: 6, shift: 6}, function () {
                        });
                        window.location.href = "${pageContext.request.contextPath}/food/list";
                    } else {
                        layer.msg("信息删除失败", {time: 1000, icon: 5, shift: 6}, function () {
                        });
                    }
                }
            });
            layer.close(cindex);
        }, function (cindex) {
            layer.close(cindex);
        });
    }

    <!--批量删除-->
    function changeDeleteAll() {
        layer.confirm("是否删除选中的信息？", {icon: 3, title: '提示'}, function (cindex) {
            var fids = '';
            $('input:checkbox').each(function(){
                if(this.checked == true){
                    fids += this.value + ',';
                }
            });
            $.ajax({
                url: "${pageContext.request.contextPath}/food/deleteFoodAll",
                type: "post",
                data: {"fids": fids,},
                success: function (data) {
                    if (data.result) {
                        layer.msg("删除成功", {time: 1000, icon: 6, shift: 6}, function () {
                        });
                        window.location.href = "${pageContext.request.contextPath}/food/list";
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
    function changeSave() {
        $.ajax({
            url: "${pageContext.request.contextPath}/food/saveOne",
            type: "post",
            data:  $("#from1").serialize(),
            success: function (data) {
                if (data.result) {
                    layer.msg("信息新增成功", {time: 1000, icon: 6, shift: 6}, function () {
                    });
                    window.location.href = "${pageContext.request.contextPath}/food/list";
                } else {
                    layer.msg("信息新增失败", {time: 1000, icon: 5, shift: 6}, function () {
                    });
                }
            }
        });
    }

</script>
</body>
</html>
