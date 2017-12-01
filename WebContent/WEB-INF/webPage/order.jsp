<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<title>Home</title>
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/slider.css" rel="stylesheet" type="text/css" media="all" />
<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
<script>
	$(function() {
		$("#butt1").click(function() {
			$.ajax({
				type : "post",
				url : "AddUserAddressServlet",
				data : {
					receiver : $("#ship_name").val(),
					user_address : $("#ship_address_detail").val(),
					user_phone : $("#ship_phone").val()
				},
				async : true
			});
		});

		$("#butt2").click(function() {
			$.ajax({
				type : "post",
				url : "AddPaymethodServlet",
				data : {
					paymethod : $("input[name='payway']:checked").val(),
					freight : 10
				},
				async : true
			});
		});

	});
</script>
</head>
<body>
	<div class="wrap">
		<div style="margin: auto">
			<jsp:include page="top.jsp"></jsp:include>
		</div>
		<div class="header">
			<div class="header_top">
				<div class="logo">
					<a href="index.html"><img src="images/logo.png" alt="" /></a>
				</div>
				<div class="account_desc">
					<img src="images/cart2.gif" width="550" height="46">
				</div>
				<div class="clear"></div>
			</div>
		</div>
		<div class="main">
			<div class="order">
				<div class="order-menu">
					<div class="title-items">
						<h2>填写并核对信息</h2>
						<div class="r">
							<span class="excel-export"> <a id="export"
								href="index.html">返回购物<i class="icons"></i></a></span>
						</div>
						<b class="line" data-line="一条横线"></b>
					</div>
					<!----step1--->
					<div class="step-1">
						<h2>收货人信息</h2>
						<form>
							<table class="tab1" cellspacing="0" cellpadding="0" border="0"
								width="100%">
								<tbody>
									<tr id="new_name">
										<td align="right" width="10%" class="user_receiver"><span
											class="pink">*</span>收货人：</td>
										<td width="90%"><input id="ship_name" class="inp w138"
											type="text" onblur="check_shipping('name')"> <span
											id="new_name_error"></span></td>
									</tr>
									<tr>
										<td align="right"><span class="pink">*</span> 详细地址：</td>
										<td><span id="address_prefix"></span> <input
											id="ship_address_detail" class="inp w308" type="text"
											onblur="check_shipping('address')"> <span
											id="new_address_error"></span></td>
									</tr>
									<tr>
										<td align="right"><span class="pink">*</span>手机号码：</td>
										<td><input id="ship_phone" class="inp w138" type="text"
											onblur="check_shipping('phone')"> <span
											id="new_mobile_error"></span> <span id="new_phone_error"></span>
										</td>
									</tr>
								</tbody>
							</table>

						</form>
					</div>
					<!----step2--->
					<div class="step-2">
						<h2>支付及配送方式</h2>
						<div class="in">
							<div class="payment">
								<strong>支付方式</strong>
								<div class="oldintro">
									<input id="gashondelivery"
										class="paymethod" type="radio" checked="" value="online"
										name="payway"> <label for="gashondelivery">
										货到付款</label>
								</div>
								<strong>配送方式</strong>
								<div>
									<div class="oldintro">
										<input id="ship_common" type="radio" checked="" value="common"
											name="shipping"> <label for="ship_common">
											普通快递</label> <span class="shipping_info"> 运费金额： <span
											class="shipping_fee">10</span> 元
										</span>
									</div>
								</div>

							</div>
						</div>
					</div>
					<!----step3--->
					<div class="step-3">
						<h2>商品清单</h2>
						<div class="clear"></div>
						<div id="tradeTable" class="trade-table">
							<table id="tradeRecordTable">
								<tbody>
									<tr>
										<th>商品</th>
										<th>规格</th>
										<th>单价</th>
										<th>数量</th>
										<th>小计</th>
									</tr>
									<c:forEach items="${sessionScope.orderCartItems }"
										var="orderCart">
										<tr>
											<td>
												<div class="img-list">
													<a class="img-box" target="_blank" href="#"> <img
														class="err-product" width="50" height="50" title=""
														src="${orderCart.imagePath }">
													</a> <span>${orderCart.productName }</span>
												</div>
											</td>
											<td>规格</td>
											<td>${orderCart.price }</td>
											<td>${orderCart.productNum }</td>
											<td><label>¥</label>${orderCart.price*orderCart.productNum }</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
						<div class="">
							<div class="totlePay">
								<span>应付总额:</span><span class="red" style="font-size: 25px;">¥<span
									style="font-size: 25px;"> ${sessionScope.tempSum }</span></span>
							</div>
						</div>
					</div>
					<!----step4----->
					<div class="step-4">
						<a href="pay.html" class="gotoSettlement">提交订单</a> <a
							href="cart.html" class="ContinueToBuy">返回购物车</a>
						<div class="clear"></div>
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