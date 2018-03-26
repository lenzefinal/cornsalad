<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이 페이지</title>
</head>
 <body class="skin_main">
<c:import url="mypageIndexHeader.jsp"/>
  <div id="container" style="height:724px;">
  <br>
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
						<c:if test="${empty member.profile_img_oriname }">
							<img src="resources/images/mypageProfiles/defaultProfile.jpg" style="width:80px; height:80px; border-radius:100%" /><br>
						</c:if>
						<c:if test="${not empty member.profile_img_oriname }">
							<img src="resources/images/mypageProfiles/${member.profile_img_rename }" style="width:80px; height:80px; border-radius:100%"/><br>
						</c:if>
						<span class="spimg img_frame"></span>
					</dd>
					<dt class="blind">&nbsp;</dt>
					<dd class="intro_desc">&nbsp;</dd>
					<dt class="nic_tit">아이디</dt>
					<dd class="nic_desc">${loginUser.member_id}</dd>
					</dl>
				</div>
				<c:url var="modify" value="mypageModify.do">
					<c:param name="member_id" value="${loginUser.member_id }"/>
				</c:url>
			<p class="btn_area_btm"><a href="${modify }" class="btn_model"><b class="btn2">수정</b></a></p>
			</div>
			
			<div class="sh_group">
				<div class="sh_header">
					<h2>찜</h2>
					<c:url var="myLikes" value="projectLikes.do">
						<c:param name="member_id" value="${loginUser.member_id }"/>
					</c:url>
					<a href="${myLikes }" class="all" style="color:#a3a3a3; text-decoration:underline;">전체보기</a>
				</div>
				<div class="sh_content">
					<dl class="sh_lst2">
						<dt class="blind">찜</dt>
						<dt>프로젝트</dt>
						<dd>${lprojectCount } 건</dd>
						<dt>공동구매</dt>
						<dd>${lproductCount } 건</dd>
						
					</dl>
				</div>
			</div>
		</div>
		<div class="column">
			<div class="sh_group">
				<div class="sh_header">
					<h2>현황</h2>
					<c:url var="myStatus" value="myProject.do">
						<c:param name="member_id" value="${loginUser.member_id }"/>
					</c:url>
					<a href="${myStatus }" class="all" style="color:#a3a3a3; text-decoration:underline;">전체보기</a>
				</div>
				<div class="sh_content">
					<dl class="sh_lst2">
						<dt class="blind">내 현황 보기</dt>
						<dt>등록한 프로젝트</dt>
						<dd>${projectCount} 건</dd>
						<dt>펀딩한 프로젝트</dt>
						<dd>${fprojectCount } 건</dd>
						<dt>등록한 공동구매</dt>
						<dd>${productCount } 건</dd>
						<dt>구매한 공동구매</dt>
						<dd>${pproductCount } 건</dd>
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
