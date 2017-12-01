<%--
  Created by Eclipse.
  User: Ross
  Date: 2017年10月23日
  Time: 下午9:55:01
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
            <h3 style="display: inline-block;">首页推荐商品列表</h3>
            <div class="public-content-right fr">
            </div>
        </div>
        <div class="clearfix"></div>
	<div class="public-content-cont two-col">
		<table class="public-cont-table col-2" style="width: 100%;">
			<tr >
				<th style="width:10%">商品号</th>
				<th style="width:10%">商品名</th>
				<th style="width:10%">商品价格</th>
				<th style="width:10%">主推荐语</th>
				<th style="width:10%">副推荐语</th>
				<th style="width:10%">编辑</th>
			</tr>

			<c:forEach items="${requestScope.recommends}" var="product">
				<tr style="height: 49px; width: 986px;">
					<td>${product.productID}</td>
					<td>${product.productName}</td>
					<td>${product.price}</td>
					<td>${product.word}</td>
					<td>${product.fu_word}</td>
					<td><a href="deleteindex?id=${product.productID}&name=${product.productName}"><button class="btn btn-primary" style="color:white;height: 30px;width: 90px;">下架推荐</button></a></td>
				</tr>
			</c:forEach>
		</table>
        <div class="public-content-header">
            <h3 style="display: inline-block;">未首页推荐商品列表</h3>
            <div class="public-content-right fr">
            </div>
        </div>
        <div class="clearfix"></div>
		<table class="public-cont-table col-2" style="width: 100%;">
			<tr >
				<th style="width:10%">商品号</th>
				<th style="width:10%">商品名</th>
				<th style="width:10%">商品价格</th>
				<th style="width:10%">销量</th>
				<th style="width:10%">库存</th>
				<th style="width:10%">编辑</th>
			</tr>

			<c:forEach items="${requestScope.norecommends}" var="product">
				<tr style="height: 49px; width: 986px;">
					<td>${product.productID}</td>
					<td>${product.productName}</td>
					<td>${product.price}</td>
					<td>${product.sales}</td>
					<td>${product.stock}</td>
					<td><a href="updateindex?id=${product.productID}"><button class="btn btn-primary" style="color:white;height: 30px;width: 90px;">上架推荐</button></a></td>
				</tr>
			</c:forEach>
		</table>
	</div>
	</div>
	</div>
</body>
</body>
</html>