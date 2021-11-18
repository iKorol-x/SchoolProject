<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="zh-CN">
<head>
    <%
        //动态获取基路径
        String basePath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";
    %>
    <base id="path" href="<%=basePath%>" />
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>职工薪资管理系统</title>

    <link rel="stylesheet" href="/Employment/bootstrap/css/bootstrap.min.css">
    <style type="text/css">
        a{
            text-decoration: none;
            display: block;
            width: 100%;
            height: 100%;
            color: #000000;
        }
        a:hover{
            text-decoration: none;
            display: block;
            width: 100%;
            height: 100%;
            color: #000000;
            cursor: pointer;
        }
        a:focus{
            text-decoration: none;
            display: block;
            width: 100%;
            height: 100%;
            color: #000000;
        }

    </style>

</head>
<body background="${pageContext.request.contextPath}/img/bg.jpeg">
<div class="container-fluid">
    <div class="row">
        <div class="col-lg-2" style="height: 800px;background-color: #1C232F;">
            <div class="row">
                <div class="text-center" style="height: 50px;line-height: 50px;">
                    <a href="employee/indexskip.do" style="text-decoration: none;color: white;display: block;">职工薪资管理系统</a></div>
            </div>
            <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">

                <div class="panel panel-default">
                    <div class="panel-heading" role="tab" id="headingOne">
                        <h4 class="panel-title text-center">
                            <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                                职工管理
                            </a>
                        </h4>
                    </div>
                    <div id="collapseOne" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingOne">
                        <ul class="list-group text-center">
                            <li class="list-group-item"><a onclick="loadEmployeeData()" id="employeeInfo">职工信息</a></li>
                            <li class="list-group-item"><a href="#findEm" data-toggle="modal">查找信息</a></li>
                            <li class="list-group-item"><a href="/Employment/skip/addEmployee.do">添加信息</a></li>
                            <li class="list-group-item"><a href="#delEmployeeA" data-toggle="modal">删除信息</a></li>
                            <li class="list-group-item"><a a href="/Employment/skip/updateEmployee.do">修改信息</a></li>
                        </ul>
                    </div>
                </div>

<script type="text/javascript">

    function loadEmployeeData(){
        var title=$("#employeeInfo").html();
        $.ajax({
            url:"/Employment/employee/querryEmployee.do",
            type:"get",
            dataType:"json",
            success:function (data){
                //清楚旧数据
                $("#info").html("");
                $("#thead").html("");
                //增加新数据
                $("#tabletitle").text(title);
                $("#thead").append("<tr>")
                    .append("<td>编号</td>")
                    .append("<td>姓名</td>")
                    .append("<td>年龄</td>")
                    .append("<td>基本工资</td>")
                    .append("<td>工作年限</td>")
                    .append("</tr>")
                $.each(data,function (i,n){
                    $("#info").append("<tr>")
                        .append("<td>"+n.id+"</td>")
                        .append("<td>"+n.name+"</td>")
                        .append("<td>"+n.age+"</td>")
                        .append("<td>"+n.basesalary+"</td>")
                        .append("<td>"+n.workyear+"</td>")
                        .append("</tr>")
                })
            }
        })
    }
    function findEmployeeData(){
        var id = $("#employee").val();
        $.ajax({
            url:"employee/findEmployee.do"+"?id="+id,
            type:"get",
            dataType:"json",
            success:function (data){
                //清楚旧数据
                $("#info").html("");
                //增加新数据
                $.each(data,function (i,n){
                    $("#info").append("<tr>")
                        .append("<td>"+n.id+"</td>")
                        .append("<td>"+n.name+"</td>")
                        .append("<td>"+n.age+"</td>")
                        .append("<td>"+n.basesalary+"</td>")
                        .append("<td>"+n.workyear+"</td>")
                        .append("</tr>")
                })
            }
        })
    }
    function delEmployee(){
        var name = $("#delEmployeeB").val();
        $.ajax({
            url:"employee/delEmployee.do"+"?name="+name,
            type:"get",
        })
    }

