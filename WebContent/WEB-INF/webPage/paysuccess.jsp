<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<title>Home</title>
</head>
<body>
	<div class="wrap">
		<div class="header">
			<div class="header_top">
				<div class="logo">
					<a href="index.html"><img src="images/logo.png" alt="" /></a>
				</div>
				<div class="account_desc">
					<img src="images/cart4.gif" width="550" height="46">
				</div>
				<div class="clear"></div>
			</div>
		</div>
		<div class="main">
			<div class="order">
				<div class="order-menu nobg">
					<div class="success">
						<h4>付款成功！</h4>
						<a href="index.html" class="fh">返回主页继续购物</a>
						<div class="clear"></div>
					</div>
					<!----cartNotice--->
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