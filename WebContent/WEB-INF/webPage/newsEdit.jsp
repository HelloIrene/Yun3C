<!--
 Created by Eclipse.
 User: zyy
 Date: 2017年10月16日
 Time: 上午9:09:28
-->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>后台新闻编辑页</title>
    <link rel="stylesheet" href="/shopping/css/reset.css" />
    <link rel="stylesheet" href="/shopping/css/public.css" />
    <link rel="stylesheet" href="/shopping/css/content.css" />
    <link rel="stylesheet" href="/shopping/css/jquery.Jcrop.css" />
    <script src="/shopping/js/jquery.js"></script>
	<script src="/shopping/js/jquery.Jcrop.js"></script>
	<script type="text/javascript">
	var xmlHttpReq = null;
	function ajaxSubmit(){
		if(window.ActiveXObject){
			//IE浏览器
			xmlHttpReq = new ActiveXObject("Microsoft.XMLHTTP");
		}else if(window.XMLHttpRequest){
			//其他浏览器
			xmlHttpReq = new XMLHttpRequest();
		}
		if(xmlHttpReq!=null){
			var fileObj = document.getElementById("file").files[0];
			xmlHttpReq.open("POST", "../upload", true);
			//关联回调函数
			xmlHttpReq.onreadystatechange = ajaxCallBack;
			
			var form = new FormData();
            form.append("fileDesc", "hooyes");                        // 可以增加表单数据
            form.append("file", fileObj);
			//设置请求头为form表单形式
			//xmlHttpReq.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
			//真正地向服务端发送请求
			xmlHttpReq.send(form);
		}
	}
	
	
	//回调函数
	function ajaxCallBack(){
		if(xmlHttpReq.readyState == 4){
			if(xmlHttpReq.status == 200){
				var result = xmlHttpReq.responseText;
				var ss = '/shopping/'
				document.getElementById("filename").value = result;
				document.getElementById("allUrl").src = ss+result;
			}
		}
	}
</script>
</head>
<body marginwidth="0" marginheight="0" style="width: 95%;">

<div class="public-content">
    <div class="public-content-header">
        <h3>后台新闻编辑</h3>
    </div>
    
    <div class="public-content-cont" style="width:710px;">
        <form action="${requestScope.changepage}" method="post">
         <div class="form-group" style="display:none;">
        	<input type="text" id="newID" name="newID" style="display:none;" value="${news.newID}"/>
            </div>
            <div class="form-group" >
                <label for="">新闻标题</label>
                <input style="width:700px;" class="form-input-txt" type="text" name="pname" value="${news.title}" />
            </div>
            <div class="form-group" >
                <label for="">发布人</label>
                <input style="width:700px;" class="form-input-txt" type="text" name="adminname" value="${news.editor}" />
            </div>
            <div class="form-group" >
                <label for="" >新闻导语</label>
                <input style="width:700px;" class="form-input-txt" type="text" name="lead" value="${news.lead}" />
            </div>
				<div class="form-group" style="width: 705px; height: 500px;">
					<label for="">新闻内容</label>

					<textarea id="editor_id" name="content" class="specification"
						style="width: 710px; height: 460px;resize: none;" >
						${news.content}
					</textarea>

				</div>
				<div class="form-group">
					<label for="">图片上传</label>
					<div>
						<table style="width: 710px; height: 500px;">
							<tbody>
								<tr>
									<td width="20%"><span>*</span> 上传图片(201x298尺寸):</td>
									<td width="80%">注:该尺寸图片最好为201x298。</td>
								</tr>
								<tr>
									<td width="20%"><span>*</span> 选择文件预览:</td>
									<td width="80%" id="image"><img src="/shopping/${news.pic}" width="500px" height="350px" id="allUrl" />  
										<input name="pic" type="file" id="file"/>
										<input type="button" id="upload" value="上传" onclick="ajaxSubmit()"/>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<input type="text" id="filename" name="filename" style="display:none;" value="${news.pic}"/>
					
				</div>

				<div class="form-group" style="margin-left:570px;margin-top:10px;">
                <input type="submit" class="sub-btn" value="提  交" />
                <input type="reset" class="sub-btn" value="重  置" />
            </div>
        </form>
    </div>
</div>

<script src="/shopping/kingediter/kindeditor-all-min.js"></script>
<script src="/shopping/js/laydate.js"></script>
<script>
    KindEditor.ready(function(K) {
        window.editor = K.create('#editor_id');
    });
</script>
</body>


<script>

</script>
</html>