</script>
<div class="modal fade" id="findEm" tabindex="-1" role="dialog" aria-labelledby="findEmlabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="findEmlabel">查找职工信息</h4>
            </div>
            <div class="modal-body">
                请输入要查职工用户编号：<input type="text" name="userId" id="employee" placeholder="输入职工id">
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="findEmployee">查找</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>

<div class="modal fade" id="delEmployeeA" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="delEmployees">删除职工信息</h4>
            </div>
            <div class="modal-body">
                请输入要删除的职工姓名：<input type="text" name="userId" id="delEmployeeB" placeholder="employeeName">
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="delEmployee" >删除</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>




            <div class="panel panel-default" style="margin-top: 5px">
                <div class="panel-heading" role="tab" id="headingTwo">
                    <h4 class="panel-title text-center">
                        <a class="collapsed" id="Stitle" style="display: block;" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                            薪资管理
                        </a>
                    </h4>
                </div>
                <div id="collapseTwo" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingTwo">
                    <ul class="list-group text-center">
                        <li class="list-group-item"><a onclick="loadSalaryData()" id="salaryInfo">薪资信息</a></li>
                        <li class="list-group-item"><a href="#findSa" data-toggle="modal">查找信息</a></li>
<%--                        <li class="list-group-item">修改信息</li>--%>
                    </ul>
                </div>
            <script type="text/javascript">
                function loadSalaryData(){
                    var title=$("#salaryInfo").html();
                    $.ajax({
                        url:"salary/querySalary.do",
                        type:"get",
                        dataType:"json",
                        success:function (data){
                            //清楚旧数据
                            $("#info").html("");
                            $("#thead").html("");
                            $("#tabletitle").text(title);
                            //增加新数据
                            $("#thead").append("<tr>")
                                .append("<td>编号</td>")
                                .append("<td>姓名</td>")
                                .append("<td>津贴</td>")
                                .append("<td>总工资</td>")
                                .append("</tr>")
                            $.each(data,function (i,n){

                                $("#info").append("<tr>")
                                    .append("<td>"+n.id+"</td>")
                                    .append("<td>"+n.name+"</td>")
                                    .append("<td>"+n.allowance+"</td>")
                                    .append("<td>"+n.salary+"</td>")
                                    .append("</tr>")
                            })
                        }
                    })
                }
                function findSalaryData(){
                    var id = $("#salary").val();
                    $.ajax({

                        url:"salary/findSalary.do"+"?id="+id,
                        type:"get",
                        dataType:"json",
                        success:function (data){
                            //清楚旧数据
                            $("#info").html("");
                            //增加新数据
                            $.each(data,function (i,n){
                                $("#info").append("<tr>")
                                    .append("<td>"+n.id+"</td>")
                                    .append("<td>"+n.name+"</td>")
                                    .append("<td>"+n.allowance+"</td>")
                                    .append("<td>"+n.salary+"</td>")
                                    .append("</tr>")
                            })
                        }
                    })
                }
            </script>
                <div class="modal fade" id="findSa" tabindex="-1" role="dialog" aria-labelledby="findEmlabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                <h4 class="modal-title" id="findSalabel">查找职工薪资信息</h4>
                            </div>
                            <div class="modal-body">
                                请输入要查职工用户编号：<input type="text" name="userId" id="salary" placeholder="输入职工id">
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                                <button type="button" class="btn btn-primary" id="findSalary">查找</button>
                            </div>
                        </div><!-- /.modal-content -->
                    </div><!-- /.modal -->
                </div>




                </div>
                <div class="panel panel-default">
                    <div class="panel-heading" role="tab" id="headingThree">
                        <h4 class="panel-title text-center">
                            <a class="collapsed" id="Dtitle" style="display: block;" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                                考勤管理
                            </a>
                        </h4>
                    </div>
                    <div id="collapseThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
                        <ul class="list-group text-center">
                            <li class="list-group-item"><a onclick="loadDutyData()" id="DutyInfo">考勤信息</a></li>
                            <li class="list-group-item"><a href="#findDuties" data-toggle="modal">查找信息</a></li>
                            <li class="list-group-item"><a href="#updateDutyA" data-toggle="modal">修改信息</a></li>
                        </ul>
                    </div>
                </div>
        <script type="text/javascript">
            function loadDutyData(){
                var title=$("#Dtitle").html();
                $.ajax({
                    url:"duty/queryDuties.do",
                    type:"get",
                    dataType:"json",
                    success:function (data){
                        //清楚旧数据
                        $("#info").html("");
                        $("#thead").html("");
                        $("#tabletitle").text(title);
                        //增加新数据
                        $("#thead").append("<tr>")
                            .append("<td>编号</td>")
                            .append("<td>姓名</td>")
                            .append("<td>出勤天数</td>")
                            .append("<td>出勤率</td>")
                            .append("</tr>")
                        $.each(data,function (i,n){
                            $("#info").append("<tr>")
                                .append("<td>"+n.id+"</td>")
                                .append("<td>"+n.name+"</td>")
                                .append("<td>"+n.attend_day+"</td>")
                                .append("<td>"+n.attend_rate+"</td>")
                                .append("</tr>")
                        })
                    }
                })
            }
            function findDutyData(){
                var name = $("#duty").val();
                $.ajax({

                    url:"duty/findDuties.do"+"?name="+name,
                    type:"get",
                    dataType:"json",
                    success:function (data){
                        //清楚旧数据
                        $("#info").html("");
                        //增加新数据
                        $.each(data,function (i,n){
                            $("#info").append("<tr>")
                                .append("<td>"+n.id+"</td>")
                                .append("<td>"+n.name+"</td>")
                                .append("<td>"+n.attend_day+"</td>")
                                .append("<td>"+n.attend_rate+"</td>")
                                .append("</tr>");
                        })
                    }
                })
            }
            function updateDutyData(){
                var name =$("#updateDutyBname").val()
                var day = $("#updateDutyBday").val();
                $.ajax({
                    url:"duty/updateDuties.do"+"?name="+name+"&day="+day,
                    type:"get",
                })
            }
        </script>
                <div class="modal fade" id="findDuties" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                <h4 class="modal-title" id="findDutylabel">查找职工考勤信息</h4>
                            </div>
                            <div class="modal-body">
                                请输入要查找职工姓名：<input type="text" name="dutyname" id="duty" placeholder="输入职工姓名">
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                                <button type="button" class="btn btn-primary" id="findDuty">查找</button>
                            </div>
                        </div><!-- /.modal-content -->
                    </div><!-- /.modal -->
                </div>
                <div class="modal fade" id="updateDutyA" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                <h4 class="modal-title" id="updateDuties">修改职工考勤信息</h4>
                            </div>
                            <div class="modal-body">
                                请输入要修改的职工姓名：<input type="text" name="userId" id="updateDutyBname" placeholder="输入职工姓名">
                            </div>
                            <div class="modal-body">
                                请输入要修改的职工考勤天数：<input type="text" name="userId" id="updateDutyBday" placeholder="输入考勤天数">
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                                <button type="button" class="btn btn-primary" id="updateDuty" >确定</button>
                            </div>
                        </div><!-- /.modal-content -->
                    </div><!-- /.modal -->
                </div>






                <div class="panel panel-default " style=" margin-top: 5px">
                    <div class="panel-heading" role="tab" id="headingFour">
                        <h4 class="panel-title text-center">
                            <a class="collapsed" id="Utitle" style="display: block;" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
                                用户管理
                            </a>
                        </h4>
                    </div>
                    <div id="collapseFour" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingFour">
                        <ul class="list-group text-center">
                            <li class="list-group-item"><a onclick="loadUserData()" id="userInfo">用户信息</a></li>
                            <li class="list-group-item"><a href="#myModal" data-toggle="modal">查找用户</a></li>
                            <li class="list-group-item"><a href="/Employment/skip/addUser.do"> 添加用户</a></li>
                            <li class="list-group-item"><a href="/Employment/skip/updateUser.do" target="_self">修改用户</a></li>
                            <li class="list-group-item"><a href="#delUserA" data-toggle="modal"> 删除用户</a></li>
                        </ul>
                    </div>
                </div>


            </div><a href="skip/totalInfo.do" class="btn btn-primary btn-lg active" role="button" style="height: 50px">获取汇总信息</a>
            <a href="skip/totalInfo.do" class="btn btn-primary btn-lg active" role="button" style="height: 50px">上传信息</a>
        </div>
        <div class="col-lg-10" style=" height: 800px;">
        <div class="col-lg-12" style="height: 100px;"></div>

            <div class="col-lg-6 col-lg-offset-3" style="background: white;border-radius: 15px;height: 400px;">
                <h3 align="center" id="tabletitle">用户信息</h3>
                <div class="col-lg-10 col-lg-offset-1 pre-scrollable">
                <table class="table table-striped text-center" style="">
                <thead id="thead">

                </thead>
                <tbody id="info">

                </tbody>
            </table>
                </div>
            </div>
        </div>

    </div>
