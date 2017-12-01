<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Home</title>
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/slider.css" rel="stylesheet" type="text/css" media="all" />
<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
<script type="text/javascript">
function ajax01(productID) {
	var id = productID;
	//id = id.substring(1);
	var deleteOrderItemid = id;
	$.ajax({
		type : "post",
		url : "CartDeleteProductServlet.html",
		data : {
			id : id
		},
		async : true,
		success : function(result) {
			if ("true" == result) {
				$("tr.cartItem[id=" + deleteCartItemid + "]").hide();
			} else {
				alert("删除失败！");
			}
		}
	});
}

	$(function() {
		$(".cartItemSelected").click(function() {
			var selectit = $(this).attr("selectit")
			if ("selectit" == selectit) {
				$(this).attr("selectit", "false");
			} else {
				$(this).attr("selectit", "selectit");
			}
			syncSelect();
			syncCreateOrderButton();
			calcCartSumPriceAndNumber();
		});

		$(".selectAllItem").click(function() {
			var selectit = $(this).attr("selectit")
			if ("selectit" == selectit) {
				$(".selectAllItem").attr("selectit", "false")
				$(".cartItemSelected").each(function() {
					$(this).attr("selectit", "false");
				});
			} else {
				$(".selectAllItem").attr("selectit", "selectit")
				$(".cartItemSelected").each(function() {
					$(this).attr("selectit", "selectit");
				});
			}
			syncCreateOrderButton();
			calcCartSumPriceAndNumber();
		});

		$(".numberPlus").click(
				function() {
					var pid = $(this).attr("id");
					var id = pid.substring(1);
					var price = $("span.productPrice[id=" + "a" + id + "]")
							.text();
					var num = parseInt($(
							".cartItemProductNum[id=" + "c" + id + "]").val());
					num++;
					syncPrice(id, num, price);
				});

		$(".numberMinus").click(function() {
			var pid = $(this).attr("id");
			var id = pid.substring(1);
			var price = $("span.productPrice[id=" + "a" + id + "]").text();
			var num = $(".cartItemProductNum[id=" + "c" + id + "]").val();
			--num;
			if (num <= 0)
				num = 1;
			syncPrice(id, num, price);
		});

		$("a.jz2").on("click", function() {
			var params = "";
			$(".cartItemSelected").each(function() {
				if ("selectit" == $(this).attr("selectit")) {
					var oiid = $(this).attr("id");
					var id = oiid.substring(1);
					params += "abcde" + id;
				}
			});
			location.href = "order.html?params=" + params;
		});
	});

	function syncCreateOrderButton() {
		var selectAny = false;
		$(".cartItemSelected").each(function() {
			if ("selectit" == $(this).attr("selectit")) {
				selectAny = true;
			}
		});
		if (selectAny) {
			$("button.createOrderButton").css("background-color", "#C40000");
			$("button.createOrderButton").removeAttr("disabled");
		} else {
			$("button.createOrderButton").css("background-color", "#AAAAAA");
			$("button.createOrderButton").attr("disabled", "disabled");
		}
	}

	function syncSelect() {
		var selectAll = true;
		$(".cartItemSelected").each(function() {
			if ("false" == $(this).attr("selectit")) {
				selectAll = false;
			}
		});
		if (selectAll)
			$(".selectAllItem").attr("selectit", "true");
		else
			$(".selectAllItem").attr("selectit", "false");
	}

	function calcCartSumPriceAndNumber() {
		var sum = 0;
		var totalNumber = 0;
		$(".cartItemSelected[selectit='selectit']").each(
				function() {
					var id = "";
					id = $(this).attr("id");
					id = id.substring(1);
					var price = $(
							".cartProductItemSmallSumPrice[id=" + "e" + id
									+ "]").text();
					price = price.substring(1);
					sum += new Number(price);
					var num = $(".cartItemProductNum[id=" + "c" + id + "]")
							.val();
					totalNumber += new Number(num);
				});
		$("span.cartSumPrice").html(sum); //设置已选商品总价
		$("label.cartSumNumber").html(totalNumber); //设置已选商品数量
	}

	function syncPrice(id, num, price) {
		$(".cartItemProductNum[id=" + "c" + id + "]").val(num); //设置单个商品数量
		var cartProductItemSmallSumPrice = num * price; //设置某个商品小计
		$(".cartProductItemSmallSumPrice[id=" + "e" + id + "]").html(
				"￥" + cartProductItemSmallSumPrice);
		calcCartSumPriceAndNumber();
		$.ajax({
			type : "post",
			url : "UpdateCartServlet.html",
			data : {
				productId : id,
				number : num
			},
			async : true
		});

	}
