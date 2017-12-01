<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >

<head>
<meta charset="UTF-8">
<title>Preview</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<link href="../css/style.css" rel="stylesheet" type="text/css" media="all"/>
<script type="text/javascript" src="../js/jquery-1.7.2.min.js"></script> 
<script type="text/javascript" src="../js/move-top.js"></script>
<script type="text/javascript" src="../js/easing.js"></script>
<script src="../js/easyResponsiveTabs.js" type="text/javascript"></script>
<link href="../css/easy-responsive-tabs.css" rel="stylesheet" type="text/css" media="all"/>
<link rel="stylesheet" href="../css/global.css">
<script src="../js/slides.min.jquery.js"></script>
<script>

		
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
  <script type="text/javascript">
			function DropDown(el) {
				this.dd = el;
				this.initEvents();
			}
			DropDown.prototype = {
				initEvents : function() {
					var obj = this;

					obj.dd.on('click', function(event){
						$(this).toggleClass('active');
						event.stopPropagation();
					});	
				}
			}

			$(function() {

				var dd = new DropDown( $('#dd') );

				$(document).click(function() {
					// all dropdowns
					$('.wrapper-dropdown-2').removeClass('active');
				});

			});

		</script>	
</head>
<body>
  <div class="wrap">

   <script >				
			$(function() {
				$("#file_upload").change(function() {
				var $file = $(this);
				var fileObj = $file[0];
				var windowURL = window.URL || window.webkitURL;
				var dataURL;
				var $img = $("#preview");				 
				if(fileObj && fileObj.files && fileObj.files[0]){
				dataURL = windowURL.createObjectURL(fileObj.files[0]);
				
				$img.attr('src',dataURL);				
				}else{
				dataURL = $file.val();
				var imgObj = document.getElementById("preview");
				
				imgObj.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale)";
				imgObj.filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src = dataURL;
				 
				}
				});
});

		
			</script>


 <form action="backproduct.html"  enctype="multipart/form-dat" method="post" >	
 <div class="main">
    <div class="content">
    	
    	<div class="section group">
				<div class="cont-desc span_1_of_2">
				  <div class="product-details">				
					<div class="grid images_3_of_2">
					<br><br><br>
					<p>商品编号  : <input type="text" id="productId" name="productId" value="${requestScope.product.productID}"></p>
					<p>商品名称  : <input type="text" id="productname" name="productname" value="${requestScope.product.productName}"></p>					
					
					<p>商品数量  : <input type="text" id="sales" name="sales" value="${requestScope.product.sales}"></p>
					
										
					<p>商品价格  : <input type="text" id="productprice" name="productprice"  value="${requestScope.product.price}"></p>
					<br>
					<div class="available" >
						<p>请选择产品型号 :库存${requestScope.product.stock }</p>				
					<ul>
						<li >商品类型:
							<select id="producttype" name="producttype">
							<option >${requestScope.product.productType}</option>
							<option >智能手机</option>
							<option >平板电脑</option>
							<option >笔记本</option>
							<option >台式电脑</option>
							<option >数码相机</option>
							<option >影像设备</option>
							<option >办公设备</option>
							<option >电脑手机配件</option>
							<option >外设产品</option>
							<option >网络产品</option>
							<option >文具耗材</option>
							<option >服务产品</option>
						</select></li>										
					</ul>
					<br>
					<div>
						<input type="submit" id="submit" name="submit" value="查询" />	
						<input type="submit" id="submit" name="submit" value="添加" />					
						<input type="submit" id="submit" name="submit" value="更新" />
						<input type="submit" id="submit" name="submit" value="删除" />						
					</div>		
							
					</div>				
					</div>
				<div class="desc span_3_of_2">
				  	<input id="file_upload" name="file_upload"  type="file" value="../${requestScope.product.imgPath}"/>
						<div class="image_container">
						<img id="preview" name="imgurl" width="350" height="300" src="../${requestScope.product.imgPath}">						
						
				
				 </div>
			</div>
			<div class="clear"></div>
		  </div>
		<div class="product_desc">	
			<div id="horizontalTab">
				<ul class="resp-tabs-list">
					<li>产品介绍</li>
					<li>参数规格</li>					
					<div class="clear"></div>
				</ul>
				<div class="resp-tabs-container">
					<div class="product-desc">                  	
                    	
						
						<textarea id="description" name="description"  rows="15" style="width:100%; height:100%; border:solid 1px #000000" >${requestScope.product.description}</textarea>
                       					</div>

				 <div class="product-tags">
						 <textarea id="specification" name="specification" rows="15" style="width:100%; height:100%; border:solid 1px #000000">${requestScope.product.description}</textarea>
                         			
			    </div>   
                                    
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
   </script>		
   

        </div>
				
 		</div>
 	</div>
    </div>
   </form>
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