</div>

<script src="/Employment/JQuery/JQuery.js"></script>
<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
<script src="/Employment/bootstrap/js/bootstrap.min.js"></script>
<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
<script type="text/javascript">
    $(function (){
        loadEmployeeData();
        $("#findUser").click(function (){
            findUserData();
        })
        $("#delUser").click(function (){
            loadUserData();
            delUser();
            loadUserData();
            refresh();
        })
        $("#findEmployee").click(function (){


            findEmployeeData();


        })
        $("#delEmployee").click(function (){
            loadEmployeeData();
            delEmployee();refresh();
            loadEmployeeData();
        })
        $("#findSalary").click(function (){
            findSalaryData();
        })
        $("#findDuty").click(function (){
            findDutyData();
        })
        $("#updateDuty").click(function (){
            // loadDutyData();
            updateDutyData();
            refresh();
            loadDutyData();
        })



    })
    function refresh(){
        parent.location.reload();
    }
    function loadUserData(){
        var title=$("#userInfo").html();
        $.ajax({
            url:"user/queryUsers.do",
            type:"get",
            dataType:"json",
            success:function (data){
                //清楚旧数据
                $("#info").html("");
                $("#thead").html("");
                $("#tabletitle").text(title);
                //增加新数据
                $("#thead").append("<tr>")
                    .append("<td>编号</td>")
                    .append("<td>用户名</td>")
                    .append("<td>密码</td>")
                    .append("<td>权限</td>")
                    .append("</tr>")
                $.each(data,function (i,n){

                    $("#info").append("<tr>")
                        .append("<td>"+n.id+"</td>")
                        .append("<td>"+n.username+"</td>")
                        .append("<td>"+n.password+"</td>")
                        .append("<td>"+n.priority+"</td>")
                        .append("</tr>")
                })
            }
        })

    }

    function findUserData(){
        var userId = $("#user").val();
        $.ajax({

            url:"user/findUser.do"+"?userId="+userId,
            type:"get",
            dataType:"json",
            success:function (data){
                //清楚旧数据
                $("#info").html("");
                //增加新数据
                $.each(data,function (i,n){
                    $("#info").append("<tr>")
                        .append("<td>"+n.id+"</td>")
                        .append("<td>"+n.username+"</td>")
                        .append("<td>"+n.password+"</td>")
                        .append("<td>"+n.priority+"</td>")
                        .append("</tr>");
                })
            }
        })
    }
    function delUser(){
        var id = $("#deluserB").val();
        $.ajax({
            url:"user/deleteUser.do"+"?id="+id,
            type:"get",
        })
    }

</script>
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">查找用户</h4>
            </div>
            <div class="modal-body">
                请输入要查找的用户编号：<input type="text" name="userId" id="user" placeholder="输入用户id">
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="findUser">查找</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
<div class="modal fade" id="delUserA" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="delUsers">删除用户</h4>
            </div>
            <div class="modal-body">
                请输入要删除的用户编号：<input type="text" name="userId" id="deluserB" placeholder="输入用户id">
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="delUser" >删除</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
</body>
</html>