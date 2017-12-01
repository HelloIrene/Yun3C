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
<script type="text/javascript">
$(document).ready(function(){
	$("#up").click(function(){
		if("${sessionScope.user.loginname}"==""){
			document.getElementById("up").style.visibility="hidden";
		}else{
			document.getElementById("up").style.visibility="visible";
		}
		});
	});
function change(){
	var r= new FileReader();
	Path=document.getElementById('file').files[0];
	r.readAsDataURL(Path);
	r.onload=function(e) {
// 		alert(this.result);
		document.getElementById('image').src=this.result;
	};
}
var xmlHttpReq = null;
function ajaxSubmit(){
	if(window.ActiveXObject){
		//IE浏览器
		xmlHttpReq = new ActiveXObject("Microsoft.XMLHTTP");
	}else if(window.XMLHttpRequest){
		//其他浏览器
		xmlHttpReq = new XMLHttpRequest();
	}
	if(xmlHttpReq!=null){
		var fileObj = document.getElementById("file").files[0];
// 		var name = "${sessionScope.user.loginname}";
		xmlHttpReq.open("POST", "Altermessage", true);
		//关联回调函数
		xmlHttpReq.onreadystatechange = ajaxCallBack;
		
		var form = new FormData();
		var email = document.getElementById("txt1").value;
		var telephone = document.getElementById("txt2").value;
        form.append("file", fileObj);
        form.append("name", "${sessionScope.user.loginname}");
        if(/^(\w)+(\.\w+)*@(\w)+((\.\w{2,3}){1,3})$/.test(email)){
        	form.append("email", email);
        }
        if(/^1(3|4|5|7|8)\d{9}$/.test(telephone)){
        	form.append("telephone", telephone);
        }
        form.append("image", document.getElementById('image').src);
		xmlHttpReq.send(form);
	}
}
//回调函数
function ajaxCallBack(){
	if(xmlHttpReq.readyState == 4){
		if(xmlHttpReq.status == 200){
			var result = xmlHttpReq.responseText;
			if(result>0){
				alert("更新成功！");
			}else{
				alert("更新失败！请稍后重试");
			}
		}
	}
}

</script>
</head>
<body>
 <div class="wrap">
  
	<div style="margin:auto">
		<jsp:include page="top.jsp"></jsp:include>
 </div>
 <div class="main">
    <div class="content">
    	<div class="person_center">
        	<div class="pc_left">
            	<div id="pc_menu">
                        <h3><a href="#"><span class="i2">我的交易</span></a></h3>                
                       	<ul >
                      		 <li><a href="person_center.html" target="_self">我的订单</a></li>
                             <li><a href="order-pj1.html" target="_self">我的评价</a></li>
                             <li><a href="cart.html" target="_self">购物车</a></li>

                       </ul>
<!--                         <h3><a href="#"><span class="i2">我的资产</span></a></h3>                 -->
<!--                        	<ul > -->
<!--                       		 <li><a href="#" target="_self">账户余额</a></li> -->
<!--                        </ul> -->
                       <h3><a href="#"><span class="i2">客户服务</span></a></h3>                
                       	<ul >
                      		 <li><a href="#" target="_self">账户资料</a></li>
                             <li><a href="password.html" target="_self">修改密码</a></li>
                             <li><a href="order-returns.html" target="_self">退换货</a></li>
                             <li><a href="order-cancel.html" target="_self">取消订单记录</a></li>
                             
                       </ul>
                </div>
            </div>
            <div class="pc_right">
            	<div class="title-items">
                    <h2>账户资料</h2>
                    <div class="r">
                    <span class="excel-export"> <a id="export" href="#">返回<i class="icons"></i></a></span>
                    </div>
                    <b class="line" data-line="一条横线"></b>
                </div>
                <form action="upload" method="post" enctype="multipart/form-data">
	                <div class="personCenter_ipt">
	                <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table">
	                 <tr>
	                   <td width="150" rowspan="6" align="center" valign="top"  ><img src="${sessionScope.user.image}" id="image" name="image" width="100" height="126"  style="margin-top:30px;"/><span class="f2"><a style=" display:inline-block; height:50px; width:70px; margin-left:19px;overflow:hidden; cursor:pointer"><input type="file" id="file" name="file" onchange="change()"></a></span></td>
	                 	<input type="button" value="上传" id="up" onclick="ajaxSubmit()"/>
	                 <td><div class="querytext1"><span class="f1">用户名：</span><span class="f2" id="txt">${sessionScope.user.loginname}</span></div></td>
	                   
	                 </tr>
	                  <tr>
	                    <td><div class="querytext1"><span class="f1">邮&nbsp;&nbsp;&nbsp;&nbsp;箱：</span><input type="text" id="txt1" name="email" class="f2" style="margin-top:15px" placeholder="${sessionScope.user.email}" ><span class="f2"></span><span class="info-icon1" style="margin-top:8px"></span></div></td>
	                
	                  </tr>
	                <tr>
	                    <td><div class="querytext1"><span class="f1">手&nbsp;&nbsp;&nbsp;&nbsp;机：</span><input type="text" id="txt2" name="telephone" class="f2" style="margin-top:15px" placeholder="${sessionScope.user.telephone}" > <span class="f2"></span></div></td>
	                
	                  </tr>
	                   <tr>
	                    <td><div class="querytext1"><span class="f1">密&nbsp;&nbsp;&nbsp;&nbsp;码：</span><span class="f2"><a href="password.html">更改</a></span><span class="info-icon1" style="margin-top:8px"></span><div class="clear"></div></div></td>
	                
	                  </tr>
	               </table>
	           </div>
           </form>
            </div>
        </div>
    </div>
 </div>
</div>
   <div style="margin:auto;position: absolute;left:140px; top:900px;">
   <jsp:include page="bottom.jsp"></jsp:include>
   </div>    
</body>
</html>