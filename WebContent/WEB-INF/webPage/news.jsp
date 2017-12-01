<!--
 Created by Eclipse.
 User: zyy
 Date: 2017年10月13日
 Time: 下午3:48:34
-->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>
<head>
<title>News</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<link href="css/style.css" rel="stylesheet" type="text/css" media="all"/>
<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script> 
<script type="text/javascript" src="js/move-top.js"></script>
<script type="text/javascript" src="js/easing.js"></script>
</head>
<body>
  <div class="wrap">
  <div style="margin:auto">
		<jsp:include page="top.jsp"></jsp:include>
	</div>
  
    
 <div class="main">
    <div class="content">
    	    	
		<c:forEach items="${news}" var="newTemp" >		   
		   <div class="image group" style="height:231px;width:1011px;">
				<div class="grid images_3_of_1" style="height:201px;width:296px;">
					<img src="${newTemp.pic}" alt="" />
				</div>
				<div class="grid news_desc" style="height:154px;width:659px;">
					<h3 style="margin-left: 5px;margin-right: 5px;margin-top: 5px;margin-bottom: 5px;">${newTemp.title}</h3>
					<h4>${newTemp.addTime}</h4>
					<p>${newTemp.lead}<a href="news-content.html?id=${newTemp.newID}" title="more">[....]</a></p>
			    </div>
		   </div>
		 </c:forEach>  
		   
			<div class="content-pagenation">
            	<c:choose>
            		<c:when test="${requestScope.page == 1}">
            			第一页  上一页
            			<a href="news.html?page=${requestScope.page+1}">下一页</a>
            			<a href="news.html?page=${requestScope.totalPage}">最后页</a>     			
            		</c:when>
            		<c:when test="${requestScope.page == requestScope.totalPage}">
						<a href="news.html?page=1">第一页</a>
						<a href="news.html?page=${requestScope.page-1 }">上一页</a>
						下一页
						最后页
					</c:when>
					<c:otherwise>
						<a href="news.html?page=1">第一页</a>
						<a href="news.html?page=${requestScope.page-1 }">上一页</a>
						<a href="news.html?page=${requestScope.page+1 }">下一页</a>
						<a href="news.html?page=${requestScope.totalPage }">最后页</a>
						<div class="clean"></div>
					</c:otherwise>
            	</c:choose>
		      	第  ${requestScope.page} / ${requestScope.totalPage } 页			      			      			   
			</div>
			
         </div> 
    </div>
    
    
 </div>
 
   <div style="margin:auto">
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

