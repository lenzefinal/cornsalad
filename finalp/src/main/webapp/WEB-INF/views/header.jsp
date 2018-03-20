<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>header.jsp</title>
  
<style>
	.main-color-cornsalad {
		color: #F7D358;
	}
	.main-backgroundcolor-cornsalad {
		background-color: #F3F781;
	}
</style>

<style>
	a {	
		text-decoration: none;
		color: inherit;
	}
	ol, ul {
		list-style: none;
	}
	body, button, input, select, textarea {
		font-family: Roboto,Noto Sans KR,-apple-system,Dotum,sans-serif;
		font-weight: 400;
	}
	button {
		border-radius: 0;
		cursor: pointer;
	}
	em, i {
		font-style: normal;
	}

	#wadizHeader {
		position: relative; 
		border: none;	
		border-radius: 0; 
		z-index: 999; 
		font-family: Roboto,"Noto Sans KR",sans-serif; 
		/* -webkit-font-smoothing: antialiased;-moz-osx-font-smoothing: grayscale;*/
	} 
	#headerBar {
		/* position: relative;	 */
		position:fixed;
		background: #fff; 
		height: 48px; 
		width: 100%; 
		box-shadow: 0 1px 0 0 rgba(0, 0, 0, 0.08); 
		z-index: 999;
		top:0;
	}
	#headerBar .left-section { 
		width: 100%;	
		height: 100%; 
		text-align: left;
	}
	#headerBar .left-section .btn-gnb-open { 
		display: inline-block;	
		padding: 0 14px; 
		height: 100%; 
		cursor: pointer;	
		padding-left: max(14px, env(safe-area-inset-left));	
	}
	#headerBar .left-section h1 {
		height: 100%;
	}
	#headerBar .left-section h1 svg {
		width: 42px;
		height: 48px;
		vertical-align: middle;
	}
	#headerBar .left-section h1 i {
		display: inline-block;
		font-size: 16px;
		line-height: 48px;
		vertical-align: middle;
		-webkit-transition-property: all;
		transition-property: all;
		-webkit-transition-duration: .2s;
		transition-duration: .2s;
		-webkit-transition-delay: 0s;
		transition-delay: 0s;
		transition-timing-function: ease-out;
	}
	
	.icon-expand-more:before, 
	i.wadizicon.wa-expand-more:before {
		content: "\E94E";
	}
	[class*=icon-]:before, i.wadizicon {
		display: inline-block;
		margin-top: -.2em;
		vertical-align: middle;	
		text-transform: none;
		line-height: 1;
		font-family: wadizicon!important;
		font-weight: 400;
		font-style: normal;
		font-variant: normal;
		speak: none;
		-webkit-font-smoothing: antialiased;
		-moz-osx-font-smoothing: grayscale;
	}

	#FbwGnb {
		display: none;
		height: 100%;
	}
	#headerBar .gnbsub-menu, 
	#headerBar .menu-list, 
	#headerBar .menu-list ul, 
	#headerBar .menu-list li {
		display: block;
		height: 100%;
	}
	
	#headerBar .right-section {
		position: absolute;
		right: 0;
		top: 0;
		padding-right: 16px;
		text-align: right;
		padding-right: max(16px, env(safe-area-inset-right));
	}
	#headerBar .right-section 
	.util-menu.pc-only {
		display: none;
	}
	#headerBar .right-section .util-menu {
		display: inline-block;
		padding: 0;
		height: 48px;
	}
	#headerBar .right-section .util-menu li {
		display: inline-block;
		padding-left: 16px;
		height: 48px;
	}
	#headerBar .right-section .util-menu li a {
		font-size: 15px;
		display: inline-block;
		letter-spacing: -.02em;
		font-weight: 400;
		line-height: 48px;
		color: #44484b;
	}
	#headerBar .right-section .util-menu li.event {
		display: none;
	}
	#headerBar .right-section .util-menu li.point a {
		color: #F7D358;
	}
	#headerBar .right-section .btn-search {
		display: inline-block;
		height: 48px;
		padding: 0 0 0 8px;
		margin-right: -16px;
		vertical-align: middle;
		background: none;
		border: none;
	}	
	
	#headerBar .right-section .btn-search i {
		font-size: 20px;
		padding: 14px;
	}

	.icon-search:before, 
	i.wadizicon.wa-search:before {
		content: "\E9B5";
	}
	[class*=icon-]:before, 
	i.wadizicon {
		display: inline-block;
		margin-top: -.2em;
		vertical-align: middle;
		text-transform: none;
		line-height: 1;
		font-family: wadizicon!important;
		font-weight: 400;
		font-style: normal;
		font-variant: normal;
		speak: none;
		-webkit-font-smoothing: antialiased;
		-moz-osx-font-smoothing: grayscale;
	}
	#headerBar .right-section #headSearchForm {
		position: relative;
		display: inline-block;
		vertical-align: middle;
		width: 0;
		overflow: hidden;
		margin-left: 5px;
		padding: 5px 0;
		transition-property: all;
		transition-duration: .2s;
		-webkit-transition-delay: 0s;
		transition-delay: 0s;
		transition-timing-function: ease-out;
	}
	#headerBar .right-section #headSearchForm:after {
		position: absolute;
		left: 50%;
		width: 0;
		bottom: 0;
		border-bottom: 1px solid #aaa;
		content: '';
		clear: both;
		transition: left .2s, width .2s;
		transition-delay: .3s;
	}
	#headerBar .right-section .search-text {
		font-size: 14px;
		height: 20px;
		width: 150px;
		line-height: 20px;
		color: #1d2129;
		background: none;
		border: none;
		outline: none;
		-webkit-appearance: none;
		-moz-appearance: none;
		appearance: none;padding: 0;
		position: relative;
	}
	#globalSubNavWrap {
		display: none;
	}
	.icon-close:before, 
	i.wadizicon.wa-close:before {
		content: "\E939";
	}
	.btn-mynews-popup-close, 
	.btn-gnbsub-close {
		position: fixed;
		top: 0;
		left: 0;
		width: 100%;
		height: 100%;
		height: 100vh;
		background: rgba(0,0,0,0);
		cursor: pointer;
		-webkit-transition-property: all;
		transition-property: all;
		-webkit-transition-duration: .2s;
		transition-duration: .2s;
		-webkit-transition-delay: 0s;
		transition-delay: 0s;
		transition-timing-function: ease-out;
		visibility: hidden;
		opacity: 0;
	}
	#globalNavOpener:checked ~ #globalNavWrap {	
		top: 0px;
	}
	#globalNav .menu-list ul.end {
		border-bottom: none;
	}
	#headerBar img#bimg{
		width: 5px;
		height: 5px;
	}
	
	#globalNavWrap{position:fixed;top:-100%;top:-100vh;left:0;width:100%;height:100%;height:100vh;background:#fff;overflow-y:auto;-webkit-transition-property:all;transition-property:all;-webkit-transition-duration:.3s;transition-duration:.3s;-webkit-transition-delay:0s;transition-delay:0s;transition-timing-function:ease-out;/*z-index:1000*/;-webkit-overflow-scrolling:touch}
	#globalNav{padding: 64px 24px;padding-left:max(24px, calc(env(safe-area-inset-left) + 8px));padding-right:max(24px, calc(env(safe-area-inset-right) + 8px))}
	#headerBar ~ #globalNavWrap #globalNav{/*padding-top: 119px;*/}
	#globalNav .menu-list ul{margin-bottom:8px;padding:7px 0 8px;border-bottom:1px solid #E6EAED}
	#globalNav .menu-list ul.end{border-bottom:none}
	#globalNav .menu-list li{height:48px;}
	#globalNav .menu-list li a{display:block;font-size:17px;font-weight:300;line-height:48px;color:#44484b}
	#globalNav .menu-list li.active a{color:#00b383}
	#globalNavOpener {display: none;}
	#globalNavOpener:checked ~ #globalNavWrap {top:0px;}
	#globalNavOpener:checked ~ .contents {width:100%;}
	#globalNavOpener:checked ~ #headerBar h1 i{transform:rotate(180deg);}
	#globalSubNavWrap{display:none}
	#globalSubNavOpener{display:none;}
	.btn-mynews-popup-close,
	.btn-gnbsub-close{position:fixed;top:0;left:0;width: 100%;height:100%;height:100vh;background:rgba(0,0,0,0);cursor:pointer;-webkit-transition-property: all;transition-property: all;-webkit-transition-duration: .2s;transition-duration: .2s;-webkit-transition-delay: 0s;transition-delay: 0s;transition-timing-function:ease-out;visibility: hidden;opacity: 0;}
	.btn-rnb-close{position:fixed;top:0;right:0;width:100%;height:100%;height:100vh;background:rgba(0,0,0,0);cursor:pointer;-webkit-transition-property: all;transition-property: all;-webkit-transition-duration: .2s;transition-duration: .2s;-webkit-transition-delay: 0s;transition-delay: 0s;transition-timing-function:ease-out;visibility: hidden;opacity: 0;}
	

	.opened-nav{overflow-y:scroll}
	.opened-nav body{position:fixed;width:100%;top:0}


	@media screen and (min-width: 1080px){

		#headerBar {
			height: 56px;
			top:0;
		}
		#MowGnb {
			display: none;	
		}
		#FbwGnb {	
			display: block;
		}
		#headerBar .gnbsub-menu {
			width: 100%;
		}
		#headerBar .gnbsub-menu:after {
			content: "";
			clear: both;
			display: block;	
		}
		#headerBar .gnbsub-menu h1 {
			float: left;
			height: 100%;
			padding: 0 40px 0 24px;
		}
		#headerBar .gnbsub-menu h1 svg {
			width: 97px;
			height: 56px;
		}
		#headerBar .gnbsub-menu .menu-list {
			height: 100%;
		}
		#headerBar .gnbsub-menu .menu-list li {
			display: inline-block;
			vertical-align: middle;
		}
		#headerBar .gnbsub-menu .menu-list li a,
		#headerBar .gnbsub-menu .menu-list li .btn-more-gnbsub em {
			position: relative;
			display: inline-block;
			padding: 0 8px;
			height: 100%;
			line-height: 56px;
			vertical-align: middle;
			letter-spacing: -.02em;
			font-size: 15px;
			font-weight: 400;
			color: #44484b;
			border-bottom: 2px solid transparent;
			transition: all 0.2s ease-out;
			box-sizing: border-box;
		}
		#headerBar .gnbsub-menu .menu-list li .btn-more-gnbsub {
			cursor: pointer;
			margin: 0;
		}
		#headerBar .gnbsub-menu .menu-list li .btn-more-gnbsub em:before, 
		#headerBar .gnbsub-menu .menu-list li .btn-more-gnbsub em:after {
			transition: opacity .2s ease-out;
		}
		#headerBar .gnbsub-menu .menu-list li .btn-more-gnbsub em:after {
			position: absolute;
			left: 8px;
			content: "접기";
			opacity: 0;
		}

		#headerBar .right-section {
			padding-right: 24px;
		}
		#headerBar .right-section .util-menu.pc-only {
			display: inline-block;
		}
		#headerBar .right-section .util-menu, 
		#headerBar .right-section .util-menu li {
			height: 56px;
		}
		#headerBar .right-section .util-menu li a {
			line-height: 56px;
		}
		#headerBar .right-section .util-menu li.event {
			display: inline-block;
		}

		#headerBar .gnbsub-menu .menu-list li.active a, 
		#headerBar .gnbsub-menu .menu-list li a:hover {
			border-color: #F3F781;
		}
		#headerBar .gnbsub-menu .menu-list li .btn-more-gnbsub em:before, 
		#headerBar .gnbsub-menu .menu-list li .btn-more-gnbsub em:after {
			transition: opacity .2s ease-out;
		}

		#globalSubNavOpener:checked ~ #globalSubNavWrap {
			top: 56px;	
		}
		#headerBar ~ #globalSubNavWrap {
			top: -295px;
			height: auto;
			padding-top: 56px;
		}
		#globalSubNavWrap {
			position: fixed;
			top: -240px;
			left: 0;
			display: block;	
			width: 100%;
			height: 240px;
			background: #fff;	
			-webkit-transition-property: all;
			transition-property: all;
			-webkit-transition-duration: .2s;
			transition-duration: .2s;
			-webkit-transition-delay: 0s;
			transition-delay: 0s;
			transition-timing: ease-in;	
			transition-timing-function: ease-out;
			z-index: 1000;	
		}
		#headerBar ~ #globalNavWrap #globalNav {
			padding-top: 119px;
		}
		#globalSubNavWrap .btn-close {
			position: absolute;
			right: 24px;
			top: 24px;
			cursor: pointer;
		}		
		#globalSubNavWrap .btn-close i {
			font-size: 20px;
			color: #44484b;
			font-weight: 500;
		}
		#globalNav {
			padding: 64px 24px;	
			padding-left: max(24px, calc(env(safe-area-inset-left) + 8px));
			padding-right: max(24px, calc(env(safe-area-inset-right) + 8px));
		}
		#globalSubNav {	
			padding-left: 168px;
		}
		#globalSubNav .menu-list {
			width: 100%;
		}
		#globalSubNav .menu-list:after {
			content: "";
			clear: both;
			display: none;
		}
		#globalSubNav .menu-list ul {
			float: left;
			width: 140px;
			padding: 28px 20px 16px 0;
		}
		#globalSubNav .menu-list ul li.title {
			margin-bottom: 16px;
			font-size: 13px;
			line-height: 18px;
			font-weight: 400;
			letter-spacing: -.02em;
			color: #90949c;
		}
		#globalSubNav .menu-list ul li {	
			margin-bottom: 16px;
		}
		#globalSubNav .menu-list ul li a {
			font-size: 13px;
			font-weight: 400;
			letter-spacing: -.02em;
			line-height: 18px;
			color: #44484b;
		}

		#headerBar .gnbsub-menu .menu-list li .btn-more-gnbsub em:before {
			content: "더보기";
			transition-timing-function: ease-out;
			transition-duration: .2s;
			transition-property: opacity;
		}
		#headerBar .gnbsub-menu .menu-list li .btn-more-gnbsub em:before, 
		#headerBar .gnbsub-menu .menu-list li .btn-more-gnbsub em:after {
			transition: opacity .2s ease-out;
		}

		#globalSubNavOpener:checked ~ .btn-gnbsub-close {
			-webkit-transition-property: all;
			transition-property: all;	
			-webkit-transition-duration: .2s;
			transition-duration: .2s;
			transition-timing-function: ease-out;
			background: rgba(0,0,0,.5);
			visibility: visible;opacity: 1;
			z-index: 1000;
		}

		#globalSubNavOpener:checked ~ #globalSubNavWrap {
			top: 56px;
		}
		#headerBar ~ #globalSubNavWrap {
			top: -295px;
			height: auto;
			padding-top: 56px;
		}
		
		/* 관리자 알림 스타일 */
		#headerBar img#bimg{
			width: 20px;
			height: 20px;
		}
		#headerBar div#alarmbox{
			width:350px;
			height: 153px;
			display:none;
			border:1px solid #BDBDBD;
			border-radius:3px;
			background-color: white;
			margin-left: 60px;
			box-shadow: 1px 1px #212121;
		}
		#headerBar ul#alarmul{
			color: black;
		}
		#headerBar div#alarmbox li#lidd{
			width: 350px;
			height: 50px;
			font-family:"맑은 고딕";
			border-radius:3px;
			border-bottom:1px solid #BDBDBD;
			font-size: 15px;
		}
		#headerBar div#alarmbox a.alarmlia{
			display:table-cell;
			display: block;
			floar:left;
			width: 350px;
			line-height: 50px;
			color: black;
		}
		#headerBar div#alarmbox a.alarmlia:hover{
			background-color: #D5D5D5;
		}
		
	}/* end @media screen and (min-width: 960px)*/

	article, blockquote, body, dd, div, dl, dt, h1, h2, h3, h4, html, li, main, ol, p, section, table, tbody, td, th, thead, tr, ul {
		margin: 0;
		padding: 0;
	}
  </style>
  <link rel="stylesheet" href="/finalp/resources/css/bootstrap.min.css">
  <link rel="stylesheet" href="http://cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
  <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
 <!--  <script type="text/javascript" src="/finalp/resources/js/vendor.js"></script> -->
 	<!-- <script type="text/javascript" src="https://cdn.wadiz.kr/resources/assets/base.js?991cc506282739c2e8f8"></script> -->
  <!-- <script type="text/javascript" src="/finalp/resources/js/wMotion.js"></script> -->
  
   <!-- 관리자 알림 스크립트 -->
  <script type="text/javascript" src="/finalp/resources/js/jquery-3.3.1.min.js"></script>
  <script type="text/javascript">
	$(function(){
		/* $("#alarmbox").hide(); */
		var flag="true";
		$("#bimg").click(function(){
			if(flag == "true"){
				$("#bimg").attr('src','/finalp/resources/images/adminimage/bell.png');
					$.ajax({
						url:"adminAalarm.do",
						type: "post",
						dataType: "json",
						success:function(data){
							console.log("data : "+ data);
							$("#alarmbox").empty();
							$("#alarmbox").html(
								"<ul id='alarmul'><a class='alarmlia' href='adminReport.do'><li id='lidd'>"+
								 "신고회원이 "+ data.reportcount +"명 있습니다.</li></a>"+
								  "<a class='alarmlia' href='adminProject.do'><li id='lidd'>프로젝트 승인 신청이"+
								  data.projectcount + "건 있습니다.</li></a><a class='alarmlia' href='adminQuestion.do'><li id='lidd'>"+
								  "답변하지 않은 문의글이"+ data.questioncount+"개있습니다.</li></a></ul>"
							);
							
							$("#alarmbox").show();
							flag="false";
						},
						error: function(request, status, errorData){
							alert("error code : " + request.status + "\n" 
									+ "message : " + request.responseText + "\n"
									+ "error : " + errorData );	
						}
					});
		} else if(flag=="false") {
				$("#bimg").attr('src','/finalp/resources/images/adminimage/bell1.png');
				$("#alarmbox").hide();
				flag="true";
		}
		});
	});
	
 </script>
  
 </head>
