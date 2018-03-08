<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Withdrawal</title>
<link href="/finalp/resources/css/mypage.css" rel="stylesheet">
<style type="text/css">
	.dtitle {
		width: 145px;
	}
	@media ( max-width : 320px ) and (min-width: 0) {
		.dtitle {
			width: 13%;
		}
	}
	@media ( max-width : 1080px ) and (min-width: 0) {
		.dtitle {
			width: 20%;
		}
	}
	.dropout {
		font-size: 12px;
		margin-top: 59px;
		margin-bottom: 0 !important;
		padding-left: 13px;
		color: #333;
	}
	
	.btn0{
		width:80px;
		height:40px;
		text-align:center;
	    background-color: #f5f6f8;
	    color: gray;
	    border: 2px solid #F7D358; 
	    -webkit-transition-duration: 0.4s;
   		transition-duration: 0.4s;
   		font-size:14px;
   		font-family: NanumGothic, 'Malgun Gothic', Dotum, Helvetica,
		'Apple SD GothicNeo', Sans-serif;
   		line-hieght:10px;
	}
	.btn0:hover{
		color:white;
		background-color:#F7D358;
	}
</style>
</head>
<body class="skin_main">
<c:import url="../header.jsp"/>
 <div id="lnb_area">
	 <div class="lnb">
		<ul> 
			<li class="on">
				<a href="mypageIndex.do" style="color:black;">내 정보<em style=""color:black"></em></a>
			</li>
		</ul>
	</div>
</div>
  <div id="container">
 	 <div id="content">
  		<div class="c_header">
			<h2>탈퇴 안내</h2>
			<p class="contxt" style="font-size:12px">정말 탈퇴 하시려고요?<br>회원탈퇴를 진행하기 전에 아래의 안내 사항을 꼭 확인해주세요.</p>
		</div>
		<div class="section_delete">
			<ul>
				<li class="dropout"><b>탈퇴 후 회원님의 <s>개인정보는 모두 삭제 처리</s> 됩니다.</b></li>
				<li class="dropout_dsc">현재 등록한 프로젝트나 공동구매 상품이 있다면 1:1문의를 통해 문의 후 회원 탈퇴를 진행해주시기 바랍니다.</li>
			</ul>
			<table class="tbl_type" cellspacing="0" border="1">
				<tr><th class="dtitle">회원정보</th><td>아이디, 비밀번호, 이메일, 이름, 계좌와 관련된 모든 정보</td></tr>
				<tr><th class="dtitle">프로젝트</th><td>등록한 프로젝트, 펀딩중인 프로젝트, 찜한 프로젝트</td></tr>
				<tr><th class="dtitle">공동구매</th><td>등록한 공동구매 상품, 구매한 공동구매 상품, 찜한 공동구매 상품</td></tr>
			</table>
			<div class="dropout_agree_area">
				<ul>
					<li class="dropout"><input type="checkbox"><b>&nbsp;위의 유의사항을 모두 확인하였으며, 이에 동의하고 회원 탈퇴 절차를 진행합니다.</b></li>
					<li style="margin-top:3%; margin-left:40%"><button type="submit" class="btn0"><b>탈퇴하기</b></button></li>
				</ul>
			</div>
		</div>
 	 </div>
  </div>
</body>
</html>