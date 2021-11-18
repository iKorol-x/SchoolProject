<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2021/7/11
  Time: 15:46
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
    <title>汇总信息</title>
    <script src="/Employment/JQuery/JQuery.js"></script>
    <!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
    <script src="/Employment/bootstrap/js/bootstrap.min.js"></script>
    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <link rel="stylesheet" href="/Employment/bootstrap/css/bootstrap.min.css">


</head>
<script type="text/javascript">
    <%--$(function (){--%>
    <%--
    <%--})--%>
    $(function (){
        loadUserData();
        $("#exportEmployeeInfo").click(function (){
            window.location.href="${pageContext.request.contextPath}/excel/exportEmployeeInfo.do";
        })
    })
    function loadUserData(){

        $.ajax({
            url:"/Employment/excel/queryAllInformation.do",
            type:"get",
            dataType:"json",
            success:function (data){
                //清楚旧数据
                $("#info").html("");
                $("#thead").html("");
                //增加新数据
                $("#thead").append("<tr>")
                    .append("<td>编号</td>")
                    .append("<td>姓名</td>")
                    .append("<td>年龄</td>")
                    .append("<td>基本工资</td>")
                    .append("<td>工作年限</td>")
                    .append("<td>出勤天数</td>")
                    .append("<td>出勤率</td>")
                    .append("<td>津贴</td>")
                    .append("<td>总工资</td>")
                    .append("</tr>")
                $.each(data,function (i,n){

                    $("#info").append("<tr>")
                        .append("<td>"+n.id+"</td>")
                        .append("<td>"+n.name+"</td>")
                        .append("<td>"+n.age+"</td>")
                        .append("<td>"+n.basesalary+"</td>")
                        .append("<td>"+n.workyear+"</td>")
                        .append("<td>"+n.attend_day+"</td>")
                        .append("<td>"+n.attend_rate+"</td>")
                        .append("<td>"+n.allowance+"</td>")
                        .append("<td>"+n.salary+"</td>")
                        .append("</tr>")
                })
            }
        })

    }
</script>
<body class="bg-primary" background="${pageContext.request.contextPath}/img/bg.jpeg">
<div class="container-fluid" style="height: 100px;"></div>
<div class="col-lg-6 col-lg-offset-3 bg-info " style="border-radius: 15px ;height: 500px;overflow-y:scroll;max-height: 470px">
    <div class="container-fluid text-primary text-center modal-title"><h3>汇总信息</h3></div>
    <table class="table table-striped text-info text-center" >
        <thead id="thead"></thead>
        <tbody id="info"></tbody>
    </table>
</div>
<div class="col-lg-pull-3">
    <form action="<%=basePath%>excel/upload.do" method="post" enctype="multipart/form-data" >
        选择要上传的文件:<input type="file" name="file">
        <input type="submit" class="btn btn-info"  value="上传"></br>
    </form>
</div>
<div class="col-lg-6 col-lg-offset-3">
<%--<input class="center" type="button" id="exportEmployeeInfo"  value="导出excel">--%>
    <input type="button" id="exportEmployeeInfo" class="btn btn btn-success btn-lg btn-block" value="导出为excel文件"></input>
</div>


<%--<input type="text"  id="message" value="${message}" hidden></input>--%>
<%--<form action="${pageContext.request.contextPath }/file/load.do"
      method="post" enctype="multipart/form-data">
    选择文件:<input type="file" name="file" width="120px"> <input
        type="submit" value="上传">
</form>

<script type="text/javascript">
    &lt;%&ndash;$("#ssUrl").attr('href',"${pageContext.request.contextPath}/file/download.do?filename="+fileName)&ndash;%&gt;
</script>
<table>
    <tr>
        <td><input type="file" src="F:\fileResource\1.jpg">附件</td>
        <td><a href="" id="ssUrl" class="easyui-linkbutton">下载</a>
        </td>
    </tr>

</table>--%>
</body>
</html>