</script>
</head>
<body>
	<div class="wrap">
		<div style="margin: auto">
			<jsp:include page="top.jsp"></jsp:include>
		</div>
		<div class="header">
			<div class="header_top">
				<div class="account_desc">
					<img src="images/cart1.gif" width="550" height="46">
				</div>
				<div class="clear"></div>
			</div>
		</div>
		<div class="main">
			<div class="cartpage">

				<div class="cart-list">
					<div class="title-items">
						<h2>购物车</h2>
						<div class="r">
							<span class="excel-export"> <a id="export"
								href="index.html">返回购物<i class="icons"></i></a></span>
						</div>
						<b class="line" data-line="一条横线"></b>
					</div>
					<div class="model-box">
						<div id="tradeTable" class="trade-table">
							<table id="tradeRecordTable">
								<tbody>
									<tr>
										<th><input class="selectAllItem" name="" type="checkbox"
											value="">全选</th>
										<th>商品</th>
										<th>规格</th>
										<th>单价</th>
										<th>数量</th>
										<th>小计</th>
										<th>操作</th>
									</tr>
									<c:forEach items="${sessionScope.cartPages }" var="cart">
										<tr class="cartItem" id="${cart.productId }">
											<td><input class="cartItemSelected" name=""
												id="g${cart.productId }" type="checkbox" value=""></td>
											<td>
												<div class="img-list">
													<a class="img-box" target="_blank"
														href="preview.html?id=${cart.productId }"> <img
														class="err-product" width="50" height="50" title=""
														src="${cart.imagePath }">
													</a>
												</div>
											</td>
											<td>规格</td>
											<td><span class="productPrice" id="a${cart.productId }">${cart.price}</span></td>
											<td><input id="b${cart.productId }" name=""
												class="numberMinus"
												style="width: 20px; height: 18px; border: 1px solid #ccc;"
												type="button" value="-" /> <input id="c${cart.productId }"
												name="" class="cartItemProductNum" type="text"
												value="${cart.productNum }"
												style="width: 30px; text-align: center; border: 1px solid #ccc;" />
												<input id="d${cart.productId }" name="" class="numberPlus"
												style="width: 20px; height: 18px; border: 1px solid #ccc;"
												type="button" value="+" /></td>
											<td><span class="cartProductItemSmallSumPrice"
												id="e${cart.productId }"> <label>¥</label>${cart.price* cart.productNum}</span>
											</td>
											<td><button class="deleteCartItem"
												id="f${cart.productId }" onclick="ajax01(${cart.productId})">删除</button></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
					<table cellpadding="0" cellspacing="0" class="gwc_tb3">
						<tr>
							<td class="tb1_td1"><input id="checkAll"
								class="selectAllItem" type="checkbox" /> 全选</td>
							<td class="tb3_td2">已选商品 <label id="shuliang"
								class="cartSumNumber"
								style="color: #ff5500; font-size: 14px; font-weight: bold;">0</label>
								件
							</td>
							<td class="tb3_td3">合计(不含运费): <span>￥</span> <span
								class="cartSumPrice"
								style="color: #ff5500; font-size: 14px; font-weight: bold;">
									0 </span>
							</td>
							<td class="tb3_td4"><a class="jz2" id="jz2">结算</a></td>
						</tr>
					</table>
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