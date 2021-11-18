<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2021/7/12
  Time: 14:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    //动态获取基路径
    String basePath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";
%>
<base href="<%=basePath%>" />
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="<%=basePath%>excel/upload.do" method="post" enctype="multipart/form-data" >
    选择要上传的文件:<input type="file" name="file">
    <input type="submit"  value="上传"></br>
</form>
</body>
</html>
