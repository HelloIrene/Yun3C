<!--
 Created by Eclipse.
 User: zyy
 Date: 2017年10月17日
 Time: 上午9:32:10
-->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>
<head>
<title>answer</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<link href="/shopping/css/style.css" rel="stylesheet" type="text/css" media="all" />
<link rel="stylesheet" href="/shopping/css/content.css" />
<script type="text/javascript" src="/shopping/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="/shopping/js/move-top.js"></script>
<script type="text/javascript" src="/shopping/js/easing.js"></script>
<script type="text/javascript" src="/shopping/js/jquery.accordion.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#posts").accordion({
			header : "div.tab",
			alwaysOpen : false,
			autoheight : false
		});
	});
	
	function displayW() {
		$("#Waring").remove();
	}
</script>
</head>
<body>
	<div class="wrap">
		<div class="main">
			<div class="content" style="width:100%;">

				<div class="faqs">

					<h2>顾客问答后台编辑</h2>
					<div id="posts">

						<c:forEach items="${qnas}" var="qna">
							<div class="tab bar" style="height: 21px;width:900px;">
								<h4 class="post-title">Q：${qna.question }</h4>
							</div>

							<div>
								<textarea id="userMsg${qna.questionID}" name="userMsg" rows="10" cols="20"
									style="width: 863px; height: 56px; resize: none; font-size: 14px;" onfocus="displayW()">${qna.answer}</textarea>
							</div>

							<div style="margin-left: 0px; margin-top: 0px">
								<a href="deleteQuestion.html?id=${qna.questionID}"><input type="button" value="删除" class="sub-btn"></a> 
								<input type="button" value="提交" class="sub-btn" onclick="ajaxSubmit(${qna.questionID})">
							</div>
							<div id="${qna.questionID}"></div>
						</c:forEach>

					<div class="content-pagenation">
            		<c:choose>
            		<c:when test="${requestScope.page == 1}">
            			第一页  上一页
            			<a href="answer.html?page=${requestScope.page+1}">下一页</a>
            			<a href="answer.html?page=${requestScope.totalPage}">最后页</a>     			
            		</c:when>
            		<c:when test="${requestScope.page == requestScope.totalPage}">
						<a href="answer.html?page=1">第一页</a>
						<a href="answer.html?page=${requestScope.page-1 }">上一页</a>
						下一页
						最后页
					</c:when>
					<c:otherwise>
						<a href="answer.html?page=1">第一页</a>
						<a href="answer.html?page=${requestScope.page-1 }">上一页</a>
						<a href="answer.html?page=${requestScope.page+1 }">下一页</a>
						<a href="answer.html?page=${requestScope.totalPage }">最后页</a>
						<div class="clean"></div>
					</c:otherwise>
            	</c:choose>
		      	第  ${requestScope.page} / ${requestScope.totalPage } 页	
		      	
		      	
		      	  
			</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<script>
		function checkPageNum(){
			var page = document.getElementById("page").value;
			var tPageStr = document.getElementById("tPage").innerHTML;
			var totalPage = parseInt(tPageStr);
			if(page > totalPage || !page.test(/^[1-9]\d*$/)){
				alert("你输入了无效的页码！");
				return false;
			}
		}
	</script>
	<script type="text/javascript">
		$(document).ready(function() {
			$().UItoTop({
				easingType : 'easeOutQuart'
			});

		});
	</script>
	<script type="text/javascript">
	var idNo = 0;
	var xmlHttpReq = null;
	function ajaxSubmit(id){
		idNo=id;
		if(window.ActiveXObject){
			//IE浏览器
			xmlHttpReq = new ActiveXObject("Microsoft.XMLHTTP");
		}else if(window.XMLHttpRequest){
			//其他浏览器
			xmlHttpReq = new XMLHttpRequest();
		}
		if(xmlHttpReq!=null){
			xmlHttpReq.open("POST", "updateQuestion.html", true);
			//关联回调函数
			xmlHttpReq.onreadystatechange = ajaxCallBack;
			//获取文本框中的值
			var name = "userMsg"+id;
			var answer = document.getElementById(name).value;
			//设置请求头为form表单形式
			xmlHttpReq.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
			//真正地向服务端发送请求
			xmlHttpReq.send("a="+answer+"&id="+id);
			
		}
	}
	//回调函数
	function ajaxCallBack(){
		if(xmlHttpReq.readyState == 4){
			if(xmlHttpReq.status == 200){
				var result = xmlHttpReq.responseText;
				document.getElementById(idNo).innerHTML = result;
			}
		}
	}
	</script>
	<a href="#" id="toTop"><span id="toTopHover"> </span></a>
	<div style="display: none">
	</div>
</body>
</html>

