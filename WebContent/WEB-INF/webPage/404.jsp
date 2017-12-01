<%--
  Created by Eclipse.
  User: Ross
  Date: 2017年10月16日
  Time: 上午9:28:43
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>出错啦！</title>
<style type="text/css">
#area-a {
position: absolute;
left: 196px;
top: 264px;
width: 480px;
font-weight: bold;
background-color: #fff;
padding: 16px;
border-left: 2px solid #ff9101;
}
#area-a h1{
height: 96px;
font-size: 96px;
line-height: 96px;
margin-right: 8px;
color: #333;
text-shadow: 0 0 1px rgba(51,51,51,0.5);
}
.l{
float:left;
}
#area-a h1 span{
color: #ff9101;
text-shadow: 0 0 1px rgba(255,145,1,0.5);
}
#area-a .a{
color: #ccc;
    height: 24px;
    font-size: 24px;
    line-height: 24px;
    text-shadow: 0 0 1px rgba(204,204,204,0.5);
    margin-top: 12px;
}
#area-a .b{
color: #333;
    height: 32px;
    font-size: 32px;
    line-height: 32px;
    text-shadow: 0 0 1px rgba(51,51,51,0.5);
    margin-top: 8px;
}
#area-b{
position: absolute;
    left: 196px;
    top: 440px;
    width: 480px;
    background-color: #fff;
    padding: 16px;
    border-left: 2px solid #08c;
    float:left;
}
.icon {
    display: inline-block;
    font: normal normal normal 14px/1 FontAwesome;
    font-size: inherit;
    text-rendering: auto;
    -webkit-font-smoothing: antialiased;
}
#area-b p{
    color: #08c;
    font-size: 24px;
    font-weight: bold;
    text-shadow: 0 0 1px rgba(0,136,204,0.5);
    text-align: left;
}
#area-b ul {
    margin: 16px 0 0 8px;
    font-size: 14px;
    line-height: 1.6;
    list-style: square inside;
    color: #333;
    text-shadow: 0 0 1px rgba(51,51,51,0.2);
}
li {
    display: list-item;
    text-align: left;
}
.icon-info-circle:before {
    content: \f05a;
}
a {
    color: #369;
    white-space: normal;
    word-break: break-all;
    cursor: pointer;
}
#mainer-inner {
    background: url(/shopping/images/logo/logo.png) left top no-repeat;
    height: 590px;
    margin-left: 804px;
    margin-top: 184px;
}
</style>
</head>
<body>
	<div style="margin-left:150px;margin-right:150px;">
		<div style="margin:auto">
   			<jsp:include page="top.jsp"></jsp:include>
   		</div>
   	</div>
   	<div id="mainer-inner">
   	<table style="height:800px;">
	<tr>
	<td align="center" valign="middle">
	<div id="area-c" style="position:absolute;left:196px;top:600px;width:480px;background:#fff;border-left:2px solid #08c;padding:16px;text-align: left;">
		<a href="/shopping/index.html" style="font-size:16px;">转到我们的主页</a>
	</div>
	<div id="area-a">
		<h1 class="l">4<span>0</span>4</h1>
		<div class="l"><p class="a">Not Found</p>
			<p class="b">未找到访问页面</p>
		</div>
		<span class="clearfix"></span>
	</div>
	<div id="area-b"> 
		<p>
			<i class="icon icon-info-circle"></i>该错误可能由于如下原因所致</p> 
			<ul>
				<li>页面已失效</li>
				<li>页面已被修改或删除</li>
			</ul> 
	</div>
	<span class="clearfix"></span>
	</td>
	</tr>
	</table>
	</div>
	<div style="margin:auto">
   		<jsp:include page="bottom.jsp"></jsp:include>
   	</div>
</body>
</html>