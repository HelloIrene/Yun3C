<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<link href="css/style.css" rel="stylesheet" type="text/css" media="all"/>
<link href="css/slider.css" rel="stylesheet" type="text/css" media="all"/>
<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script> 

</head>
<body>
  <div class="wrap">
	<div class="header">

		<div class="header_top">
			<div class="logo">
				<a href="index.html"><img src="images/logo/logoMiddle.png" alt="" /></a>
			</div>
            <div class="account_desc">
				<ul>
                		<li><a href="#">你好，欢迎来到电子在线商城！</a></li>
					<li><a href="userlogin.html">欢迎登录</a></li>
					<li><a href="reg.html">注册</a></li>
				
				</ul>
			</div>
			<div class="clear"></div>
			
  </div>
	<div class="header_bottom">
	     	<div class="menu">
	     		<ul>
			    	<li class="active"><a href="index.html">首页</a></li>
			    	<li><a href="product-hot.html">最近热卖</a></li>
			    	<li><a href="product.html">精品推荐</a></li>
			    	<li><a href="news.html">公司新闻</a></li>
			    	<li><a href="about.html">关于我们</a></li>
                    <li><a href="contact.html">在线留言</a></li>
                    <li><a href="delivery.html">顾客问答</a></li>
			    	<div class="clear"></div>
     			</ul>
	     	</div>
	     	<div class="search_box">
	     		<form>
	     			<input type="text" value="Search" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Search';}"><input type="submit" value="">
	     		</form>
	     	</div>
	     	<div class="clear"></div>
	     </div>	     
	
   </div>
 <div class="main">
    <div class="content">
    	<div class="login_box">
        	<div class="login_l"><img src="images/login_left.gif" width="462" height="355"></div>
            <div class="login_r">
            	<form action="userlogin.html" method="post">
	            	<div class="login_form">
	                 		<div>
	                            <span>用户名/邮箱</span>
	                            <div class="item-ifo">
	                                <input id="loginname" class="text" type="text" autocomplete="off" tabindex="1" name="loginname" sta="2">
	                                <div class="i-name ico"></div>
	                                <label id="loginname_succeed" class="red"></label>
	                            </div>
	                        </div>
	                        <div>
	                            <span>密码</span>
	                            <div class="item-ifo">
	                                <input id="loginpwd" class="text" type="password" autocomplete="off" tabindex="2" name="loginpwd" sta="2">
	                                <div class="i-password ico"></div>
	                               	<label id="loginpwd_succeed" class="red"></label>
									<label id="loginpwd_error" class="hide"></label>
	                            </div>
	                        </div>
	                        <div class="clear"></div>
	                        <div  class="mt50">
	                        <input id="loginsubmit" class="btn-entry" type="submit" clstag="passport|keycount|login|06" tabindex="8" value="登录">
	                        </div>
	                </div>
	        	</form>
                <div class="free-regist">
                <span>
                <a  href="reg.html">用户注册>></a>
                </span>
                </div>
            </div>
            <div class="clear"></div>
        </div>
    </div>
 </div>
</div>
   <div class="footer">
        <div class="copy_right">
				<p>Copyright &copy; 2014.Company name All rights reserved.</p>
		   </div>
    </div>
    
</body>
</html>