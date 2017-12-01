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
		xmlHttpReq.open("POST", "Alterpwd", true);
		//关联回调函数
		xmlHttpReq.onreadystatechange = ajaxCallBack;
		
		var form = new FormData();
        form.append("name", "${sessionScope.user.loginname}");
        form.append("oldpwd", document.getElementById('old').value);
        form.append("newpwd", document.getElementById('new').value);
        form.append("newpwdp", document.getElementById('newp').value);
		xmlHttpReq.send(form);
	}
}
//回调函数
function ajaxCallBack(){
	if(xmlHttpReq.readyState == 4){
		if(xmlHttpReq.status == 200){
			var result = xmlHttpReq.responseText;
			if(result>0){
				alert("密码更改成功！");
			}else{
				alert("密码更改失败！请稍后重试");
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
                      		 <li><a href="message.html" target="_self">账户资料</a></li>
                             <li><a href="#" target="_self">修改密码</a></li>
                             <li><a href="order-returns.html" target="_self">退换货</a></li>
                             <li><a href="order-cancel.html" target="_self">取消订单记录</a></li>
                             
                       </ul>
                </div>
            </div>
            <div class="pc_right">
            	<div class="title-items">
                    <h2>修改密码</h2>
                    <div class="r">
                    <span class="excel-export"> <a id="export" href="#">返回<i class="icons"></i></a></span>
                    </div>
                    <b class="line" data-line="一条横线"></b>
                </div>
                <form action="Alterpwd" method="post">
	                <div class="personCenter_ipt">
	                 <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table">
	                 <tr>
	                   <td ><span style="line-height:50px;">请修改你的账号密码</span></td>
	                 </tr>
	                 <tr>
	                   <td><div class="querytext1"><span class="f1">&nbsp;当前密码：</span><input type="text" id="old" name="oldpwd" class="inputlong2" /></div></td>
	                 </tr>
	                 <tr>
	                  <td> <div class="querytext1"><span class="f1">新&nbsp;密&nbsp;码：</span><input type="password" id="new" name="newpwd" class="inputlong2"  /></div></td>
	                 </tr>
	                  <tr>
	                  <td><div class="querytext1"><span class="f1"> 确认新密码：</span><input type="password" id="newp" name="newpwdp" class="inputlong2"  /></div></td>
	                 </tr>
	               
	                
	               </table>
	                <div class="button_box"><input type="button" class="pwdsub" value="确定" style="float:left;margin-left:120px; margin-top:20px; font-size:1em;padding:5px 35px;background:#CD1F25;color: #FFF;border:none;text-decoration: none;outline: 0;cursor:pointer;
-webkit-transition: all 0.5s ease-in-out;-moz-transition: all 0.5s ease-in-out;-o-transition: all 0.5s ease-in-out;transition: all 0.5s ease-in-out;border-radius:5px;-webkit-border-radius: 5px;-moz-border-radius: 5px;" onclick="ajaxSubmit()"/></div>
	                <div class="clear"></div>
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
