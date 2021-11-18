<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2021/7/11
  Time: 10:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<%
    //动态获取基路径
    String basePath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";
%>
<head>
    <base href="<%=basePath%>" />
    <title>updateEmployee</title>
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
    <h3 align="center">修改职工信息</h3>
    <form class="form-horizontal" action="<%=basePath%>employee/updateEmployee.do" method="post">
        <div class="form-group">
            <label for="addEid" class="col-sm-2 control-label" style="">编号</label>
            <div class="col-sm-10">
                <input class="form-control" id="addEid" name="id" placeholder="userId">
            </div>
        </div>
        <div class="form-group">
            <label for="updateEage" class="col-sm-2 control-label">年龄</label>
            <div class="col-sm-10">
                <input class="form-control" id="updateEage" name="age" placeholder="userAge">
            </div>
        </div>
        <div class="form-group">
            <label for="addEbasesalary" class="col-sm-2 control-label">基本工资</label>
            <div class="col-sm-10">
                <input class="form-control" id="addEbasesalary" name="basesalary" placeholder="baseSalary">
            </div>
        </div>
        <div class="form-group">
            <label for="updateEworkyear" class="col-sm-2 control-label">工作年限</label>
            <div class="col-sm-10">
                <input class="form-control" id="updateEworkyear" name="workyear" placeholder="workyear">
            </div>
        </div><div class="form-group">
        <label for="updateDattend_day" class="col-sm-2 control-label">出勤天数</label>
        <div class="col-sm-10">
            <input class="form-control" id="updateDattend_day" name="attend_day" placeholder="attend_day">
        </div>
    </div>

        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
                <button type="submit" class="btn btn-default">添加</button>
            </div>
        </div>
    </form>
</div>
</body>
</html>