<body>

<!-- <script type="text/javascript" src="/finalp/resources/js/common.js"></script>
<script type="text/javascript" src="https://cdn.wadiz.kr/resources/assets/vendor.js"></script> -->
<!-- <header> -->
<script type="text/javascript">
  (function($) {
	  var $window = $(window);
	  var $html = $(document.documentElement);
	  var $body;
	  // dom ready
	  $(document).ready(function(){
	    $body = $(document.body);
	
	    // Header
	    var navCheckbox = $("#globalNavOpener");
	    $html = $(document.documentElement);
	    navCheckbox.on('change', function(){
	      if(navCheckbox.is(":checked")) {
	        $html.addClass('opened-nav');
	      }else{
	        $html.removeClass('opened-nav');
	      }
	    });
	  }); // dom ready

  })(jQuery);
  
    </script>

<div id="wadizHeader">
	<input type="checkbox" id="globalNavOpener">
	<div id="headerBar">
	  <div class="left-section">
		<!-- MOW GNB -->
		<div id="MowGnb" class="device-gnb">
		  <label class="btn-gnb-open" for="globalNavOpener">
			<h1>
			  <img src=""> <!-- 태블릿 이하일 경우 로고 적용 부분 -->
			  <i class="icon-expand-more"></i>
			</h1>
		  </label>
		</div>

		<div id="FbwGnb" class="device-gnb">
		  <div class="gnbsub-menu">
			<h1>
				<a href="home.do"><img src="/finalp/resources/images/logo.png" style="width:120px;height:50px;"></a> <!-- PC일 경우 로고 적용 부분 -->
			</h1>
			<div class="menu-list">
			  <ul>
				<li><a href="projectlist.do">프로젝트</a></li>
				<li><a href="projectdetail.do">공동구매</a></li>
				<li><a href="blist.do">오픈예정</a></li>
			  </ul>
			</div>
		  </div>
		</div>
	  </div>

	  <div class="right-section">
		<ul class="util-menu pc-only">
		<c:if test="${ !empty loginUser }">
			<li><a href="projectInsertGuideView.do" onclick="gaEvt.send('webgnb', 'btn_page_makeproject', '펀딩오픈 신청하기', '');">물품 등록하기</a></li>
		</c:if>
			<li><a href="/web/fthelpCenter" target="_blank">이용가이드</a></li>
		</ul>
		
		  <ul class="util-menu">
		  <c:if test="${ empty loginUser }">
		  	<li class="point"><a id="loginBtn" href="#" data-toggle="modal" data-target="#login-modal">로그인</a></li>
			<li class="point"><a href="enroll.do">회원가입</a></li>
		  </c:if>
		  <c:if test="${ !empty loginUser }">
		  	<li class="point"><a href="#">${ loginUser.member_name }</a></li>
		  	<li class="point"><a id="logoutBtn" href="logout.do">로그아웃</a></li>
		  		<c:if test="${ loginUser.member_id eq 'admin' }">
		  			<li class="point"><img id="bimg" src="/finalp/resources/images/adminimage/bell1.png" /></li>	
		  			<li class="point"><a href="adminMain.do" >관리자페이지</a></li>
		  		</c:if>
		  		<c:if test="${ loginUser.member_id ne 'admin' }">
		  			<c:url var="mypageIndex" value="mypageIndex.do">
		  				<c:param name="member_id" value="${loginUser.member_id }"/>
		  			</c:url>
		  			<li class="point"><a href="${mypageIndex }" onclick="">마이페이지</a></li>
		  		</c:if>
		  </c:if>
		  </ul>
		  
