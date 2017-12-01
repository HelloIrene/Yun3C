<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Home</title>
</head>
<body>
	<div class="wrap">
		<div class="header">
			<div class="header_top">
				<div class="logo">
					<a href="index.html"> <img src="images/logo.png" alt="" />
					</a>
				</div>
				<div class="account_desc">
					<img src="images/cart3.gif" width="550" height="46">
				</div>
				<div class="clear"></div>
			</div>
		</div>
		<div class="main">
			<div class="order">
				<div class="order-menu nobg">
					<div class="success">
						<h4>还差最后一步，请尽快付款！</h4>
						<div class="spvm">
							请在<span class="imMessage">2</span>小时内完成付款，超时未付款订单将被取消。
						</div>
					</div>
					<!----cartNotice--->
					<div class="cartNotice">
						<div class="ddxx">
							<span>收货信息：<span>${sessionScope.orderPage.receiver }</span>${sessionScope.orderPage.user_address }</span><br>
							<span>支付配送：<label>${sessionScope.orderPage.order.paymentMethod }</label>
							</span>- 普通快递<br> <span>应付金额：</span> <span class="red f20">${sessionScope.tempSum }</span>元<br>
							<span>您还可以：</span> <a class="red" target="_blank"
								href="order.html">查看订单>></a> <a class="red" target="_blank"
								href="person_center.html">个人中心>></a> <br>
						</div>
						<div class="checkPay">
							<span id="paywayimg" style="display: block;"> <span>您已选择</span>
								<span> ${sessionScope.orderPage.order.paymentMethod }</span>
							</span> <a id="checkPay" class="gotoSettlement" style="float: left;"
								target="_blank" href="paysuccess.html">立即付款</a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="clear"></div>
		<div class="footer">
			<div style="margin: auto">
				<jsp:include page="bottom.jsp"></jsp:include>
			</div>
		</div>
	</div>
</body>
</html>