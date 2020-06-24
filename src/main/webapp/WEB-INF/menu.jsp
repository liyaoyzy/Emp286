<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/6/9
  Time: 11:17
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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/font-awesome.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/ztree/zTreeStyle.css">
</head>
<body>
<div class="container-fluid">
    <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
            <div class="tree">
                <ul style="padding-left:0px;" class="list-group">
                    <li class="list-group-item tree-closed">
                        <a href="main.html"><i class="glyphicon glyphicon-dashboard"></i> 主页</a>
                    </li>
                    <li class="list-group-item tree-closed">
                        <span><i class="glyphicon glyphicon glyphicon-tasks"></i> 页面管理 <span class="badge"
                                                                                             style="float:right">3</span></span>
                        <ul style="margin-top:10px;display:none;">
                            <li style="height:30px;">
                                <a href="${BASE}/address/list"><i class="glyphicon glyphicon-user"></i> 地址管理</a>
                            </li>
                            <li style="height:30px;">
                                <a href="${BASE}/tour/list"><i class="glyphicon glyphicon-king"></i> 景区管理</a>
                            </li>
                            <li style="height:30px;">
                                <a href="${BASE}/food/list"><i class="glyphicon glyphicon-lock"></i> 饮食管理</a>
                            </li>
                        </ul>
                    </li>

                </ul>
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

        <%--$.ajax({--%>
        <%--    //要获得当前登录用户所有的许可--%>
        <%--    url:"${pageContext.request.contextPath  }/permission/listByPid",--%>
        <%--    type:"post",--%>
        <%--    success:function(data){--%>

        <%--        $.each(data.permissionList,function(index,permission){--%>
        <%--            //父节点--%>
        <%--            var message = '<li class="list-group-item tree-closed">';--%>
        <%--            message += '<a href="${pageContext.request.contextPath  }/main"><i class="glyphicon glyphicon-dashboard"></i> 主页</a></li><li class="list-group-item">';--%>
        <%--            message += '<span><i class="glyphicon glyphicon glyphicon-tasks"></i>'+permission.name+'<span class="badge" style="float:right">'+permission.children.length+'</span></span>';--%>
        <%--            if(permission.children.length!=0){--%>
        <%--                message += '<ul style="margin-top:10px;display:none;">';--%>
        <%--                $.each(permission.children,function(index,child){--%>
        <%--                    message += '<li >';--%>
        <%--                    &lt;%&ndash;message += '<a href="${pageContext.request.contextPath  }/'+child.url+'"><i class="glyphicon glyphicon-user"></i>'+child.name+'</a>';&ndash;%&gt;--%>
        <%--                    message += '<span><i class="glyphicon glyphicon glyphicon-tasks"></i>'+child.name+'<span class="badge" style="float:right">'+permission.children.length+'</span></span>';--%>
        <%--                    if(child.children.length!=0){--%>
        <%--                        message += '<ul style="margin-top:10px;display:none;">';--%>
        <%--                        $.each(child.children,function(index,child2){--%>
        <%--                            message += '<li>';--%>
        <%--                            message += '<a href="${pageContext.request.contextPath  }/'+child2.url+'"><i class="glyphicon glyphicon-user"></i>'+child2.name+'</a>';--%>
        <%--                            message += '</li>';--%>
        <%--                        });--%>
        <%--                        message += '</ul>';--%>
        <%--                    }--%>
        <%--                    message += '</li>';--%>
        <%--                });--%>
        <%--                message += '</ul>';--%>
        <%--            }--%>
        <%--            message += '</li></li>';--%>
        <%--            $("#permissionUl").html(message);--%>
        $(".list-group-item").click(function () {
            if ($(this).find("ul")) {
                $(this).toggleClass("tree-closed");
                if ($(this).hasClass("tree-closed")) {
                    $("ul", this).hide("fast");
                } else {
                    $("ul", this).show("fast");
                }
            }
        });
        //         });
        //     }
        // });
    })

</script>
</body>
</html>
