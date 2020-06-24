<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/6/15
  Time: 15:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="fileUpload" method="post" enctype="multipart/form-data">
    <label>上传图片</label>
    <input type="file" name="files"/>
    <input type="submit" value="上传"/>
</form>

<p>图片:</p>
<img src="${filename}"/>
<img src="${pageContext.request.contextPath}/addressimg/832b8f46-95bc-4239-919f-989f2fe7f515.jpg">
<h1>${pageContext.request.contextPath}</h1>
<img src="../addressimg/e42ad585-5aff-45b7-acb3-a9a1261f9d73.jpg
">
</body>
</html>
