<%--
  Created by Eclipse.
  User: Ross
  Date: 2017年10月17日
  Time: 下午9:23:01
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${requestScope.wd}</title>
<link href="css/style.css" rel="stylesheet" type="text/css" media="all"/>
<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script> 
<script type="text/javascript" src="js/move-top.js"></script>
<script type="text/javascript" src="js/easing.js"></script>
<script src="js/easyResponsiveTabs.js" type="text/javascript"></script>
<link href="css/easy-responsive-tabs.css" rel="stylesheet" type="text/css" media="all"/>
<link rel="stylesheet" href="css/global.css">
<script src="js/slides.min.jquery.js"></script>
</head>
<body>
<div class="wrap">
	<div style="margin:auto">
   		<jsp:include page="top.jsp"></jsp:include>
   	</div>
   	<div class="main">
    <div class="content">
    	<div class="section group">
				<div class="cont-desc span_1_of_2"><script type="text/javascript">
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
    		<h3><c style="color:red;">${requestScope.wd}</c></h3>
    		</div>
    		<div class="see">
    			<p><a href="index.html">返回首页</a></p>
    		</div>
    		<div class="clear"></div>
    	</div>
   	<div class="section group">
   	<c:forEach items="${requestScope.plist }" var="p" varStatus="st">
		<div class="grid_1_of_4 images_1_of_3">
			<a href="product.html?id=${p.productID}"><img src="${p.imgPath}" alt="pic" style="height:200px;"></a>
           	<h2 style="height:28px;">${p.productName} <b>${p.price}</b>元秒杀价！ </h2>
			<div class="price" style="border:none">
				<div class="add-cart" style="float:none">								
					<h4><a href="UpdateCartServlet.html?productId=${p.productID}">添加到购物车</a></h4>
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
        	第  ${requestScope.page} / ${requestScope.totalPage } 页
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
					</div>						
        </div>
				<div class="rightsidebar span_3_of_1">
					<h2>产品分类</h2>
					<ul>
				      <li><a href="productType.html?wd=智能手机">智能手机</a></li>
				      <li><a href="productType.html?wd=平板电脑">平板电脑</a></li>
				      <li><a href="productType.html?wd=笔记本">笔记本</a></li>
				      <li><a href="productType.html?wd=台式电脑">台式电脑</a></li>
				      <li><a href="productType.html?wd=数码相机">数码相机</a></li>
				      <li><a href="productType.html?wd=影像设备">影像设备</a></li>
				      <li><a href="productType.html?wd=办公设备">办公设备</a></li>
				      <li><a href="productType.html?wd=电脑手机配件">电脑、手机配件</a></li>
				      <li><a href="productType.html?wd=外设产品">外设产品</a></li>
				      <li><a href="productType.html?wd=网络产品">网络产品</a></li>
				      <li><a href="productType.html?wd=文具耗材">文具耗材</a></li>
				      <li><a href="productType.html?wd=服务产品">服务产品</a></li>
    				</ul>
 				</div>
 		</div>
 	</div>
    </div>
   	</div>   		   	
	<div style="margin:auto">
   		<jsp:include page="bottom.jsp"></jsp:include>
   	</div>
</body>
</html>