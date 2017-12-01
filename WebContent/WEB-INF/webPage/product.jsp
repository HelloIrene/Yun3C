<%--
  Created by Eclipse.
  User: Ross
  Date: 2017年10月12日
  Time: 下午3:51:37
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${requestScope.product.productName }商品详情</title>
<link href="css/style.css" rel="stylesheet" type="text/css" media="all"/>
<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script> 
<script type="text/javascript" src="js/move-top.js"></script>
<script type="text/javascript" src="js/easing.js"></script>
<script src="js/easyResponsiveTabs.js" type="text/javascript"></script>
<link href="css/easy-responsive-tabs.css" rel="stylesheet" type="text/css" media="all"/>
<link rel="stylesheet" href="css/global.css">
<script src="js/slides.min.jquery.js"></script>
<style>
.comment {
            font-size: 30px;
            color: teal;
        }

.comment li {
            float: left;
            cursor: pointer;
        }

.comment ul {
            list-style: none;
        }
#bg{  
    width: 60px;  
    height: 16px;  
    background: url("/shopping/images/star_gray.png");  
}  
#over{  
    height:16px;  
    background:url("/shopping/images//star_org.png") no-repeat;  
}
</style>
<script>
        $(document).ready(function(){
            var shixin = "★";
            var kongxin = "☆";
            /*var flag = false;//没有点击*/    
            $("l").mouseenter(function(){
                /*$(this).text(shixin).prevAll().text(shixin);
                $(this).nextAll().text(kongxin);*/
                $(this).text(shixin).prevAll().text(shixin).end().nextAll().text(kongxin);
            });
            $(".comment").mouseleave(function(){
               /* if(!flag){
                    $("li").text(kongxin);
                }*/
                $("l").text(kongxin);
                $(".clicked").text(shixin).prevAll().text(shixin);
            });
            $("l").on("click",function(){
               /* $(this).text(shixin).prevAll().text(shixin);
                $(this).nextAll().text(kongxin);
                flag = true;*/           
                var star = this.id;
                $(this).addClass("clicked").siblings().removeClass("clicked");
                document.getElementById("star").value = star;
            });
        });
    </script>
