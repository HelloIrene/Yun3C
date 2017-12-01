<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<head>
<title>News</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="js/move-top.js"></script>
<script type="text/javascript" src="js/easing.js"></script>
</head>
<body>
	<div class="wrap">
		<div style="margin: auto">
			<jsp:include page="top.jsp"></jsp:include>
		</div>
		<div class="main">
			<div class="content">
				<div class="panellist">
					<div class="ipt" style="width:900px;height:1000px;position: absolute;left:180px; top:200px;">
						<h2>您所在的位置：公司新闻 >具体页面</h2>
						<div class="view_container">
							<div class="view_title">
								<span>${newsContent.title}</span>
								<h1>${newsContent.addTime}</h1>
							</div>

							<div class="view_p" >
								<div>${newsContent.lead}</div>
								<p>&nbsp;</p>
								<div class="pic">
									<img src="${newsContent.pic}" width="500px" height="350px" />
									${newsContent.content}
								</div>
							</div>
							
							
							
						</div>
					</div>

				</div>
			</div>
		</div>
		<div style="margin:auto;position: absolute;left:140px; top:1300px;">
			<jsp:include page="bottom.jsp"></jsp:include>
		</div>
		<script type="text/javascript">
			$(document).ready(function() {
				$().UItoTop({
					easingType : 'easeOutQuart'
				});

			});
		</script>
		<a href="#" id="toTop"><span id="toTopHover"> </span></a>
		<div style="display: none">
			<script src='http://v7.cnzz.com/stat.php?id=155540&web_id=155540'
				language='JavaScript' charset='gb2312'></script>
		</div>
</body>
</html>

