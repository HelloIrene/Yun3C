<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>order</title>
<link rel="stylesheet" href="/shopping/css/reset.css" />
<link rel="stylesheet" href="/shopping/css/content.css" />
 <link rel="stylesheet" href="/shopping/dashboard/css/AdminLTE.min.css">
</head>
<body marginwidth="0" marginheight="0">
<div class="container">
    <div class="public-content">
        <div class="public-content-header">
            <h3 style="display: inline-block;">订单列表</h3>
            <div class="public-content-right fr">
            </div>
        </div>
        <div class="clearfix"></div>
	<div class="public-content-cont two-col">
		<table class="public-cont-table col-2" style="width: 100%;">
			<tr >
				<th style="width:15%">订单号</th>
				<th style="width:10%">支付方式</th>
				<th style="width:15%">下单时间</th>
				<th style="width:10%">用户编号</th>
				<th style="width:10%">订单状态</th>
				<th style="width:10%">支付金额</th>
				<th style="width:15%">支付时间</th>
				<th style="width:10%">编辑</th>
			</tr>

			<c:forEach items="${orders}" var="orders">
				<tr style="height: 49px; width: 986px;">
					<td>${orders.orderId}</td>
					<td>${orders.paymentMethod}</td>
					<td>${orders.orderTime}</td>
					<td>${orders.userId}</td>
					<td>${orders.orderStatus }</td>
					<td>${orders.paymentAmount }</td>
					<td>${orders.paymentTime }</td>
					<td><a href="orderDetails.html?orderId=${orders.orderId }"><button class="btn btn-primary" style="color:white;height: 30px;width: 60px;">明细</button></a></td>
				</tr>
			</c:forEach>
		</table>
	</div>
	</div>
	</div>
</body>
</html>