</head>
<body>
	<div class="wrap">
		<div style="margin:auto">
   			<jsp:include page="top.jsp"></jsp:include>
   		</div>
   		<div class="main" style="width:1011px;">
   			<div class="content">  
   			  	
    			<div class="section group">
				<div class="cont-desc span_1_of_2">
				  <div class="product-details">				
					<div class="grid images_3_of_2">
						<div id="container">
						   <div id="products_example">
							   <div id="products">
								<div class="slides_container">
									<a href="#" target="_blank"><img src="${product.imgPath}" alt=" " /></a>
									<c:forEach items="${imgs}" var="imgsDe">
									<a href="#" target="_blank"><img src="${imgsDe.imgPath}" alt=" " /></a>
									</c:forEach>
								</div>
								<ul class="pagination">
									<li><a href="#" target="_blank"><img src="${product.imgPath}" alt=" " /></a></li>
									<c:forEach items="${imgs}" var="imgsDe">
									<li><a href="#" target="_blank"><img src="${imgsDe.imgPath}" alt=" " /></a></li>
									</c:forEach>
								</ul>
							</div>
						</div>
					</div>
				</div>
				<div class="desc span_3_of_2">
					<h2>${requestScope.product.productName }</h2>
					<p>库存：${requestScope.product.stock } 件</p>					
					<div class="price">
						<p>价格: <span>${requestScope.product.price }</span>元</p>
					</div>
				<div class="share-desc">
					<c:choose>
					<c:when test="${requestScope.product.stock==0 }">
					<div class="button"><span><a href="javaScript:void(0);">缺货</a></span></div>
					</c:when>
					<c:otherwise>
					<div class="button"><span><a href="BuyProductServlet?productId=${requestScope.product.productID}">添加到购物车</a></span></div>
					</c:otherwise>
					</c:choose>					
					<div class="clear"></div>
				</div>
				 <div class="wish-list">
				 	<ul>
				 		<li class="wish"><a href="cart.html">返回到购物车</a></li>
				 	    <li class="compare"><a href="#">相关产品对比</a></li>
				 	</ul>
				 </div>
			</div>
			<div class="clear"></div>
		  </div>
		<div class="product_desc">	
			<div id="horizontalTab">
				<ul class="resp-tabs-list">
					<li>产品介绍</li>
					<li>参数规格</li>
					<li>您的评价</li>
                    <li>客户评价</li>
					<div class="clear"></div>
				</ul>
				<div class="resp-tabs-container">
					<div class="product-desc">
					<c:choose >
					<c:when test="${empty details }">
						暂无
					</c:when>
					<c:otherwise>
						${details.productDetails}
					</c:otherwise>
					</c:choose>
                    </div>
				 	<div class="product-tags">
				 	<c:choose>
				 	<c:when test="${empty details }">
						暂无
					</c:when>
					<c:otherwise>
						${details.productCanshu}
					</c:otherwise>
					</c:choose>
			    	</div>	

				<div class="review">	
				  <div class="your-review">
				  	 <h3>你觉得这个宝贝怎么样？</h3>
				  	  <p>请填写你的评价！</p>
				  	  <c:choose>
				  	  <c:when test="${empty user }">				  	  	
				  	  	<a href="userlogin.html">请登录</a>
				  	  </c:when>
				  	  <c:otherwise>
				  	  <form action="updateComment.html" method="post">
					    	<div>
						    	<span><label>用户名<span class="red">*</span></label></span>
						    	<span><input type="text" name="loginname" value="${user.loginname}" readOnly="true"></span>
						    </div>
						    <div>
						    <span><label>五星评分<span class="red">*</span></label></span>
						    <ul class="comment" style="margin-top:0px;color:orange;">
    							<l id="1" value="1">☆</l>
    							<l id="2" value="2">☆</l>
    							<l id="3" value="3">☆</l>
    							<l id="4" value="4">☆</l>
    							<l id="5" value="5">☆</l>
							</ul>
						    </div>
						    <div><span><label>评价标题<span class="red">*</span></label></span>
						    	<span><input type="text" name="commentTitle" value=""></span>
						    </div>						
						    <div>
						    	<span><label>评价内容<span class="red">*</span></label></span>
						    	<span><textarea name="content" > </textarea></span>
						    </div>						
						   <div>
						   		<span><input type="submit" value="提交"></span>
						  </div>
						  <div style="display:none;"><input name="productID" value="${requestScope.product.productID }">
						  </div>
						  <div style="display:none;">
						  <input name="star" id="star" value="">
						  </div>
						  
					    </form>
				  	  </c:otherwise>
				  	  </c:choose>
				  	  
				  	 </div>				
				</div>
				<div>
				<c:choose>
				<c:when test="${empty comments }">
				 	暂无评论
				</c:when>
				<c:otherwise>
                		<c:forEach items="${requestScope.comments }" var="comment">
                		<div class="pblock">
						<img class="name" width="45" height="45" src="images/icon_none.gif">
                        	<div class="rim">
                       			<span class="arrow"></span>
                                <div class="mytit">
                                   	<span class="gray">${comment.userName}</span>
                                   	<div id="levelStar" style="text-align:right;color:red"></div>
                                </div>
                                <div style="margin-left:10px;">                                   	
                                   	<div id="bg"><!--这里是背景，也就是灰色的星星-->  
        <!--说明，这里的width就是设置分数啦，以我写的为例，一个星星的长度是12px，也就是1分12px，如果是4.3分，就是4.3*12px = 51.6px的长度，当然这个一般是取得数据后用js或者其他模板语言去控制的-->  
        							<div id="over" style="width:${comment.star*12}px;"></div><!--这里是遮罩，设置宽度以达到评分的效果-->  
    								</div> 
                                </div>
                                <div class="mycontent">
                                 	<h4><span class="red">${comment.commentTitle }</span>                
                                 	</h4>
                                        <p>${comment.content } </p>
                                </div>    
                        	</div>
                   		</div>
               			</c:forEach>
               	</c:otherwise>
               	</c:choose>
				</div>
			</div>
		 </div>
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
   		<script type="text/javascript">
    $(document).ready(function () {
        $('#horizontalTab').easyResponsiveTabs({
            type: 'default', //Types: default, vertical, accordion           
            width: 'auto', //auto or any width like 600px
            fit: true   // 100% fit in a container
        });
    });
	$(function(){
		$('#products').slides({
			preload: true,
			preloadImage: 'img/loading.gif',
			effect: 'slide, fade',
			crossfade: true,
			slideSpeed: 350,
			fadeSpeed: 500,
			generateNextPrev: true,
			generatePagination: false
		});
	});
   </script>
   	</div>
</div>
	<div style="margin:auto">
   		<jsp:include page="bottom.jsp"></jsp:include>
   	</div>
</body>
</html>