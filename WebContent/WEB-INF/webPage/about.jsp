<!--
 Created by Eclipse.
 User: zyy
 Date: 2017年10月13日
 Time: 下午3:48:08
-->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<head>
<title>关于我们</title>
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
    	<div class="section group">
				
				<div class="col_1_of_3 span_1_of_3" style="width:310px;position: absolute;left:110px; top:180px;">
					<h3>开发团队</h3>
					<img src="images/about_img.jpg" alt="">
					<p> Yun3C是云商城，旨在为商户提供强大的微商城和完整的移动零售解决方案，是一个移动零售服务商，正在新零售的潮流中激流勇进、开疆拓土，用产品技术撬动巨大的市场。Yun3C拥有世界级的 SaaS 电商解决方案，每天处理几百万订单、几亿条消息，且量级仍在不断攀升中，连接数十万开发者，大大提升了SaaS 对商家产生的价值。 </p>
					<p>宗旨以“促消费、扩内需、调结构、稳增长”为目标还有以“顾客就是上帝”为宗旨，依托电子在线品牌和服务优势，通过统一组织、统一标识、统一宣传、统一行动，开展“电子在线商城上行”活动，拟与淘宝、天猫商城、当当网等国内主流电商平台官方合作，推出越来越多的品牌企业和商家。团队还在不断成长中，欢迎更多志同道合者加入。
				</p>
				</div>
				
				
				<div class="col_1_of_3 span_1_of_3" style="width:310px;position: absolute;left:486px; top:180px;">
					<h3>网站历史</h3>
				 <div class="history-desc">
					<div class="year"><p>2017年10月12日</p></div>
					<p class="history">  举办“电子在线商城上行”活动推介会。 </p>
				 <div class="clear"></div>
				</div>
				 <div class="history-desc">
					<div class="year"><p>2017年10月15日</p></div>
					<p class="history">  举行“电子在线商城上行”官方网站上线发布会。 </p>
				 <div class="clear"></div>
				</div>
				 <div class="history-desc">
					<div class="year"><p>2017年10月18日</p></div>
					<p class="history">  电子在线商城上行II期上线完善交易环节。 </p>
				 <div class="clear"></div>
				</div>
				 <div class="history-desc">
					<div class="year"><p> 2017年10月20日 </p></div>
					<p class="history">中信银行联合电子在线商城上行推出二维码异度支付，O2O消费体验升级。 </p>
				 <div class="clear"></div>
				</div>
				<div class="history-desc">
					<div class="year"><p>2017年10月22日 </p></div>
					<p class="history"> 100家老字号、地方名特优产品、外贸品牌企业入驻“电子在线商城上行”平台。</p>
				 <div class="clear"></div>
				</div>
                <div class="history-desc">
					<div class="year"><p> 2017年10月23日  </p></div>
					<p class="history"> 电商建设三年计划顺利通过审核，电子在线商城成为无锡市政府重点打造的电商平台。 </p>
				 <div class="clear"></div>
				</div>
			</div>
			
			
				<div class="col_1_of_3 span_1_of_3" style="width:310px;position: absolute;left:812px; top:180px;">
					<h3>媒体报道</h3>
					<p>电子在线商城上线各方媒体支持</p>
				    <div class="list">
					     <ul>
					     	<li><a href="http://www.thmz.com/">太湖明珠网</a></li>
					     	<li><a href="http://www.xhby.net/">新华报业网</a></li>
					     	<li><a href="http://news.sina.com.cn/">新浪网</a></li>
					     	<li><a href="http://wuxi.fang.com/">搜房网</a></li>
					     	<li><a href="http://www.people.com.cn/">人民网</a></li>
					     	<li><a href="http://www.yangtse.com/">扬子晚报网</a></li>
					        <li><a href="http://www.sohu.com/">搜狐网</a></li>
					     	<li><a href="http://www.10086.cn/">中国移动</a></li>
					     	<li><a href="http://www.189.cn/">中国电信</a></li>
					     	<li><a href="http://www.chinaunicom.com.cn/">中国联通</a></li>
					     	
					     </ul>
					 </div>
					 <p>「电子在线商城」是一个集中展示电子在线形象、推介电子在线商城店的大型导购平台。它在政府的组织下，精选了300家天猫店、100家传统商贸企业、1万种优质电子在线产品上线，是消费者选购“电子精品”、电子品牌商家网上销售的官方平台。 </p>
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

