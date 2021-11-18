<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2021/7/10
  Time: 21:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    //动态获取基路径
    String basePath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";
%>
<html>
<head>
    <base href="<%=basePath%>" />
    <title>updateUser</title>
    <script src="/Employment/JQuery/JQuery.js"></script>
    <!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
    <script src="/Employment/bootstrap/js/bootstrap.min.js"></script>
    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <link rel="stylesheet" href="/Employment/bootstrap/css/bootstrap.min.css">
    <script type="text/css">

    </script>
</head>
<body class="bg-primary" background="${pageContext.request.contextPath}/img/bg.jpeg">
<div class="container-fluid" style="height: 100px;"></div>
<div class="col-lg-6 col-lg-offset-3 bg-info  text-muted" style="border-radius: 15px">
    <h3 align="center">修改用户</h3>
    <form class="form-horizontal" action="<%=basePath%>user/updateUser.do" method="post">
        <div class="form-group">
            <label for="adduserid" class="col-sm-2 control-label" style="">选择要修改的userid</label>
            <div class="col-sm-10">
                <input class="form-control" id="adduserid" name="userid" placeholder="userid">
            </div>
        </div>
        <div class="form-group">
            <label for="addusername" class="col-sm-2 control-label" style="">修改的username</label>
            <div class="col-sm-10">
                <input class="form-control" id="addusername" name="username" placeholder="username">
            </div>
        </div>
        <div class="form-group">
            <label for="addpassword" class="col-sm-2 control-label">修改的password</label>
            <div class="col-sm-10">
                <input type="password" class="form-control" id="addpassword" name="password" placeholder="password">
            </div>
        </div>
        <div class="form-group">
            <label for="addpriority" class="col-sm-2 control-label">修改的priority</label>
            <div class="col-sm-10">
                <input class="form-control" id="addpriority" name="priority" placeholder="priority">
            </div>
        </div>

        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
                <button type="submit" class="btn btn-default">更新</button>
            </div>
        </div>
    </form>
</div>
</body>
</html>
