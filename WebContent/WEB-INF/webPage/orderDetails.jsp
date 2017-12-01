<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>orderDetails</title>
<link rel="stylesheet" href="/shopping/css/reset.css" />
<link rel="stylesheet" href="/shopping/css/content.css" />
<link href="/shopping/css/style.css" rel="stylesheet" type="text/css" media="all" />
<link href="/shopping/css/slider.css" rel="stylesheet" type="text/css" media="all" />
</head>
<body marginwidth="0" marginheight="0">
<div class="container">
<div class="public-content">
        <div class="public-content-header">
            <h3 style="display: inline-block;">订单详情</h3>
            <div class="public-content-right fr">
            </div>
        </div>
        <div class="clearfix"></div>
	<div class="public-content-cont two-col">
		<table class="public-cont-table col-2" style="width:100%;">
			<tr style="height: 49px; width: 986px;">
				<td>订单号:</td><td>${orderDetails.order.orderId}</td>
			</tr>
			<br/>
			<tr>
				<td>支付方式:</td><td>${orderDetails.order.paymentMethod}</td>
			</tr>
			<tr>
				<td>下单时间:</td><td>${orderDetails.order.orderTime}</td>
			</tr>
			<tr>
				<td>用户编号:</td><td>${orderDetails.order.userId}</td>
			</tr>
			<tr>
				<td>支付金额:</td><td>${orderDetails.order.paymentAmount }</td>
			</tr>
			<tr>
				<td>订单状态:</td><td>${orderDetails.order.orderStatus }</td>
			</tr>
			<tr>
				<td>支付时间:</td><td>${orderDetails.order.paymentTime }</td>
			</tr>
			<tr>
				<td>运费:</td><td>${orderDetails.order.freight }</td>
			</tr>
			<tr>
				<td>收货人:</td><td>${orderDetails.order.receiver }</td>
			</tr>
			<tr>
				<td>手机号码:</td><td>${orderDetails.order.user_phone }</td>
			</tr>
			<tr>
				<td>收货地址:</td><td>${orderDetails.order.user_address }</td>
			</tr>
			</table>
			<br><br>
			<table class="public-cont-table col-2" style="width:100%">
			<tr>
				<th>商品</th>
				<th>单价</th>
				<th>数量</th>
				<th>小计</th>
			</tr>
			<c:forEach items="${orderProducts}" var="ops">
				<tr style="height: 49px; width: 986px;">
					<td>
						<div class="img-list">
							<a class="img-box" target="_blank" href="javaScript:void(0)"> <img
								class="err-product" width="50" height="50" title=""
								src="/shopping/${ops.imagePath }">
							</a> <span>${ops.productName }</span>
						</div>
					</td>
					<td>${ops.price }</td>
					<td>${ops.productNum }</td>
					<td><label>¥</label>${ops.price*ops.productNum }</td>
				</tr>
			</c:forEach>
			</table>
		</table>
	</div>
	</div>
	</div>
</body>
</html>