<%--
  Created by Eclipse.
  User: Ross
  Date: 2017年10月13日
  Time: 下午2:54:56
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>顶部</title>
<link href="/shopping/css/style.css" rel="stylesheet" type="text/css" media="all"/>
<script type="text/javascript" src="/shopping/js/jquery-1.7.2.min.js"></script> 
<script type="text/javascript" src="/shopping/js/move-top.js"></script>
<script type="text/javascript" src="/shopping/js/easing.js"></script>
<script src="/shopping/js/easyResponsiveTabs.js" type="text/javascript"></script>
<link href="/shopping/css/easy-responsive-tabs.css" rel="stylesheet" type="text/css" media="all"/>
<link rel="stylesheet" href="css/global.css">
<script src="/shopping/js/slides.min.jquery.js"></script>
<script type="text/javascript">
</script>
<style type="text/css">
#title li{
	width:95px;
	height:50px;
	text-align:center;
}
#hearderer{
height:50px;
}
</style>
</head>
<body>
<!-- 
页面顶部，用户登录检测逻辑待补充
 -->
<div class="header" style="width:1011px;">
		
		<div class="header_top">
			<div class="logo">
				<a href="index.html"><img src="/shopping/images/logo/logoMiddle.png" style="margin-top:10px;" alt="/index.html" /></a>
			</div>
            <div class="account_desc">
				<ul>
					<li><a href="index.html">你好，欢迎来到电子在线商城！</a></li>
					<!--  
					<li><a href="login.html">欢迎登录</a></li>
					<li><a href="reg.html">注册</a></li>
					-->
					<c:choose>
					<c:when test="${empty user }">
					<li><a href="userlogin.html">登录</a></li>
					<li><a href="reg.html">注册</a></li>
					</c:when>
					<c:otherwise>
					<li><a href="message.html">${sessionScope.user.loginname }</a></li>
					<li><a href="logout">注销</a></li>
					</c:otherwise>
					</c:choose>
				
				</ul>
			</div>
			<div class="clear"></div>
			  <div class="cart">
			  	   <p>您的<a href="cart.html" style="color:bule">购物车</a>共有<span> ${num }</span>件商品</p>
			  </div>
			  <script type="text/javascript">
			function DropDown(el) {
				this.dd = el;
				this.initEvents();
			}
			DropDown.prototype = {
				initEvents : function() {
					var obj = this;

					obj.dd.on('click', function(event){
						$(this).toggleClass('active');
						event.stopPropagation();
					});	
				}
			}

			$(function() {

				var dd = new DropDown( $('#dd') );

				$(document).click(function() {
					// all dropdowns
					$('.wrapper-dropdown-2').removeClass('active');
				});

			});

		</script>
	 <div class="clear"></div>
  </div>
	<div class="header_bottom" id="hearderer">
	     	<div class="menu" id="title">
	     		<ul>
			    	<li class="active"><a href="index.html">首页</a></li>
			    	<li><a href="product-hot.html">最近热卖</a></li>
			    	<li><a href="recommend.html">精品推荐</a></li>
			    	<li><a href="news.html">公司新闻</a></li>
			    	<li><a href="about.html">关于我们</a></li>
                    <li><a href="contact.html">在线留言</a></li>
                    <li><a href="delivery.html">顾客问答</a></li>
			    	<div class="clear"></div>
     			</ul>
	     	</div>
	     	<div class="search_box">
	     		<form action="search.html" method="get" name="se">
	     			<input name="wd" type="text" value="Search" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Search';}">
	     			<input type="submit" value="">
	     		</form>
	     	</div>
	     	<div class="clear"></div>
	     </div>	     	
   </div>
</body>
</html>