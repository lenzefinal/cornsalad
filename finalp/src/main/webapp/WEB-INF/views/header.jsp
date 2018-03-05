<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>header.jsp</title>
</head>

<style>
	.main-color-cornsalad {
		color: #F7D358;
	}
	.main-backgroundcolor-cornsalad {
		background-color: #F7D358;
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
		z-index: 10000; 
		font-family: Roboto,"Noto Sans KR",sans-serif; 
		/* -webkit-font-smoothing: antialiased;-moz-osx-font-smoothing: grayscale;*/
	} 
	#headerBar {
		position: relative;	
		background: #fff; 
		height: 48px; 
		width: 100%; 
		box-shadow: 0 1px 0 0 rgba(0, 0, 0, 0.08); 
		z-index: 10000;
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
	
	

	input[type="button" i], 
	input[type="submit" i], 
	input[type="reset" i], 
	input[type="file" i]::-webkit-file-upload-button, 
	button {
		padding: 1px 6px;
	}
	input[type="button" i], 
	input[type="submit" i], 
	input[type="reset" i], 
	input[type="file" i]::-webkit-file-upload-button, 
	button {
		align-items: flex-start;
		text-align: center;
		cursor: default;
		color: buttontext;
		background-color: buttonface;
		box-sizing: border-box;
		padding: 2px 6px 3px;
		border-width: 2px;
		border-style: outset;
		border-color: buttonface;
		border-image: initial;
	}
	input, textarea, select, button {
		text-rendering: auto;
		color: initial;
		letter-spacing: normal;
		word-spacing: normal;
		text-transform: none;
		text-indent: 0px;	
		text-shadow: none;
		display: inline-block;
		text-align: start;
		margin: 0em;
		font: 400 13.3333px Arial;
	}
	input, textarea, select, button, meter, progress {
		-webkit-writing-mode: horizontal-tb;
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




	@media screen and (min-width: 960px){

		#headerBar {
			height: 56px;
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
	}/* end @media screen and (min-width: 960px)*/

	article, blockquote, body, dd, div, dl, dt, h1, h2, h3, h4, html, li, main, ol, p, section, table, tbody, td, th, thead, tr, ul {
		margin: 0;
		padding: 0;
	}
  </style>

<body>
<header>


<div id="wadizHeader">

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
				<img src="/finalp/resources/images/logo.png" style="width:120px;height:50px;"> <!-- PC일 경우 로고 적용 부분 -->
			</h1>
			<div class="menu-list">
			  <ul>
				<li><a href="/web/winvest/main">프로젝트</a></li>
				<li><a href="/web/wreward/main">공동구매</a></li>
				<li><a href="/web/wcomingsoon/main">오픈예정</a></li>
			  </ul>
			</div>
		  </div>
		</div>
	  </div>

	  <div class="right-section">
		<ul class="util-menu pc-only">
			<li><a href="/web/wsub/openfunding" onclick="gaEvt.send('webgnb', 'btn_page_makeproject', '펀딩오픈 신청하기', '');">물품 등록하기</a></li>
			<li><a href="/web/fthelpCenter" target="_blank">이용가이드</a></li>
		</ul>
		
		  <ul class="util-menu">
		  <c:if test="${ empty loginUser }">
		  	<li class="point"><a id="loginBtn" href="#" data-toggle="modal" data-target="#loginModal">로그인</a></li>
			<li class="point"><a href="#" onclick="registerLink()">회원가입</a></li>
		  </c:if>
		  <c:if test="${ !empty loginUser }">
		  	<li class="point"><a href="#">${ loginUser.member_name }</a></li>
		  	<li class="point"><a id="logoutBtn" href="logout.do">로그아웃</a></li>
		  </c:if>
		  </ul>
		  <c:import url="/WEB-INF/views/member/loginModal.jsp"/>
		
		<button class="btn-search"><i class="icon-search"></i></button>
		<form id="headSearchForm" action="/web/wcampaign/search" method="get">
			<input type="search" name="keyword" id="headSearchInput" class="search-text" placeholder="프로젝트 검색하기"></form>
       
	  </div>
	</div>
	<h1>보람보람</h1>
	
</div>
<!-- 
<div id="header-in">
<hr>
<h1>header</h1>
<hr>
</div> -->

</header>
</body>
</html>