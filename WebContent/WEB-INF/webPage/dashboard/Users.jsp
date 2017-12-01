<%--
  Created by Eclipse.
  User: Ross
  Date: 2017年10月23日
  Time: 下午8:33:05
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<meta charset="UTF-8">
    <title></title>
    <link rel="stylesheet" href="/shopping/css/reset.css" />
    <link rel="stylesheet" href="/shopping/css/content.css" />
    <link rel="stylesheet" href="/shopping/dashboard/css/AdminLTE.min.css">
</head>
<body>
	<body marginwidth="0" marginheight="0">
<div class="container">
    <div class="public-content">
        <div class="public-content-header">
            <h3 style="display: inline-block;">用户列表</h3>
            <div class="public-content-right fr">
            </div>
        </div>
        <div class="clearfix"></div>
	<div class="public-content-cont two-col">
		<table class="public-cont-table col-2" style="width: 100%;">
			<tr >
				<th style="width:10%">用户号</th>
				<th style="width:10%">用户名</th>
				<th style="width:10%">邮箱</th>
				<th style="width:10%">电话</th>
				<th style="width:10%">编辑</th>
			</tr>

			<c:forEach items="${requestScope.users}" var="user">
				<tr style="height: 49px; width: 986px;">
					<td>${user.userID}</td>
					<td>${user.loginname}</td>
					<td>${user.email}</td>
					<td>${user.telephone}</td>
					<td><a href="deleteuser?id=${user.userID}"><button class="btn btn-primary" style="color:white;height: 30px;width: 90px;">删除</button></a></td>
				</tr>
			</c:forEach>
		</table>
	</div>
	</div>
	</div>
</body>
</body>
</html>