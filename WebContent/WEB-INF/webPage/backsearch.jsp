<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>商品详情</title>
<link href="/shopping/css/style.css" rel="stylesheet" type="text/css" media="all"/>
<script type="text/javascript" src="/shopping/js/jquery-1.7.2.min.js"></script> 
<script type="text/javascript" src="/shopping/js/move-top.js"></script>
<script type="text/javascript" src="/shopping/js/easing.js"></script>
<script src="/shopping/js/easyResponsiveTabs.js" type="text/javascript"></script>
<link href="/shopping/css/easy-responsive-tabs.css" rel="stylesheet" type="text/css" media="all"/>
<link rel="stylesheet" href="/shopping/css/global.css">
<script src="/shopping/js/slides.min.jquery.js"></script>
</head>
<body>
   	<div class="main">
    <div class="content">
    	<div class="section group">
				<div class="cont-desc span_1_of_2" style="width:90%"><script type="text/javascript">
    $(document).ready(function () {
        $('#horizontalTab').easyResponsiveTabs({
            type: 'default', //Types: default, vertical, accordion           
            width: 'auto', //auto or any width like 600px
            fit: true   // 100% fit in a container
        });
    });
   	</script>		
   	<div class="content_pro">
    		<div class="heading">
    		<h3><c style="color:red;">商品详情 &emsp;第${requestScope.page}页</c></h3>
    		</div>
    		<div class="clear"></div>
    	</div>
   	<div class="section group">
   	<c:forEach items="${requestScope.plist }" var="p" varStatus="st">
		<div class="grid_1_of_4 images_1_of_3">
			<a href="backpreview.html?id=${p.productID}"><img src="../${p.imgPath}" alt="pic" style="margin-left:30px;height:200px;width:200px"></a>
           	<h2>${p.productName} <b>${p.price}</b>元 </h2>
			<div class="price" style="border:none">
				<div class="add-cart" style="float:none">								
					<h4><a href="backpreview.html?productId=${p.productID}">修改信息</a></h4>
				</div>
				<div class="clear"></div>
			</div>
		</div>
	<c:if test="${(st.index+1) % 3 ==0 }">
	</div>
	<div class="section group">
	</c:if>
	</c:forEach>
	</div>
	
        	<div class="content-pagenation">
        	<c:choose>
        	<c:when test="${requestScope.totalPage == 1 }"></c:when>
        	<c:otherwise>
             	<c:choose>
				<c:when test="${requestScope.page == 1 }">
					<li><a href="#">第一页</a></li> 
					<li class="active"><a href="#">1</a></li>
					<li><a href="${requestScope.changepage}?wd=${requestScope.wd}&page=${requestScope.page+1 }">下一页</a></li>
					<li><a href="${requestScope.changepage}?wd=${requestScope.wd}&page=${requestScope.totalPage }">最后页</a></li>
				</c:when>
				<c:when test="${requestScope.page == requestScope.totalPage }">
					<li><a href="${requestScope.changepage}?wd=${requestScope.wd}&page=1">第一页</a></li> 
					<li><a href="${requestScope.changepage}?wd=${requestScope.wd}&page=${requestScope.page-1 }">上一页</a></li>
					<li class="active"><a href="#">${requestScope.totalPage }</a></li>
					<li><a href="#">最后页</a></li>
				</c:when>
				<c:otherwise>
					<li><a href="${requestScope.changepage}?wd=${requestScope.wd}&page=1">第一页</a></li>
					<li><a href="${requestScope.changepage}?wd=${requestScope.wd}&page=${requestScope.page-1 }">上一页</a></li>
					<li><a href="${requestScope.changepage}?wd=${requestScope.wd}&page=${requestScope.page+1 }">下一页</a></li>
					<li><a href="${requestScope.changepage}?wd=${requestScope.wd}&page=${requestScope.totalPage }">最后页</a></li>
				</c:otherwise>
				</c:choose>
			</c:otherwise>
			</c:choose>
				第  ${requestScope.page} / ${requestScope.totalPage } 页
					</div>						
        </div>
 		</div>
 	</div>
    </div>
 		   	
	<!--  <div style="margin:auto">
   		<jsp:include page="bottom.jsp"></jsp:include>
   	</div>-->
</body>
</html>