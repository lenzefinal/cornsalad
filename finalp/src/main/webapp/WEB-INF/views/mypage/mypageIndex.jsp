<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mypageIndex</title>
<link href="/finalp/resources/css/mypage.css" rel="stylesheet">
</head>
 <body class="skin_main">
<c:import url="../header.jsp"/>

 <div id="lnb_area">
	 <div class="lnb">
		<ul> 
			<li class="on">
				<a href="mypageIndex.do" style="color:black;">내 정보<em style="color:black"></em></a>
			</li>
		</ul>
	</div>
</div>
  <div id="container" style="height:724px;">
	<div id="content" class="section_home">
		<div class="column">
			<div class="sh_group">
				<div class="sh_header">
					<h2>프로필</h2>
				</div>
				<div class="sh_content">
					<dl class="sh_lst">
					<dt class="blind">프로필 사진</dt>
					<dd class="pic_desc">
						<a href="#">
							<img style="border-radius:100%" src="https://www.artistudy.com/files/attach/images/4672/776/005/13d6061ae653f3bfbc557879b8734dd0.jpg" width="80" height="80" alt="">
							<span class="spimg img_frame"></span>
						</a>
					</dd>
					<dt class="blind">&nbsp;</dt>
					<dd class="intro_desc">&nbsp;</dd>
					<dt class="nic_tit">아이디</dt>
					<dd class="nic_desc">abcde123456</dd>
					</dl>
				</div>
			<p class="btn_area_btm"><a href="mypageModify.do" class="btn_model"><b class="btn2">수정</b></a></p>
			</div>
			<div class="sh_group">
				<div class="sh_header">
					<h2>찜</h2>
					<a href="#" class="all" style="color:#a3a3a3;">전체보기</a>
				</div>
				<div class="sh_content">
					<dl class="sh_lst2">
						<dt class="blind">찜</dt>
						<dt>프젝</dt>
						<dd>12345678901건</dd>
						<dt>공구</dt>
						<dd>x 건</dd>
					</dl>
				</div>
			</div>
		</div>
		<div class="column">
			<div class="sh_group">
				<div class="sh_header">
					<h2>현황</h2>
					<a href="#" class="all" style="color:#a3a3a3;">전체보기</a>
				</div>
				<div class="sh_content">
					<dl class="sh_lst2">
						<dt class="blind">내 현황 보기</dt>
						<dt>판매1</dt>
						<dd>x 건</dd>
						<dt>판매2</dt>
						<dd>x 건</dd>
						<dt>판매3</dt>
						<dd>x 건</dd>
						<dt>판매4</dt>
						<dd>x 건</dd>
					</dl>
				</div>
			</div>
			<div class="sh_group">
				<div class="sh_header">
					<h2>회원 탈퇴</h2>
				</div>
				<div class="sh_content">
					<div>&nbsp;</div>
					<p style="font-size:12px; font-family:Roboto;">회원 탈퇴를 원하신다면 아래 '회원 탈퇴' 버튼을 눌러주세요.</p>	
				</div>
					<p class="btn_area_btn"><a class="btn_model" href="mypageWithdrawal.do"><b class="btn3">탈퇴하기</b></a></p>
			</div>
		</div>
	</div>
  </div>
 </body>
</html>