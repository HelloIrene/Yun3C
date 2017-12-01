<!--
 Created by Eclipse.
 User: zyy
 Date: 2017年10月18日
 Time: 上午10:59:21
-->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>后台新闻列表页</title>
    <link rel="stylesheet" href="/shopping/css/reset.css" />
    <link rel="stylesheet" href="/shopping/css/content.css" />
</head>
<body marginwidth="0" marginheight="0">
<div class="container">
    
    <div class="public-content">
        <div class="public-content-header">
            <h3 style="display: inline-block;">新闻列表</h3>
            <a href="newsEdit.html">
            <input style="margin-left:829px;margin-top: 8px;" type="button" value="添加新闻" class="sub-btn">
            </a>
            
            <div class="public-content-right fr">
            </div>
        </div>
        <div class="clearfix"></div>
        
        
        <div class="public-content-cont two-col" >
            <table class="public-cont-table col-2" style="width:980px;">
                <tr style="height:49px;width:986px;">
                    <th style="width:5%">新闻ID</th>
                    <th style="width:15%">标题</th>
                    
                    <th style="width:10%">发布人</th>
                    <th style="width:15%">发布时间</th>
                    <th style="width:15%">编辑</th>
                </tr>
                
                <c:forEach items="${news}" var="newtemp">
                <tr style="height:49px;width:986px;">
                    <td>${newtemp.newID}</td>
                    <td>${newtemp.title}</td>                   
                    <td><span style="color:#6bc095">${newtemp.editor}</span></td>
                    <td><span style="color:#999">${newtemp.addTime}</span></td>
                    
                    <td>
                        <div class="table-fun">
                            
                            <a href="deleteNews.html?id=${newtemp.newID}"><input type="button" value="删除" class="sub-btn"></a> 
							<a href="updateNews.html?id=${newtemp.newID}"><input type="button" value="修改" class="sub-btn" style="margin-left:15px;"></a>
                        </div>
                    </td>
                </tr>
                </c:forEach>
                
            </table>
        </div>
        
        
    </div>
</div>
</body>
</html>