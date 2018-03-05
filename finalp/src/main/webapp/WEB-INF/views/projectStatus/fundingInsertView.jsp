<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<title>fundingInsertView.jsp</title>
</head>
<body>
<c:import url="/WEB-INF/views/header.jsp"/>

<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap. min.css">-->
<style>
	.project-header-title{
		margin-top: 100px;
		margin-bottom: 20px;
		text-align: center;
		text-weight: bold;
	}
	
	.project-outter-div-margin{
		display: block;
	    max-width: 100%!important;
	    
	    /* border:1px solid rgba(0,0,0,0.3);
	    border-radius: .28571429rem; */
	}
	
	@media only screen and (min-width: 1200px){
		.project-outter-div-margin {
		    width: 1071px;
		    margin-left: auto!important;
		    margin-right: auto!important;
		}
	}
	@media only screen and (max-width: 1199px) and (min-width: 992px){
		.project-outter-div-margin {
		    width: 891px;
		    margin-left: auto!important;
		    margin-right: auto!important;
		}
	}
	@media only screen and (max-width: 991px) and (min-width: 768px){
		.project-outter-div-margin {
		    width: 695px;
		    margin-left: auto!important;
		    margin-right: auto!important;
		}
	}
	@media only screen and (max-width: 767px){
		.project-outter-div-margin {
		    width: auto!important;
		    margin-left: 1em!important;
		    margin-right: 1em!important;
		}
	}
	
	.project-tap{
		margin-bottom: 20px;
		font-size: 1rem;
	}
	.project-tap-table{
		margin: auto;
	}
	
	#session-1{
		font-size: 1rem;
	}
	
	@media only screen and (max-width: 991px){
		.project-tap,
		#session-1{
			font-size: .9rem;
		}
	}
	
	.project-element-div{
		border:1px solid rgba(0,0,0,0.3);
	    border-radius: .28571429rem;
	}
	
	
</style>

<h2 class="project-header-title"> 프로젝트 등록 </h2>
<div class="project-tap project-outter-div-margin">
	<table class="project-tap-table">
	
		<tr>
			<th>프로젝트 개요</th>
			<th>프로젝트 구성</th>
			<th>설명</th>
			<th>계좌 설정</th>
		</tr>
	</table>
</div>

<div id="session-1" class="">
<div id="project-intro" class="project-div project-outter-div-margin">
	<div class="project-element-div">
		<div class="project-element-title-div">프로젝트 제목</div>
		<div class="project-element-content-div">내용을 입력하시오.</div>
	</div>
	<div class="project-element-div">
		<div class="project-element-title-div">프로젝트 카테고리</div>
		<div class="project-element-content-div">내용을 문구</div>
	</div>
	<div class="project-element-div">
		<div class="project-element-title-div">프로젝트 대표 이미지</div>
		<div class="project-element-content-div">내용을 입력하시오.</div>
	</div>
	<div class="project-element-div">
		<div class="project-element-title-div">프로젝트 문구</div>
		<div class="project-element-content-div">내용을 입력하시오.</div>
	</div>
</div>
</div>


<c:import url="/WEB-INF/views/footer.jsp"/>
</body>
</html>