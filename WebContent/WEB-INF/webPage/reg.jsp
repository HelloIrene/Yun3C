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
      //为表单元素添加失去焦点事件
      	var code="";
        var judge1=false;var judge2=false;var judge3=false;var judge4=false;var judge5=false;
        $("input[class$='frm_input']").blur(function(){
//             var $parent = $(this).parent();
            //验证名称
            if($(this).is("#txt1")){
       			if(!/[\u4e00-\u9fa5a-zA-Z0-9\-]{3,20}/.test($.trim(this.value))){
       				var html="";
					var html="<div>3-20位字符、支持中英文、数字及“-”‘“_”组合</div>";
                    $("#error1").html(html);
                    document.getElementById("error1").style.visibility="visible";
                    return judge1=false;
                }else{
             	   $.get("SelServlet", {"name":$("#txt1").val()}, function(returnData){
             		   var p=returnData[0];
               		   if(null!=p){
               			 document.getElementById("error1").style.visibility="visible";
               		   	 html="<div>用户名冲突，请重试！</div>";
               		     $("#error1").html(html);
               		     return judge1=false;
               		   }else{
               			 document.getElementById("error1").style.visibility="hidden";
                          return judge1=true;
               		   }
             		})
                 }
            }
            if($(this).is("#txt2")){
                if(!/^(?![0-9]*$)[a-zA-Z0-9]{6,20}$/.test($.trim(this.value))){
                	document.getElementById("error2").style.visibility="visible";
                    return judge2=false;
                }else{
                    document.getElementById("error2").style.visibility="hidden";
                    return judge2=true;
                }
            }
            if($(this).is("#txt3")){
                if($("#txt2").val() !=$.trim(this.value) ){
                    document.getElementById("error3").style.visibility="visible";
                    return judge3=false;
                }else{
                    document.getElementById("error3").style.visibility="hidden";
                    return judge3=true;
                }
            }
            if($(this).is("#txt4")){
                if(!/.+@.+\.[a-zA-Z]{2,4}$/.test($.trim(this.value)) ){
                    document.getElementById("error4").style.visibility="visible";
                    return judge4=false;
                }else{
                    document.getElementById("error4").style.visibility="hidden";
                    return judge4=true;
                }
            }
            if($(this).is("#txt5")){
            	if(code==$.trim(this.value)){
//        			 document.getElementById("code").style.visibility="visible";
       		     return judge5=true;
       		   }else{
//        			 document.getElementById("code").style.visibility="hidden";
                 return judge5=false;
       		   }
            }
        }).keyup(function(){
            $(this).triggerHandler("blur");
        }).focus(function(){
            $(this).triggerHandler("blur");
        });
        
        $("#code").click(function(){
        	if(judge1 && judge4){
	        	$.get("Reg", {"name":$("#txt1").val(),"email":$("#txt4").val()}, function(returnData){
	        		code=returnData;
	        		alert(code);
	      		})}else{
	      			var html="请规范填写用户名和邮箱";
	      			alert(html);
	      		}
        });
        $("#reg").click(function(){
        	if(judge1 && judge2 && judge3 && judge4 && judge5){
        		$.get("RegServlet", {"name":$("#txt1").val(),"pwd":$("#txt2").val(),"email":$("#txt4").val()}, function(returnData){
	        		if(returnData>0){
	        			alert("注册成功，恭喜你成为本店会员！");
	        		}else{
	        			alert("注册出错，请稍后重试！");
	        			return false;
	        		}
	      		})}else{
            	return false;
            }
        });
        
});
</script>

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
    	<div class="reg_box">
        	<div class="reg_step">
					<form action="reg.html" method="get" id="step1_frm">
                   	   <div class="frm_control_group">
							<label class="frm_label"><span class="red">*</span > 用户名</label>
							<div class="frm_controls">
								 <div class="item-ifo">
                                 <input type="text" name="loginname" id="txt1" class="frm_input" maxlength="32"/>
                                  <div class="i-name ico"></div>
                           		 </div>
                                  <span class="frm_tips" id="error1">4-20位字符、支持中英文、数字及“-”‘“_”组合</span >
<!--                                   <input type="button" name="button" value="检测用户" onClick="check()"> -->
                                  </div>
						</div>
<!-- 						<span id="error1" class="frm_tips" style="position:absolute;font-size:1px;color:red;visibility:hidden"> 用户名不标准！ </span> -->
						<div class="frm_control_group">
							<label class="frm_label"><span class="red">*</span > 请设置密码：</label>
							<div class="frm_controls">
								<div class="item-ifo">
                                 <input type="password" name="loginpwd" id="txt2" class="frm_input" maxlength="32"/>
                                 <div class="i-password ico"></div>
                           		 </div>
                                 <span class="frm_tips" id="error2">6-20位字符，支持中英文及数字。不建议运用纯数字、字母组合</span ></div>
						</div>
<!-- 						<span id="error2" class="frm_tips" style="position:absolute;font-size:1px;color:red;visibility:hidden"> 密码格式有误！ </span> -->
						<div class="frm_control_group">
							<label class="frm_label"><span class="red">*</span > 请确认密码：</label>
							<div class="frm_controls">
								<div class="item-ifo">
                                <input type="password" name="password" id="txt3" class="frm_input" maxlength="32"/>
                                 <div class="i-password ico"></div>
                           		 </div>
                                 <span class="frm_tips" id="error3">请再次输入密码</span ></div>
						</div>
<!-- 						<span id="error3" class="frm_tips" style="position:absolute;font-size:1px;color:red;visibility:hidden"> 请再次输入密码！ </span> -->
						<div class="frm_control_group">
							<label class="frm_label"><span class="red">*</span > 电子邮箱</label>
							<div class="frm_controls">
								<div class="item-ifo"><input type="text" name="email" id="txt4" class="frm_input" maxlength="32"/>
                                 <div class="i-phone ico"></div>
                           		 </div>
                                 <span class="frm_tips" id="error4">完成注册后，你可以运用邮箱找回自己的密码！</span >
                                 </div>
						</div>
<!-- 						<span id="error4" class="frm_tips" style="position:absolute;font-size:1px;color:red;visibility:hidden"> 邮箱格式有误！ </span> -->
						<div class="frm_control_group">
							<label class="frm_label"><span class="red">*</span > 验证码</label>
							<div class="frm_controls verifycode">
								<input type="text" name="code" id="txt5" class="frm_input" maxlength="6"/>
                                <input type="button" id="code" value="获取邮箱验证码" class="btn btn_default"/>
							</div>
						</div>
						<div >
							<a id="reg" class="btn btn_primary" href="index.html">确认注册</a>
						</div>
					</form>
				</div>
            
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