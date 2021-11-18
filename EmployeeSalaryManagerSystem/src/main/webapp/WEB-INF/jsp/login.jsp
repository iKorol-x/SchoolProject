<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    //动态获取基路径
    String basePath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";
%>
<html lang="lang" dir="ltr">
<head>
    <meta charset="UTF-8">
    <title>Login From</title>
    <base href="<%=basePath%>" />
    <style type="text/css">
        body{
            margin: 0;
            padding: 0;
            background: deepskyblue;
        }
        .login_box{
            width: 300px;
            padding: 40px;
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%,-50%);
            background: black;
            color: white;
            border-radius: 20px;
            text-align: center;
        }
        .input_box{
            border: 0;
            background: none;
            display: block;
            margin: 20px auto;
            text-align: center;
            border: 2px solid #6c5ce7;
            border-radius: 25px;
            padding: 14px;
            outline: none;
            color: white;
        }
        .btn{
            border: 0;
            width: 100px;
            background: none;
            display: block;
            margin: 20px auto;
            text-align: center;
            border: 2px solid #6c5ce7;
            border-radius: 25px;
            padding: 14px;
            color: white;
            cursor: pointer;
        }
        .btn:hover{
            background: #81ecec;
        }
    </style>
</head>
<body>
<form action="<%=basePath%>user/login.do" method="post" class="login_box">
    <h1>Login</h1>
    <input type="text" class="input_box" placeholder="账号" name="userId">
    <input type="password" class="input_box" placeholder="密码" name="userPwd">
    <input type="submit" class="btn" value="登录">
</form>
</body>
</html>