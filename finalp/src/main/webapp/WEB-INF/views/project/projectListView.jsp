<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	/*---------기본설정--------------------*/
	div, h3, p {word-break: break-all;}
	*, :after, :before {box-sizing: inherit;}
	body {margin: 0;overflow-x: hidden;min-width: 320px;background: #f6f5f5;font-size: 14px;line-height: 1.7em;color: rgba(0,0,0,.87);font-smoothing: antialiased;}
	html {font-family: sans-serif;font-size: 12.5px;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;}
	::selection {background-color: #cce2ff;color: rgba(0,0,0,.87);}
	@media only screen and (max-width: 768px){
		body, html {
			font-size: 13px;
		}
	}
	@media (min-width: 1080px){
		html {
			font-size: 14px;
		}
	}
	/*------------큰틀---------------------*/

	.wrap{width: 100vw;margin: 0 auto;position: relative;padding: 0;}
	@media (min-width:1080px){
		.wrap{
			width:1080px;
			margin:0 auto;
		}
	}
	

	/*-------------구분선-------------------*/
	.hEIXJa {border-top: 1px solid lightgray;margin: 1.5rem 0;height: 0;}

	/*------------썸네일 부분----------------------*/
	a, a:hover {text-decoration: none;}
	a {color: #fa6462;}
	a {background: transparent;}


	.thumnailContainer {
		/* display: -webkit-box;display: -webkit-flex;display: -ms-flexbox;display: flex;margin: 0 -1rem;padding: 0 1rem;-webkit-box-pack: center;-webkit-justify-content: center;
		-ms-flex-pack: center;justify-content: center;-webkit-flex-direction: column;-ms-flex-direction: column;flex-direction: column; */
		display: flex;-webkit-box-pack: center;justify-content: center;flex-wrap: wrap;width: 100%;margin: 10px 0px 30px;}
	
	.thumnailContent {
		/*width: 100%;*/
		margin: 1rem;
	}
	.thumnailContent:hover{
	}

	
	
	.thumnailAtag {
		cursor: pointer;
		display: -webkit-box;
		display: -webkit-flex;
		display: -ms-flexbox;
		display: flex;
		-webkit-flex-direction: row;
		-ms-flex-direction: row;
		flex-direction: row;
		position: relative;
		width: 100%;
		background-color: #ffffff;
		min-height: 105px;
		height: auto;
		padding-bottom: 0.75rem;
		border-bottom: 1px solid rgba(0, 0, 0, 0.05);
	}
	
	.thumnailImage {
		min-width: 120px;
		width: 120px;
		height: 90px;
		margin-right: 1rem;
		background-color: #efefef;
		-webkit-transition: background-color 0.2s ease;
		transition: background-color 0.2s ease;
	}
	
	
	img {
		border: 0;
	}

	.thumnailImage:hover{
		background-image:url('img_ov.png');
	}

	.thumnailTextWrap {
		-webkit-order: 2;
		-ms-flex-order: 2;
		order: 2;
		color: black;
		font-size: 0.9rem;
		line-height: 1.6;
		max-width: 60%;
		padding-bottom: 0;
	}

	.fundingTitle {
		height: 60px;
	}

	
	.projectTitle {
		color: #3c3737;
		font-size: 1.1rem;
		font-weight: bold;
		margin-bottom: 0;
		line-height: 1.5;
		word-break: keep-all;
		word-wrap: break-word;
	}
	

	.creatorName {
		font-size: 0.8rem;
		margin-bottom: 0;
		color: #3c3737;
	}

	svg:not(:root) {
		overflow: hidden;
	}
	.percentageLine {
		max-width: 100%;
		height: 2px;
		font-size: 0;
	}
	

	.fundingInfo {
		margin-top: 0.4rem;
		display: -webkit-box;
		display: -webkit-flex;
		display: -ms-flexbox;
		display: flex;
		-webkit-box-pack: space-between;
		-webkit-justify-content: space-between;
		-ms-flex-pack: space-between;
		justify-content: space-between;
		-webkit-align-items: center;
		-webkit-box-align: center;
		-ms-flex-align: center;
		align-items: center;
	}
	

	i._1DLNFgQRrQNEosKFB0zOK5._1QY7TzdLHKX3-BKPDNNYKF, i._1DLNFgQRrQNEosKFB0zOK5.JXDnh3ZF3p-Ajae7ENKXc {
		line-height: 1;
		font-size: .71428571rem;
	}
	i._3fJsfvAPykJzj2xoMnxzWW._1QY7TzdLHKX3-BKPDNNYKF {
		color: #767676!important;
	}
	i._1QY7TzdLHKX3-BKPDNNYKF, i.JXDnh3ZF3p-Ajae7ENKXc {
		font-size: 1em;
	}
	i._1QY7TzdLHKX3-BKPDNNYKF {
		display: inline-block;
		opacity: 1;
		margin: 0 .25rem 0 0;
		width: 1.18em;
		height: 1em;
		font-family: Icons;
		font-style: normal;
		font-weight: 400;
		text-decoration: inherit;
		text-align: center;
		speak: none;
		font-smoothing: antialiased;
		-moz-osx-font-smoothing: grayscale;
		-webkit-font-smoothing: antialiased;
		-webkit-backface-visibility: hidden;
		backface-visibility: hidden;
	}
	i._1QY7TzdLHKX3-BKPDNNYKF._2CeNIUhLMEIh6Reaatfs8t:before {
		content: "\F073";
	}
	i._1QY7TzdLHKX3-BKPDNNYKF:before {
		background: none!important;
	}

	.fundingMoney {
		font-size: 0.8rem;
		font-weight: 700;
		color: #3c3737;
	}
	.fundingRate {
		margin-left: 0.2rem;
		font-size: 0.6rem;
		font-weight: 700;
		color: #3c3737;
	}
	
	/*----- 알려드립니다 부분-------*/
	#noticeSection {
	    margin-bottom: 25px;
	    padding: 15px;
	    text-align: center;
	    background: #FCFCEF;
	    border: 1px solid #F7D358;
	}
	#noticeSection p.title {
	    margin-bottom: 8px;
	    font-size: 14px;
	    line-height: 22px;
	    color: #F7D358;
	}
	#noticeSection p.text {
	    font-size: 12px;
	    line-height: 18px;
	}
	
	/*---- 검색 부분 ------------*/
	#searchSortArea {
		width: 100%;
	   /* margin-bottom: 15px;*/
	   margin-top:30px;
	}
	#searchSortArea:after {
		content: "";
		clear: both;
		display: block;
	}
	#searchSortArea .search-area {
		float: left;
		padding-left: 10px;
		width: 180px;
		height: 34px;
		background-color: #fff;
		border: 1px solid #e4e4e4;
		border-radius: 2px;
	}
	#searchSortArea .search-area input[type=text] {
		display: inline-block;
		width: 150px;
		height: 34px;
		padding: 0;
		line-height: 14px;
		font-size: 13px;
		border: none;
		background: none;
		-webkit-appearance: none;
		vertical-align: middle;
		outline: none;
	}
	#searchSortArea .search-area button {
		width: 28px;
		height: 34px;
		vertical-align: middle;
		padding: 0;
		background: url(/finalp/resources/images/icon/icon_gray_search.png) no-repeat 10px center;
		border: none;
		background-size: 14px 14px;
	}
	#searchSortArea .selects-wrap {
		float: none;
		text-align: left;
		padding-top: 8px;
		clear: both;
	}
	#searchSortArea .select-list {
		display: inline-block;
	}
	#searchSortArea .select-list select {
		display: inline-block;
		height: 34px;
		padding: 0 10px 0 25px;
		line-height: 34px;
		font-size: 13px;
		background-color: #fff;
		border: 1px solid #e4e4e4;
		border-radius: 2px;
		appearance: none;
		-moz-appearance: none;
		-webkit-appearance: none;
		-ms-appearance: none;
		background: url(/finalp/resources/images/icon/icon_select_down.png) no-repeat 10px center #fff;
		background-size: 8px 12px;
		outline: none;
	}
	

	@media (max-width: 320px){
		.thumnailAtag {
			min-height: 90px;
			height: auto;
		}
		.fundingTitle {
			height: 40px;
		}
		.projectTitle {
			font-size: 1rem;
			line-height: 1.4;
			word-break: break-all;
			margin-bottom: 0.3rem;
		}
	}

	@media (max-width: 1080px){
		.thumnailImage {
			margin-right: 0;
			position: relative;
			top: 0;
			bottom: 0;
			margin: auto 0;
			left: 0;
		}
		.fundingTitle {
			padding: 0 1rem 0 0.6rem;
		}
		.projectTitle {
			overflow: hidden;
			text-overflow: ellipsis;
			white-space: nowrap;
		}
		.percentageLine {
			padding: 0 1rem 0 0.6rem;
		}
		.fundingInfo {
			padding: 0 1rem 0 0.6rem;
		}
	}

	@media (min-width: 1080px){
		.thumnailContainer {
			/* -webkit-flex-direction: row;
			-ms-flex-direction: row;
			flex-direction: row; */

			-webkit-box-pack: start;
			justify-content: flex-start;
			margin: 20px 0px 40px;
		}
		.thumnailContent {
			-webkit-flex: 0 0 20%;
			-ms-flex: 0 0 20%;
			flex: 0 0 20%;
		}
		.thumnailAtag {
			-webkit-flex-direction: column;
			-ms-flex-direction: column;
			flex-direction: column;
			height: 100%;
			padding-bottom: 0;
			border: 1px solid rgba(0, 0, 0, 0.05);
			border-radius: 2px !important;
			box-shadow: 0 1px 1px rgba(0, 0, 0, 0.1);
			-webkit-transition: box-shadow 0.2s ease;
			transition: box-shadow 0.2s ease;

			max-width: 240px;
		}
		.thumnailImage {
			width: 240px; 
			/* width:100%; */
			height: 180px;
			border-radius: 2px 2px 0 0;
			margin-right: 0;
		}
		.thumnailTextWrap {
			max-width: 100%;
			padding: 1rem 1.2rem 1rem 1.2rem;
		}
		.projectTitle {
			font-size: 1rem;
			word-spacing: -1px;
		}
		
		#searchSortArea .search-area {
			width: 288px;
			margin-left:15px;
		}
		#searchSortArea .search-area input[type=text] {
			width: 250px;
		}
		#searchSortArea .selects-wrap {
			float: right;
			text-align: right;
			padding-top: 0px;
			clear: none;
			margin-right:15px;
		}
	}
	
	/* 카테고리 검색  */
	form .search_tab, form .search_sel, form .search_submit {
		float: left;
		/*border: 1px solid #fff;*/
		background-color: #fff;
	}
	.search_sel {
		position: relative;
		width: 142px;
		overflow: hidden;
		/*border-right: 1px solid #fff;*/
		margin-left:17px;
	}
	.search_sel:after {
		content: "";
		position: absolute;
		top: 18px;
		right: 15px;
		border: 5px solid transparent;
		border-top-color: black;
		cursor:pointer;
	}
	.search_sel select {
		width: 170px;
		height: 42px;
		padding-left: 10px;
		border: 0;
		background: transparent;
		color: black;
		border: 1px solid #e4e4e4;
		/* border-radius : 20px; */
	}
	button, select {
		text-transform: none;
	}
	option {
		font-weight: normal;
		display: block;
		white-space: pre;
		min-height: 1.2em;
		padding: 0px 2px 1px;
	}
	input, textarea, select {
		font-size: 1em;
		vertical-align: baseline;
		vertical-align: middle;
	}
	.search_sel + .search_tab {
		width: 800px;
	}
	form .search_tab {
		/*border-width: 0;*/
	}
	.search_tab {
		width: 952px;
		height: 42px;
		/*border: 1px solid #b8b8b8;*/
		/*background: #c5421b;*/
		/*margin-top:1px;*/
		border:1px solid #e4e4e4;
	}
	.search_tab ul {
		padding: 7px 0 0 10px;
		overflow: hidden;
	}
	ul, ol {
		list-style: none;
		list-style-image: none;
	}
	.search_tab ul:after {
		content: '';
		display: block;
		clear: both;
	}
	.search_tab ul li {
		float: left;
		color: #fff;
	}
	.search_tab ul li a.ov, .search_tab ul li button.ov {
		border-radius: 3px;
		background: #F7D358;
		text-decoration: underline;
		color:white;
	}
	.search_tab ul li a, .search_tab ul li button {
		margin: 0 3px;
		padding: 3px;
		color: black;
	}
	.go-button {
		display: block;
		padding: 0;
		background: transparent;
		border-width: 0;
	}
	button, select {
		text-transform: none;
	}
	button, input {
		line-height: normal;
	}
	button, input, select{
		font-size: 0.87em;
		vertical-align: baseline;
		/*line-height: 1.6;*/
		font-family: "ngn","Nanum Gothic","shm","돋움",dotum,"Lucida Grande",sans-serif;
		/* color:#fff; */
	}
	button{
		cursor:pointer;
	}
	.search_submit input {
		display: block;
		width: 89px;
		height: 40px;
		text-indent: 30px;
		font-weight: 600;
		border: 1px solid #e4e4e4;
		/*border-radius:0 20px 20px 0;*/
		background: url(http://localhost:8222/doubleb/images/search.png) no-repeat 15px 50%;
		color: black;
		cursor:pointer;
		margin-left: -1px;
	}
	.form{
		/*margin-left:100px;*/
	}
	
	.clear {
	    display: inline-block;
	    overflow: hidden;
	    margin-left: 15px;
	    font-size: 12px;
	    color: #6b6b6a;
	    vertical-align: middle;
	}
	.ico_clear {
	    display: inline-block;
	    overflow: hidden;
	    width: 12px;
	    height: 13px;
	    margin: -2px 5px 0 0;
	    background: url(https://ssl.pstatic.net/imgshopping/static/pc-real-2017/img/search/sp_search_v30.png) no-repeat -175px -30px;
	    vertical-align: middle;
	}
	
	.selectlist{
		border:1px solid #e4e4e4; 
		width:1044px; 
		height:42px;
		margin-top:64px;
		margin-left:17px;
		background-color:white;
	}
	.bar{
		margin-left: 56px;
		padding: 0;
		color: #d8d8d8;
		padding-bottom: 7px;
	}
	
	.pic{
		margin-left: 15px;
	    font-weight: bold;
	    color: #F7D358;
	    
	    display: inline-block;
	    position: relative;
	    vertical-align: middle;
	    white-space: nowrap;
	}
	.del{
		display: inline-block;
	    overflow: hidden;
	    width: 9px;
	    height: 9px;
	    margin: -2px 10px 0 6px;
	    background: url(https://ssl.pstatic.net/imgshopping/static/pc-real-2017/img/search/sp_search_v30.png) no-repeat -180px -50px;
	    line-height: 9999px;
	    vertical-align: middle;
	}
</style>
<script src="/finalp/resources/js/search.js" type="text/javascript"></script>
</head>
<body style="background:#f6f5f5;">
	<c:import url="../header.jsp"/>
	<div class="wrap">
		<div id="noticeSection" style="margin-top:100px;">
		    <p class="title">알려드립니다.</p>
		    <p class="text">콘샐러드는 결제 즉시 배송되는 쇼핑몰이 아닙니다. 정해진 기간 내 목표를 달성해야 물품이 제공되는 크라우드펀딩 서비스입니다.<br>
		    			프로젝트에 따라 제공일 지연, 진행 취소 등의 이슈가 있을 수 있으니 결제하시기 전, 프로젝트 하단의 '위험요인과 해결방안' 정책을 꼭 읽어주세요!</p>
		</div>

		<div class="hEIXJa"></div>
		
		<div class="form" align="center">
			<form id="/doubleb/searchtourlist" action="" method="GET" name="searchForm">
					<div class="search_sel">
						<select name="category" id="areaCode" class="search_category" title="중분류">
							<option >전체</option>
							<option value="CA-DS" id="c1">디자인</option>
							<option value="CA-FB" id="c2">패션/뷰티</option>
							<option value="CA-CK" id="c3">요리</option>
							<option value="CA-SH" id="c4">공연</option>
						</select>
					</div>
					
	
					<div id="s1" data-type="multiple" class="search_tab">
						<ul>
							<li><button name="category_sub_name" value="CASB-SP" class="go-button " type="button">공간디자인</button></li>
							<li><button name="category_sub_name" value="CASB-VI" class="go-button " type="button">시각디자인</button></li>
							<li><button name="category_sub_name" value="CASB-PR" class="go-button " type="button">제품디자인</button></li>
							<li><button name="category_sub_name" value="CASB-CH" class="go-button " type="button">캐릭터디자인</button></li>
						</ul>
					</div>
					
					<div id="s2" data-type="multiple" class="search_tab" style="display:none;">
						<ul>
							<li><button name="category_sub_name" value="CASB-CL" class="go-button " type="button">의류</button></li>
							<li><button name="category_sub_name" value="CASB-GD" class="go-button " type="button">잡화</button></li>
							<li><button name="category_sub_name" value="CASB-AC" class="go-button " type="button">악세서리</button></li>
							<li><button name="category_sub_name" value="CASB-CO" class="go-button " type="button">화장품</button></li>
						</ul>
					</div>
					
					<div id="s3" data-type="multiple" class="search_tab" style="display:none;">
						<ul>
							<li><button name="category_sub_name" value="CASB-HE" class="go-button " type="button">건강식품</button></li>
							<li><button name="category_sub_name" value="CASB-BA" class="go-button " type="button">베이킹</button></li>
							<li><button name="category_sub_name" value="CASB-HA" class="go-button " type="button">수제</button></li>
						</ul>
					</div>
					
					<div id="s4" data-type="multiple" class="search_tab" style="display:none;">
						<ul>
							<li><button name="category_sub_name" value="CASB-MU" class="go-button " type="button">뮤지컬</button></li>
							<li><button name="category_sub_name" value="CASB-TH" class="go-button " type="button">연극</button></li>
							<li><button name="category_sub_name" value="CASB-FE" class="go-button " type="button">페스티벌</button></li>
						</ul>
					</div>
					
					<p class="search_submit">
						<input type="submit" value="조회" title="조회">
					</p>
			</form>
		</div>
		<div class="selectlist">
			<a id="_resetFilter" href="#" class="clear" style="padding-bottom: 7px;">
				<span class="ico_clear"></span>전체해제
			</a>
			<span class="bar">|</span>
			
			<a href="#" class="pic" data-filter-value="50000807" >
				원피스<span class="del">선택해제</span>
			</a>
		</div>
		
		<script>
			$(document).ready(function(){
				
				$("#c1").on("click",function(){
					$("#s1").css("display", "block");
					$("#s2").css("display", "none");
					$("#s3").css("display", "none");
					$("#s4").css("display", "none");
				});
				
				$("#c2").on("click",function(){
					$("#s1").css("display", "none");
					$("#s2").css("display", "block");
					$("#s3").css("display", "none");
					$("#s4").css("display", "none");				
				});
								
				$("#c3").on("click",function(){
					$("#s1").css("display", "none");
					$("#s2").css("display", "none");
					$("#s3").css("display", "block");
					$("#s4").css("display", "none");
				});
				
				$("#c4").on("click",function(){
					$("#s1").css("display", "none");
					$("#s2").css("display", "none");
					$("#s3").css("display", "none");
					$("#s4").css("display", "block");
				});
			});
		</script>
		
		
		<div id="searchSortArea">
			<div class="search-area">
				<input type="text" id="keyword" name="project_name" placeholder="프로젝트 검색하기">
				<button type="button" onclick="keywordSearch()" style="box-sizing:inherit !important;"></button>
			</div>
				<div class="selects-wrap">
					<div class="select-list">
						<select id="endYn" name="endYn">
							<option value="" selected="selected">전체</option>
							<option value="N">펀딩중</option>
							<option value="Y">종료된</option>
						</select>
					</div>
					<div class="select-list">
						<select id="order" name="order">
							<option value="recommend" selected="selected">추천순</option>
							<option value="popular">인기순</option>
							<option value="amount">펀딩액순</option>
							<option value="closing">마감임박순</option>
							<option value="recent">최신순</option>
							<option value="support">응원참여자순</option>
						</select>
					</div>
				</div>
		</div>
		<script type="text/javascript">
			(function(){
				var parent = ".search_tab",
					btn = ".search_tab button";
	
				requiredTagSearch(parent,btn);
			}());
		</script>
		
		
		
		<div class="thumnailContainer">
			<c:forEach var="projectList" items="${ list }">
			<div class="thumnailContent">
				<c:url var="projectDetail" value="projectDetailView.do">
					<c:param name="member_id" value="${ loginUser.member_id }"/>
					<c:param name="project_id" value="${ projectList.project_id }"/>
				</c:url> 

				<a class="thumnailAtag" href="${ projectDetail }">

					<img class="thumnailImage" src="/finalp/resources/uploadProPreImages/${ projectList.image_rename }" alt="${ projectList.project_name }">

					<div class="thumnailTextWrap">

						<div class="fundingTitle">
							<h1 class="projectTitle">${ projectList.project_name }</h1>
							<p class="creatorName">${ projectList.member_name }</p>
						</div>

						<svg class="percentageLine" xmlns="http://www.w3.org/2000/svg">
							<rect x="0" y="0" fill="#efefef" height="2" width="100%"></rect>
							<rect x="0" y="0" height="2" width="${ projectList.percent }" fill="#F7D358"></rect><!--여기서의 width값에 따라-->
						</svg>

						<div class="fundingInfo">
							<span style="font-size: 0.8rem;">
								<i class="_2CeNIUhLMEIh6Reaatfs8t _1DLNFgQRrQNEosKFB0zOK5 _3fJsfvAPykJzj2xoMnxzWW _1QY7TzdLHKX3-BKPDNNYKF"></i>
								<span style="font-weight: 700;">${ projectList.dday }</span>
								<!-- react-text: 235 -->일<!-- /react-text --><!-- react-text: 236 -->&nbsp;남음<!-- /react-text -->
							</span>

							<div>
								<span class="fundingMoney">
									<!-- react-text: 239 -->${projectList.total_amount}<!-- /react-text --><!-- react-text: 240 -->원<!-- /react-text -->
								</span>
								<span class="fundingRate">
									<!-- react-text: 242 -->${projectList.percent}<!-- /react-text --><!-- react-text: 243 --><!-- /react-text -->
								</span>
							</div>
						</div>
					</div>
				</a>
			</div>
			</c:forEach>

			
		</div>
	</div>
	
	<script type="text/javascript">
	$(document).ready(function(){
			
			 
			$("#keyword").keyup(function(){
				var keyword = $('#keyword').val();
				console.log(keyword);
				$.ajax({
					url:"keywordSearch.do",
					data:{project_name: keyword},
					dataType:"json",
					type:"post",
					success:function(data){
						
						var jsonStr = JSON.stringify(data);
						var json = JSON.parse(jsonStr);
						var values="";
						console.log(json.list);
						for(var i in json.list){
							values+=
								'<div class="thumnailContent">'+
										'<c:url var="projectDetail" value="projectDetailView.do">'+
											'<c:param name="member_id" value='+${ loginUser.member_id }+'/>'+
											'<c:param name="project_id" value='+json.list[i].project_id+'/>'+
										'</c:url>'+
										'<a class="thumnailAtag" href="${ projectDetail }">'+
											'<img class="thumnailImage" src="/finalp/resources/uploadProPreImages/'+decodeURIComponent(json.list[i].image_rename)+'" alt="'+decodeURIComponent(json.list[i].project_name)+'">'+
												'<div class="thumnailTextWrap">'+
													'<div class="fundingTitle">'+
														'<h1 class="projectTitle">'+decodeURIComponent(json.list[i].project_name.replace(/\+/g," "))+'</h1>'+
														'<p class="creatorName">'+decodeURIComponent(json.list[i].member_name.replace(/\+/g," "))+'</p>'+
													'</div>'+
													'<svg class="percentageLine" xmlns="http://www.w3.org/2000/svg">'+
														'<rect x="0" y="0" fill="#efefef" height="2" width="100%"></rect>'+
														'<rect x="0" y="0" height="2" width="'+json.list[i].percent+'" fill="#F7D358"></rect><!--여기서의 width값에 따라-->'+
													'</svg>'+
													'<div class="fundingInfo">'+
														'<span style="font-size: 0.8rem;">'+
															'<i class="_2CeNIUhLMEIh6Reaatfs8t _1DLNFgQRrQNEosKFB0zOK5 _3fJsfvAPykJzj2xoMnxzWW _1QY7TzdLHKX3-BKPDNNYKF"></i>'+
															'<span style="font-weight: 700;">'+json.list[i].dday+'</span>'+
															'<!-- react-text: 235 -->일<!-- /react-text --><!-- react-text: 236 -->&nbsp;남음<!-- /react-text -->'+
														'</span>'+
														'<div>'+
															'<span class="fundingMoney">'+
																'<!-- react-text: 239 -->'+json.list[i].total_amount+'<!-- /react-text --><!-- react-text: 240 -->원<!-- /react-text -->'+
															'</span>'+
															'<span class="fundingRate">'+
																'<!-- react-text: 242 -->'+json.list[i].percent+'<!-- /react-text --><!-- react-text: 243 --><!-- /react-text -->'+
															'</span>'+
														'</div></div></div></a></div>'														;
						}
						$(".thumnailContainer").html(values);
						
						
					}
				});
			});
			
		});
	</script>
	
	<c:import url="../footer.jsp"/>
</body>
</html>