<%--
  Created by Eclipse.
  User: Ross
  Date: 2017年10月21日
  Time: 上午9:36:42
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>登录</title>
    <link rel="stylesheet" href="/shopping/css/login.css" ,type="text/css">
</head>

<body class="bgimg">
    <div id="content">
    	<form action="login.html" method="post">
        <div class="logoNloginText" style="text-align:center;">
            <a href="../index.html"><img src="/shopping/images/logo/logoMiddle.png" alt="logo"></a>
        </div>
        <div class="centerText">
            <input class="textStyle" type="text" name="loginname" id="loginname" placeholder="用户名">
        </div>
        <div class="centerText">
            <input class="textStyle" type="password" name="loginpwd" id="loginpwd" placeholder="密码">
        </div>
        <div class="centerText">
            <input type="submit" value="登录" class="btn">
        </div>
        </form>
    </div>
</body>

</html>