<!-- 관리자 알람 div	 -->  
<div id="alarmbox" >
		 <ul id="alarmul">
		<!--  <a class="alarmlia" href="adminReport.do"><li id="lidd">신고회원이 3명 있습니다.</li></a>
		  <a class="alarmlia" href="adminProject.do"><li id="lidd">프로젝트 승인 신청이 5건 있습니다.</li></a>
		  <a class="alarmlia" href="adminQuestion.do"><li id="lidd">답변하지 않은 문의글이 4개있습니다.</li></a>  -->
		</ul>
</div>
		  
		  <%-- <c:import url="/WEB-INF/views/member/loginModal.jsp"/> --%>
		
		<!-- <button class="btn-search"><i class="icon-search"></i></button>
		<form id="headSearchForm" action="/web/wcampaign/search" method="get">
			<input type="search" name="keyword" id="headSearchInput" class="search-text" placeholder="프로젝트 검색하기"></form> -->
       
	  </div>
	</div>
	
	<!-- 03/08 추가 테스트 반응형 1080보다 작을 경우 로고 클릭시 서브 메뉴 아래로 출력 -->
	<div id="globalNavWrap">
		<nav id="globalNav">
			<div class="menu-list">
				<ul>
					<li><a href="#">홈</a></li>
					<li><a href="projectlist.do">프로젝트</a></li>
					<li><a href="#">공동구매</a></li>
					<li><a href="#">물품등록하기</a></li>
				</ul>
				<ul>
					<li><a href="#">공지사항</a></li>
					<li><a href="#">나눔게시판</a></li>
					<li><a href="#">문의하기</a></li><!-- 
					<li><a href="#">와디즈 파트너</a></li>
					<li><a href="#">성공 프로젝트</a></li> -->
				</ul>
				<ul>
					<li><a href="#" onclick="">앱 다운로드</a></li>
           			<li><a href="#">이벤트</a></li>
					<li><a href="fundingInsertView.do" onclick="gaEvt.send('webgnb', 'btn_page_makeproject', '펀딩오픈 신청하기', '');">펀딩오픈 신청하기</a></li>
				</ul>
				<ul class="end">
					<li><a href="#" target="_blank">이용가이드</a></li>
				</ul>
			</div>
		</nav>
	</div>
	<label class="btn-gnbsub-close" for="globalSubNavOpener"></label>
	<!-- 03/08 끝 -->
