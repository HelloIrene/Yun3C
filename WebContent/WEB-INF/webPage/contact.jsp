<!--
 Created by Eclipse.
 User: zyy
 Date: 2017年10月13日
 Time: 下午3:48:22
-->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>
<head>
<title>Contact</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="js/move-top.js"></script>
<script type="text/javascript" src="js/easing.js"></script>
<script>

</script>
<style>
li{
	float:left;
	list-style:none;
}
</style>
</head>
<body>
	<div class="wrap">
		<div
			style="margin: auto; position: absolute; left: 110px; top: 10px; bottom: 735px;">
			<jsp:include page="top.jsp"></jsp:include>
		</div>


		<div class="main">
			<div class="content"
				style="width: 1000px; position: absolute; left: 120px; top: 230px;">
				<div class="section group">

					<div class="col span_2_of_3">
						<div class="contact-form">
							<h2>联系我们</h2>
							<form method="post" action="contact-post.html" id="sub" >
								<div>
									<span><label style="font-weight: bold;">用户名</label></span> <span><input
										name="userName" id="userName" type="text" class="textbox" onblur="checkUser()"
										placeholder="不超过10个字符" ></span>
									<div id="showUsernameErr"
										style="height: 15px; margin-top: 10px; font-size: 15px"></div>
								</div>
								<div>
									<span><label style="font-weight: bold;">邮箱地址</label></span> <span><input
										name="userEmail" id="userEmail" type="text" class="textbox" onblur="checkMail()"
										placeholder="请填写正确的邮箱格式" ></span>
									<div id="showMailErr"
										style="height: 20px; margin-top: 10px; font-size: 15px;"></div>
								</div>
								<div>
									<span><label style="font-weight: bold;">联系方式</label></span> <span><input
										name="userPhone" id="userPhone" type="text" class="textbox" onblur="checkTel()"
										placeholder="请填写手机号码" ></span>
									<div id="showTelErr"
										style="height: 20px; margin-top: 10px; font-size: 15px;"></div>
								</div>
								<div>
									<span><label style="font-weight: bold;">留言内容</label><label
										style="font-weight: bold; color: #e4292f">*请文明用语*</label></span> <span><textarea
											name="userMsg"> </textarea></span>
								</div>
								<div>
								 <ul >
									<li>	<label style="font-weight: bold;width:80px;">验证码：</label></li>
									<li><input type="text" id="CheckCode" style="width:150px;" name="CheckCode"  ></li>
									
									<li><img id="imgcode" style="width:150px;" src="codeimg" border="0" class="verifyimg"  href="javascript:void(0);" onclick="changeImg()"/></li>
									<li><label style="float:left;font-size:20px;margin-top:6px;" id="codenotice"></label></li>
									</ul>
									
								</div>
								<div>
									<span><input type="submit" id="mysubmit" value="提交"
										 class="myButton"  onclick="return verify()" ></span>
								</div>
							</form>
						</div>
					</div>
					<div class="col span_1_of_3">
						<div class="contact_info">
							<h3>公司地图</h3>
							<div class="map">
								<img src="images/map1.jpg" width="300" height="191">
							</div>
						</div>
						<div class="company_address">
							<h3>联系地址：</h3>
							<p>Yun Tech Corporation</p>
							<p>地址:江苏省无锡市新吴区国家软件园巨蟹座</p>
							<p>电话: 0510-12345678</p>
							<p>传真: 0510-87654321</p>
							<p>
								Email: <span>info@yun3Ccompany.com</span>
							</p>

						</div>
					</div>
				</div>
			</div>
		</div>


	</div>
	<script type="text/javascript">

	//**************************验证输入格式***************************************
	function checkUser() {
		var tempName = document.getElementById("userName").value;
		var isValid = true;
		if (tempName == null || tempName == "") {
			var div = document.getElementById("showUsernameErr");
			div.innerHTML = "<span style='color:red;'>*用户名不能为空</span>";
			isValid = false;
		} else {
			var div = document.getElementById("showUsernameErr");
			div.innerHTML = "";
		}
		return isValid;
	}
	function checkMail() {
		var isValid1 = true;

		var reg = /^[A-Za-z\d]+([-_.][A-Za-z\d]+)*@([A-Za-z\d]+[-.])+[A-Za-z\d]{2,4}$/;
		var tempTel = document.getElementById("userEmail").value;
		if (tempTel == null || tempTel == "") {
			var div = document.getElementById("showMailErr");
			div.innerHTML = "<span style='color:red;'>*邮箱号不能为空</span>";
			isValid1 = false;
		} else if (!reg.test(tempTel)) {
			var div = document.getElementById("showMailErr");
			div.innerHTML = "<span style='color:red;'>*邮箱号格式错误</span>";
			isValid1 = false;
		} else {
			var div = document.getElementById("showMailErr");
			div.innerHTML = "";
		}
		return isValid1;
	}
	function checkTel() {
		var isValid2 = true;
		var reg = /^1[3|4|5|8][0-9]\d{8}$/;
		var tempTel = document.getElementById("userPhone").value;
		if (tempTel == null || tempTel == "") {
			var div = document.getElementById("showTelErr");
			div.innerHTML = "<span style='color:red;'>*手机号不能为空</span>";
			isValid2 = false;
		} else if (!reg.test(tempTel)) {
			var div = document.getElementById("showTelErr");
			div.innerHTML = "<span style='color:red;'>*手机号格式错误</span>";
			isValid2 = false;
		} else {
			var div = document.getElementById("showTelErr");
			div.innerHTML = "";
		}
		return isValid2;
	}
	function submitevent() {
		var isValid3 = true;
		if (!checkUser()) {
			isValid3 = false;
		}
		if (!checkMail()) {
			isValid3 = false;
		}
		if (!checkTel()) {
			isValid3 = false;
		}
		return isValid3;
	}
	function submit() {
		if (submitevent()) {
		} else {
		}
	}

	////*********************************************************************************
	//向后台验证
	function verify(){
		var flag = true;
		$.ajax({
			type:"POST",
			url:"checkcode",
			async:false, 
			data:{"vcode":$("#CheckCode").val()},
			success:function(returnData){
				//alert(returnData);
				if(returnData=="yes"){
					$("#codenotice").html("<span style='color:green'>验证码正确！</span>");
					if(submitevent()){
						console.log("格式正确，验证码正确！");
					}else{
						flag = false;
					}
				}else{
					$("#codenotice").html("<span style='color:red'>验证码错误！</span>");
					flag = false;
					return flag;
				}
			}
			//action="contact-post.html" id="sub"
		});
		//alert(flag);
		return flag;
	}
	//点击更换验证码
	function changeImg(){
		$("#imgcode").attr("src","codeimg?"+new Date());
	}
	</script>

	<div style="margin: auto; position: absolute; left: 140px; top: 900px;">
		<jsp:include page="bottom.jsp"></jsp:include>
	</div>

	<script type="text/javascript">
		$(document).ready(function() {
			$().UItoTop({
				easingType : 'easeOutQuart'
			});
		});
	</script>
	<a href="#" id="toTop"><span id="toTopHover"> </span></a>
	<div style="display: none">
		<script src='http://v7.cnzz.com/stat.php?id=155540&web_id=155540'
			language='JavaScript' charset='gb2312'></script>
	</div>
</body>
</html>

