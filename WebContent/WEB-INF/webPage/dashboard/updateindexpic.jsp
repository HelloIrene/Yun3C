<%--
  Created by Eclipse.
  User: Ross
  Date: 2017年10月23日
  Time: 下午10:09:36
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet" href="/shopping/css/reset.css" />
    <link rel="stylesheet" href="/shopping/css/public.css" />
    <link rel="stylesheet" href="/shopping/css/content.css" />
    <link rel="stylesheet" href="/shopping/css/jquery.Jcrop.css" />
    <script src="/shopping/js/jquery.js"></script>
	<script src="/shopping/js/jquery.Jcrop.js"></script>
</head>
<body marginwidth="0" marginheight="0" style="width: 95%;">

<div class="public-content">
    <div class="public-content-header">
        <h3>首页推荐编辑</h3>
    </div>
    
    <div class="public-content-cont" style="width:710px;">
        <form action="updateindex" method="post">
            <div class="form-group" >
                <label for="">商品编号</label>
                <input style="width:700px;" class="form-input-txt" type="text" name="id" value="${id}" />
            </div>
            <div class="form-group" >
                <label for="">商品名</label>
                <input style="width:700px;" class="form-input-txt" type="text" name="productName" value="${name}" />
            </div>
            <div class="form-group" >
                <label for="" >主推荐语</label>
                <input style="width:700px;" class="form-input-txt" type="text" name="word" value="" />
            </div>
			<div class="form-group" >
                <label for="" >副推荐语</label>
                <input style="width:700px;" class="form-input-txt" type="text" name="fuword" value="" />
            </div>
				<div class="form-group" style="margin-left:570px;margin-top:10px;">
                <input type="submit" class="sub-btn" value="提  交" />
            </div>
        </form>
    </div>
</div>

<script src="/shopping/kingediter/kindeditor-all-min.js"></script>
<script src="/shopping/js/laydate.js"></script>
</body>
</html>