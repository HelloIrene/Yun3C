<%--
  Created by Eclipse.
  User: Ross
  Date: 2017年10月9日
  Time: 上午11:00:09
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>首页</title>
<link href="css/style.css" rel="stylesheet" type="text/css" media="all"/>
<link href="css/slider.css" rel="stylesheet" type="text/css" media="all"/>
<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script> 
<script type="text/javascript" src="js/move-top.js"></script>
<script type="text/javascript" src="js/easing.js"></script>
<script type="text/javascript" src="js/startstop-slider.js"></script>
</head>
<body>
<div class="wrap">
	<div style="margin:auto">
   		<jsp:include page="top.jsp"></jsp:include>
   	</div>
   	<div class="header_slide">
			<div class="header_bottom_left" >				
				<div class="categories" style="height:436px;width:253px;">
				  <ul>
				  	<h3>全部商品分类</h3>
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
					 <div class="header_bottom_right">					 
					 	 <div class="slider" style="height:436px;margin-left:10px;">					     
							 <div id="slider">
			                    <div id="mover">
			                    	<div id="slide-1" class="slide">			                    
									 <div class="slider-img">
									     <a href="product.html?id=2"><img src="images/surface.jpg" alt="learn more" /></a>									    
									  </div>
						             	<div class="slider-text">
		                                 <h1>Microsoft<br>surface</h1>
		                                 <h2>10888起</h2>
									   <div class="features_list">
									   	<h4>万张神券即领即用，最高减150元</h4>							               
							            </div>
							             <a href="product.html?id=2" class="button">现在就买</a>
					                   </div>			               
									  <div class="clear"></div>				
				                  </div>	
						             	<div class="slide">
						             		<div class="slider-text">
		                                 <h1>Apple<br><span>iPad</span></h1>
		                                 <h2>6338起</h2>
									   <div class="features_list">
									   	<h4>万张神券即领即用，最高减150元</h4>							               
							            </div>
							             <a href="product.html?id=120" class="button">现在就买</a>
					                   </div>			               
						             	 <div class="slider-img">
									     <a href="product.html?id=120"><img src="images/ipad.jpg" alt="learn more" /></a>
									  </div>						             					                 
									  <div class="clear"></div>				
				                  </div>
				                  <div class="slide">						             	
					                  <div class="slider-img">
									     <a href="product.html?id=117"><img src="images/huawei.jpg" alt="learn more" /></a>
									  </div>
									 <div class="slider-text">
		                                 <h1>华为 HUAWEI<br><span style="font-size:65px"> MATE 10</span></h1>
		                                 <h2>3899起</h2>
									   <div class="features_list">
									   	<h4>万张神券即领即用，最高减150元</h4>							               
							            </div>
							             <a href="product.html?id=117" class="button">现在就买</a>
					                   </div>			               
									  <div class="clear"></div>				
				                  </div>												
			                 </div>		
		                </div>
					 <div class="clear"></div>					       
		         </div>
		      </div>
		   <div class="clear"></div>
		</div>
   	<div class="main">
    <div class="content">
    	<div class="content_top">
    		<div class="heading">
    		<h3><b>最新</b>热卖</h3>
    		</div>
    		<div class="see">
    			<p><a href="product-hot.html">更多产品</a></p>
    		</div>
    		<div class="clear"></div>
    	</div>
	      <div class="section group">
	      <c:forEach items="${requestScope.plist }" var="p">
				<div class="grid_1_of_4 images_1_of_4" style="height:326px;">
					 <a href="/shopping/product.html?id=${p.productID}"><img src="${p.imgPath }" alt="pic" style="width:210px;height:210px;"/></a>
					 <h2 style="height:28px;">${p.productName }<b > ${p.price }</b>元秒杀价！ </h2>
					<div class="price-details">
				       <div class="price-number">
							<p><span class="rupees">￥${p.price }</span></p>
					    </div>
					       		<div class="add-cart">								
									<h4><a href="/shopping/BuyProductServlet?productId=${p.productID}">添加购物车</a></h4>
							     </div>
							 <div class="clear"></div>
					</div>					 
				</div>
			</c:forEach>
			
			</div>
            <div class="clear"></div>
			<div class="content_bottom">
    		<div class="heading">
    		<h3><b>精品</b>推荐</h3>
    		</div>
    		<div class="see">
    			<p><a href="recommend.html">更多产品</a></p>
    		</div>
    		<div class="clear"></div>
    	</div>
			<div class="section group">
			<c:forEach items="${requestScope.plist2 }" var="p1">
				<div class="grid_1_of_4 images_1_of_4" style="height:326px;">
					 <a href="/shopping/product.html?id=${p1.productID}"><img src="${p1.imgPath }" alt="pic" style="width:210px;height:210px;"/></a>
					 <h2 style="height:28px;">${p1.productName }<b > ${p1.price }</b>元秒杀价！ </h2>
					<div class="price-details">
				       <div class="price-number">
							<p><span class="rupees">￥${p1.price }</span></p>
					    </div>
					       		<div class="add-cart">								
									<h4><a href="/shopping/BuyProductServlet?productId=${p1.productID}">添加购物车</a></h4>
							     </div>
							 <div class="clear"></div>
					</div>					 
				</div>
			</c:forEach>
			</div>
    </div>
 </div>
<div class="clear"></div>
</div>
	<div style="margin:auto">
   		<jsp:include page="bottom.jsp"></jsp:include>
   	</div>
</body>
</html>