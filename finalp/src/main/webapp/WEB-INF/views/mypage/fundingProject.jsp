<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>펀딩한 프로젝트</title>
<style>
	td img{
		width:100px;
	}
	.limg{
		width:160px;
	}
	td:nth-child(3){
		width:180px;
		text-align:center;
	}
	.ltitle{
		width:500px	;
	}
	tr:nth-child(n+4){
		display:none;
	}
</style>
</head>
 <body class="skin_main" style="height:724px;">
<c:import url="mypageStatusHeader.jsp"/>
<c:import url="mypageStatusSide.jsp"/>

	<div id="container" >
		<div id="content" class="section_home">
			<div class="c_header">
				<h2>펀딩한 프로젝트</h2>
				<p class="contxt">내가 펀딩한 프로젝트를 확인하실 수 있어요.</p>
			</div>
		</div>
			
		
		<div id="list">
		<input type="text" style="margin-left:2%" id="project_name" name="project_name" placeholder="제목으로 검색"/>
			<table class="tbl_type" cellspacing="0" border="1">
			</table>
		</div>
		<div id="result" style="text-align:center;"></div>
 	
</body>
</html>