</div>
<!-- 
<div id="header-in">
<hr>
<h1>header</h1>
<hr>
</div> -->

<!-- </header> -->
	
	<!-- 로그인 modal -->
	<link href="/finalp/resources/css/modalcss/loginModal.css" rel="stylesheet">
	
    <div class="modal fade" id="login-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none; z-index:9999;">
 		<div class="modal-dialog">
			<div class="loginmodal-container">
				<a data-dismiss="modal" style="margin-left:90%;"><i class="xi-close-thin xi-2x"></i></a>
				<h1>Login</h1><br>	
			 	<form action="login.do" method="post">
					<input type="text" name="member_id" placeholder="Id">
					<input type="password" name="member_pwd" placeholder="Password">
					<input type="submit" name="login" class="login loginmodal-submit main-backgroundcolor-cornsalad" value="Login">
			  	</form>
				
				<div class="login-help">
					<a href="logout.do">회원가입</a> - <a href="#" data-toggle="modal" data-target="#searchPwd-modal" onclick="test();">비밀번호 찾기</a> 
				</div>
			</div>
		</div>
	</div>

	<!-- 비밀번호 찾기 modal -->
	<div class="modal fade" id="searchPwd-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="static" style="display: none; z-index:9999;">
	 	<div class="modal-dialog">
			<div class="loginmodal-container">
				<a data-dismiss="modal" style="margin-left:90%;"><i class="xi-close-thin xi-2x" onclick="location.href='/doubleb/index.jsp'"></i></a>
				<h1>비밀번호 찾기</h1><br>
			 	<form action="#" method="post">
					<input type="text" name="email" placeholder="Email">
					<input type="submit" name="login" class="login loginmodal-submit" value="보내기">
				
			  	</form>
			  	<p>E-mail 주소로 임시 비밀번호가 발송 됩니다.<br>
					로그인 후 비밀번호를 바꿔주세요.</p>
			</div>
		</div>
	</div>
</body>
</html>