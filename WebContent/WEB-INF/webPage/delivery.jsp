<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML>
<head>
<title>Delivery</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<link href="css/style.css" rel="stylesheet" type="text/css" media="all"/>
<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script> 
<script type="text/javascript" src="js/move-top.js"></script>
<script type="text/javascript" src="js/easing.js"></script>
<script type="text/javascript" src="js/jquery.accordion.js"></script>
<script type="text/javascript">
$(document).ready(function() {
			$("#posts").accordion({ 
				header: "div.tab", 
				collapsible: true,
				alwaysOpen: false,
				autoheight: false
			});
		});
</script>
</head>
<body>
  <div class="wrap">
  
	<div style="margin:auto">
		<jsp:include page="top.jsp"></jsp:include>
	</div>
   
   
 <div class="main">
    <div class="content">
    		
		<div class="faqs">
		
    	  <h2 style="width:200px;position: absolute;left:130px; top:205px;">顾客问答</h2>	          	
            <div id="posts" style="width:900px;position: absolute;left:130px; top:240px;">
            	<c:forEach items="${qnas}" var="qna">
            	<div class="tab bar" style="height:21px;">
                    <h3 class="post-title">Q：${qna.question} </h3>
                </div>
			    <div class="panel margin-lr-7" style="background:#f5f5f5;height:67px;">
            		<p style="color:#222"> A：${qna.answer} </p>

			    </div>
			    
            	</c:forEach>
            <div class="content-pagenation">
            	<c:choose>
            		<c:when test="${requestScope.page == 1}">
            			第一页  上一页
            			<a href="delivery.html?page=${requestScope.page+1}">下一页</a>
            			<a href="delivery.html?page=${requestScope.totalPage}">最后页</a>     			
            		</c:when>
            		<c:when test="${requestScope.page == requestScope.totalPage}">
						<a href="delivery.html?page=1">第一页</a>
						<a href="delivery.html?page=${requestScope.page-1 }">上一页</a>
						下一页
						最后页
					</c:when>
					<c:otherwise>
						<a href="delivery.html?page=1">第一页</a>
						<a href="delivery.html?page=${requestScope.page-1 }">上一页</a>
						<a href="delivery.html?page=${requestScope.page+1 }">下一页</a>
						<a href="delivery.html?page=${requestScope.totalPage }">最后页</a>
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
 
 
   <div style="margin:auto;position: absolute;left:140px; top:900px;">
   <jsp:include page="bottom.jsp"></jsp:include>
   </div>
   
   <script type="text/javascript">
		$(document).ready(function() {
			$().UItoTop({ easingType: 'easeOutQuart' });
			
		});
	</script>
    <a href="#" id="toTop"><span id="toTopHover"> </span></a>
<div style="display:none"><script src='http://v7.cnzz.com/stat.php?id=155540&web_id=155540' language='JavaScript' charset='gb2312'></script></div>
</body>
</html>

