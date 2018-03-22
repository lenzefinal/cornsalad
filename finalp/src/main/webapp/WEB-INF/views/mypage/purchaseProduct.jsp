<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구매한 공동구매</title>
<style>
	td{
		font-size:13px;
	}
	td img{
		width:200px;
		height:200px;
	}
	.limg{
		width:230px;
	}
	td:nth-child(3){
		width:180px;
		text-align:center;
	}
	
	div#container{
		height:900px;
	}
	.btn_more {
	    font-weight: 600;
	    line-height: 14px;
	    display: block;
	    overflow: hidden;
	    width: 45px;
	    height: 15px;
	    margin: 0 auto;
	    vertical-align: top;
	    text-decoration: underline;
	    letter-spacing: -1px;
	    color: #666;
	   	font-size:14px;
	   	cursor:pointer;
	}
	div.display-none{
		display:none;
	}
</style>
</head>
 <body class="skin_main">
<c:import url="mypageStatusHeader.jsp"/>
<c:import url="mypageStatusSide.jsp"/>
<div id="container">
		<div id="content" class="section_home" >
			<input type="hidden" id="memberId" value="${loginUser.member_id }"/>
			
			<div class="c_header">
				<h2>찜한 프로젝트</h2>
				<p class="contxt">내가 펀딩한 프로젝트를 확인할 수 있어요.</p>
			</div>
		</div>
		<div id="list">
			<input type="text" style="margin-left:2%" id="project_name" name="project_name" placeholder="프로젝트 명으로 검색"/>
			<table class="tbl_type" cellspacing="0" border="1">
			</table>
		</div>
		<div id="load" class="display-none" style="text-align:center;"><img src="resources/images/loadImg.gif" style="width:20%; height:20%;"></div>
		<div id="result" style="text-align:center;"></div>
	</div>
</body>
</html>