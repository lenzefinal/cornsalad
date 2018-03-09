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

<!-- tetestete 데스크탑에서 수정 -->
<!-- tetestete 노트북에서 수정 --> 

<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap. min.css">-->
<link rel="stylesheet" href="/finalp/resources/css/jquery-ui.css"/>
<script src="/finalp/resources/js/jquery-ui.min.js"></script>
<style>
	
	
	/* body, button, input, select, textarea {
		font-family: Roboto,Noto Sans KR,-apple-system,Dotum,sans-serif;
		font-weight: 400;
		background-color: rgba(253,255,232,0.5);
	} */
	body{
		background: #f6f5f5;
	}
	.project-bgcol-white{
		background-color: white;
	}
	.project-bgcol-maincolor{
		background-color: rgba(253,255,232,0.5);
	}

	.project-header-title{
		padding-top: 100px;
		padding-bottom: 50px;
		margin-bottom: 20px;
		text-align: center;
		text-weight: bold;
	}
	
	/* 충돌 테스트 */
	
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
		
		html{
			font-size: 14px;
		}
	}
	@media only screen and (max-width: 1199px) and (min-width: 992px){
		.project-outter-div-margin {
		    width: 891px;
		    margin-left: auto!important;
		    margin-right: auto!important;
		}
		
		html{
			font-size: 16px;
		}
	}
	@media only screen and (max-width: 991px) and (min-width: 768px){
		.project-outter-div-margin {
		    width: 695px;
		    margin-left: auto!important;
		    margin-right: auto!important;
		}
		
		html{
			font-size: 19px;
		}
	}
	@media only screen and (max-width: 767px){
		.project-outter-div-margin {
		    width: auto!important;
		    margin-left: 0.8em!important;
		    margin-right: 0.8em!important;
		}
		
		html{
			font-size: 25px;
		}
	}
	
	/* .project-tap{
		font-size: 0.9rem;
	} */
	.project-tap-table{
		margin: auto;
		cellspacing: 0;
	}
	.project-tap-table .tap {
		padding: .92857143em 1.42857143em;
		border-radius: .28571429rem .28571429rem 0 0!important;
		cursor: pointer;
	}
	.project-tap-table .project-tap-on{
		border: 1px solid rgba(0,0,0,0.1);
		border-bottom: none;
		background-color: rgba(253,255,232,0.5);
	}
	.project-tap-table .project-tap-off{
		border: 1px solid rgba(0,0,0,0.0);
		border-bottom: none;
	}
	.project-tap-table .project-tap-off:hover{
		background-color: rgba(221,242,200,0.5);
	}
	
	#session-1{
		/* font-size: 0.9rem; */
		/* color: #767676; */
	}
	.session,
	session-tap {
		/* font-size: 0.9rem; */
		border: 1px solid rgba(0,0,0,0.1);
	}
	
	@media only screen and (max-width: 767px){
		.project-tap,
		.session,
		.session-tap {
			font-size: 3rem;
		}
	}
	
	/* .project-div{
		background-color:#f8f8f8;
	} */
	
	.project-title {
		margin-top: 30px;
		margin-bottom: 20px; 
		font-weight: bold;
	}
	.project-title-first{
		margin-top: 50px;
	}
	
	.project-title-last{
		margin-bottom: 150px;
	}
	
	.project-box {
		border: 1px solid rgba(0,0,0,0.1);
	    border-radius: .25rem;
	}
	
	.project-element-div{
		padding: 1.5em;
	}
	
	.project-element-in-div{
		padding: 0.8em;
		margin: 0.5em;
	}
	.project-element-in-title{
		font-weight: bold;
	}
	
	/* 설명 버튼 ================================================= */
	.project-description-button {
		border: 1px solid rgba(0,0,0,0.1);
		/* background-color: rgba(215,255,73,0.2); */
		background-color: rgba(0,0,0,0.4);
		color: white;
		font-weight: bold;
	    border-radius: .25rem;
	    
	    transition: 0.4s;
	}
	.project-description-button:hover,
	.project-description-button-active {
		/* background-color: rgba(215,255,73,0.5); */
		background-color: rgba(0,0,0,0.6);
	}
	.project-description-button-panel{
		padding: 0 18px;
	    /* background-color: white; */
	    max-height: 0;
	    overflow: hidden;
	    transition: max-height 0.2s ease-out;
	}
	.project-description-button:after {
	    content: '\002B';
	    color: #777;
	    font-weight: bold;
	    float: right;
	    margin-left: 5px;
	    color: white;
	}
	
	.project-description-button-active:after {
	    content: "\2212";
	    color: white;
	}
	
	
	
	
	/* 탭 ---------------------------------------------------*/
	@media only screen and (max-width: 767px){
		.tap-span {
			display: block;
		}
		.tap-span span{
			display: block;
		}
	}
	
	.tap span{
		text-align: center;
	}
	
	
	.project-element-content-div{
		border: 1px solid rgba(0,0,0,0.1);
		background-color: #FFFBC5;/* rgba(215,255,73,0.2); */
		/* background-color: rgba(0,0,0,0.4); */
	    border-radius: .25rem;
	}
	.project-element-content-div input[type=text],
	.project-element-content-div input[type=number]{
	  height: 40px;
	  font-size: 0.9rem;
	  width: 100%;
	  /* margin-bottom: 10px; */
	  -webkit-appearance: none;
	  background: #fff;
	  border: 1px solid #d9d9d9;
	  border-top: 1px solid #c0c0c0;
	  /* border-radius: 2px; */
	  /* padding: 0 8px; */
	  box-sizing: border-box;
	  -moz-box-sizing: border-box;
	}
	.project-element-content-div textarea {
	  height: 120px;
	  font-size: 0.9rem;
	  width: 100%;
	  /* margin-bottom: 10px; */
	  -webkit-appearance: none;
	  background: #fff;
	  border: 1px solid #d9d9d9;
	  border-top: 1px solid #c0c0c0;
	  /* border-radius: 2px; */
	  /* padding: 0 8px; */
	  box-sizing: border-box;
	  -moz-box-sizing: border-box;
	  resize: none;
	  letter-spacing: -.03em;
	  outline: none;
	  padding: 10px 10px 10px 10px; 
      overflow-y: hidden;
	}
	
	.project-element-content-div input[type=text]:hover,
	.project-element-content-div textarea:hover {
	  border: 1px solid #b9b9b9;
	  border-top: 1px solid #a0a0a0;
	  -moz-box-shadow: inset 0 1px 2px rgba(0,0,0,0.1);
	  -webkit-box-shadow: inset 0 1px 2px rgba(0,0,0,0.1);
	  box-shadow: inset 0 1px 2px rgba(0,0,0,0.1);
	}
	
	.project-element-content-div select{
		margin: 14px 5px;
		border: 2px solid #dddddd;
		width: 150px;
		height: 34px;
	}
	
	
	/* 업로드 버튼 ------------------------------------------------------------*/
	.filebox input[type="file"] { 
		position: absolute; 
		width: 1px; 
		height: 1px; 
		padding: 0; 
		margin: -1px; 
		overflow: hidden; 
		clip:rect(0,0,0,0); 
		border: 0; 
	} 
	.filebox label { 
		display: inline-block; 
		padding: .5em .75em; 
		color: #999; 
		font-size: inherit; 
		line-height: normal; 
		vertical-align: middle; 
		background-color: #fdfdfd; 
		cursor: pointer; 
		border: 1px solid #ebebeb; 
		border-bottom-color: #e2e2e2; 
		border-radius: .25em; 
		margin-top: 8px;
	} 
	/* named upload */ 
	.filebox .upload-name { 
		display: inline-block; 
		padding: .5em .75em; /* label의 패딩값과 일치 */ 
		font-size: inherit; 
		font-family: inherit; 
		line-height: normal; 
		vertical-align: middle; 
		background-color: #f5f5f5; 
		border: 1px solid #ebebeb; 
		border-bottom-color: #e2e2e2; 
		border-radius: .25em; 
		-webkit-appearance: none; /* 네이티브 외형 감추기 */ 
		-moz-appearance: none; 
		appearance: none; 
	}
	
	/* 미리보기 이미지 ----------------------------------------------- */
	/* imaged preview */ 
	.filebox .upload-display { /* 이미지가 표시될 지역 */ 
		margin-bottom: 5px; 
	} 
	@media(min-width: 768px) { 
		.filebox .upload-display { 
			display: inline-block; 
			margin-right: 5px; 
			margin-bottom: 0; 
		} 
	} 
	.filebox .upload-thumb-wrap { /* 추가될 이미지를 감싸는 요소 */ 
		display: inline-block; 
		width: 100%; 
		padding: 2px; 
		vertical-align: middle; 
		border: 1px solid #ddd; 
		border-radius: 5px; 
		background-color: #fff; 
	} 
	.filebox .upload-display img { /* 추가될 이미지 */ 
		display: block; 
		max-width: 100%; 
		width: 100% \9; 
		height: auto; 
	}
	/* http://webdir.tistory.com/435 */




	.project-gift-table{
	    border-collapse: collapse;
	    width: 100%;
	    background-color:white;
	    margin-bottom:0px;
	}
	.project-gift-table th, 
	.project-gift-table td{
		padding: 8px;
	    text-align: center;
	}
	.project-gift-table th{
		background-color: rgba(0,0,0,0.1);
	}
	.project-gift-table td{
		 border-top: 1px solid #ddd;
	}
	
	
	
	/*최대 수량 --------------------------------*/
	.project-element-content-div input[type="checkbox"] {
    	display:none;
	}
	.project-element-content-div input[type="checkbox"] + label span {
	    display:inline-block;
	    width:19px;
	    height:19px;
	    margin:-2px 10px 0 0;
	    vertical-align:middle;
	    background:url(/finalp/resources/images/icon/check_radio.png) left top no-repeat;
	    cursor:pointer;
	}
	.project-element-content-div input[type="checkbox"]:checked + label span {
   		background:url(/finalp/resources/images/icon/check_radio.png) -19px top no-repeat;
	}
	   
	
	/*선물 체크 박스---------------------------------------*/
	.gift-chk-btn{
		cursor: pointer;
	}
	.gift-chk-btn circle{
		fill: #E2E2E2;
		transition: 0.4s;
	}
	.gift-chk-btn polyline {
		stroke: #000000;
		transition: 0.4s;
	}
	
	.gift-chk-btn-active circle{
		fill: #2CCDFF;
		transition: 0.4s;
	}
	.gift-chk-btn-active polyline {
		stroke: #FFFFFF;
		transition: 0.4s;
	}
	
</style>


<script src="https://cloud.tinymce.com/stable/tinymce.min.js?apiKey=n950z8giku55kswh4gbnzrjj5d4wgtd69uzc7hg7jkp1r2yd"></script>
<script>
	$(function(){
		
		//대표 이미지 미리 보기 ---------------------------------------------------------------------
		var fileTarget = $('.filebox .upload-hidden'); 
		
		fileTarget.on('change', function(){ // 값이 변경되면 
			if(window.FileReader){ // modern browser 
				var filename = $(this)[0].files[0].name; 
			} 
			else { // old IE 
				var filename = $(this).val().split('/').pop().split('\\').pop(); // 파일명만 추출 
			} 
		
			// 추출한 파일명 삽입 
			$(this).siblings('.upload-name').val(filename); 
		});
		
		
		
		//preview image 
		var imgTarget = $('.preview-image .upload-hidden'); 
		
		imgTarget.on('change', function(){ 
			var parent = $(".preview-image");/* $(this).parent();  */
			parent.children('.upload-display').remove(); 
			
			if(window.FileReader){ 
				//image 파일만 
				/* if (!$(this)[0].files[0].type.match(/image\//)) return;  */
				
				var reader = new FileReader(); 
				reader.onload = function(e){ 
					var src = e.target.result; 
					parent.prepend('<div class="upload-display"><div class="upload-thumb-wrap"><img src="'
							+ src + '" class="upload-thumb"></div></div>'); 
				} 
				reader.readAsDataURL($(this)[0].files[0]); 
			} 
			else { 
				$(this)[0].select(); 
				$(this)[0].blur(); 
				
				var imgSrc = document.selection.createRange().text; 
				parent.prepend('<div class="upload-display"><div class="upload-thumb-wrap"><img class="upload-thumb"></div></div>'); 
				
				var img = $(this).siblings('.upload-display').find('img'); 
				img[0].style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(enable='true',sizingMethod='scale',src=\""
						+ imgSrc + "\")"; 
			} 
		});
		
		
		//펀딩 마감일 ------------------------------------------------------
		 $( "#fundingDatepicker" ).datepicker();
		
		
		//처음에는 처음 탭 영역만 보이도록 -----------------------------------------
		 $(".session").attr('style', "display:none");
		 $("#session-1").attr("style", "display:block");
	
		 
	    //선물 체크 버튼 ----------------------------------------------------
	    $(".gift-chk-btn").on("click", function(){
	    	$(this).toggleClass("gift-chk-btn-active");
	    });
	    
	    //수량 버튼 -------------------------------------------------------
	/*     $(window).mousedown(function(e) {
	        clearTimeout(this.downTimer);
	        this.downTimer = setTimeout(function() {
	            // do your thing 
	        }, 2000);
	    }).mouseup(function(e) {
	        clearTimeout(this.downTimer);
	    }); */
	});

	
	//탭 버튼 색 ---------------------------------------------
	function tapChange(sessionDivId, sessionTapId){
		$(".session").attr("style", "display:none");
		$(sessionDivId).attr("style", "display:block");
		
		$(".tap").removeClass("project-tap-on");
		$(".tap").addClass("project-tap-off");
		
		
		$(sessionTapId).removeClass("project-tap-off");
		$(sessionTapId).addClass("project-tap-on");
	}
	
	//에디터 ----------------------------------------------------------
	tinymce.init({
		  selector: '#jieuntextarea',
		 
		  plugins: [
		        "advlist autolink lists link image charmap print preview anchor",
		        "insertdatetime media table contextmenu paste imagetools wordcount"
		    ],
		    toolbar: "insertfile undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link image",
		    // imagetools_cors_hosts: ['www.tinymce.com', 'codepen.io'],
		    content_css: [
		      '//fonts.googleapis.com/css?family=Lato:300,300i,400,400i',
		      '//www.tinymce.com/css/codepen.min.css'
		    ],
		    
		 // without images_upload_url set, Upload tab won't show up
		    images_upload_url: 'postAcceptor.php',
		    images_upload_handler: function (blobInfo, success, failure) {
		       /*  setTimeout(function() {
		          // no matter what you upload, we will turn it into TinyMCE logo :)
		          success('http://moxiecode.cachefly.net/tinymce/v9/images/logo.png');
		        }, 2000); */
		        
		        var form = new FormData();
		        form.append('file', blobInfo.blob());
		        
		        jQuery.ajax({
		        	url: "contentImgUpload.do",
		        	data: form,
		        	dataType: 'text',
		        	processData: false,
		        	contentType: false,
		        	type: 'POST',
		        	success: function(response){
		        		console.log("success result:"+response);
		        		success(response);//이미지 주소여야 함
		        	},
		        	error: function(request, status, errorData){
						//error 500 : 서버 관련
						//error 400 : 요청 관련
						//200번은 성공
						//http error code 참고할 것
						alert("error code: " + request.status + "\n"
								+ "message : " + request.responseText + "\n"
								+ "error : " + errorData);
					}
		        });
		        
		    	 //console.log(blobInfo.blob());
			     //console.log(blobInfo.filename());
		   },
		     
	       /*기본 이미지 설정 가능 */
		   image_list: [
		     {title: 'My image 1', value: 'https://www.tinymce.com/my1.gif'},
		     {title: 'My image 2', value: 'http://www.moxiecode.com/my2.gif'}
		   ]
			
	});
	
	//임시
	function testtinymce(){
		console.log(tinymce.get("jieuntextarea").getContent());
	}
		
</script>

<div id="session-0" class="project-bgcol-white session-tap">
	<h2 class="project-header-title"> 프로젝트 등록 </h2>
	<div class="project-tap project-outter-div-margin">
		<table class="project-tap-table">
			<tr>
				<th><div id="session1-tap" class="tap project-tap-on" onclick="tapChange('#session-1', '#session1-tap');">
					<span class="tap-span">
						<span>펀딩</span> 
						<span>개요</span>
					</span>
				</div></th>
				<th><div id="session2-tap" class="tap project-tap-off" onclick="tapChange('#session-2', '#session2-tap');">
					<span class="tap-span">
						<span>펀딩</span> 
						<span>구성</span>
					</span> 
				</div></th>
				<th><div id="session3-tap" class="tap project-tap-off" onclick="tapChange('#session-3', '#session3-tap');">
					<span>
						상세 내용
					</span>
					</div></th>
				<th><div id="session4-tap" class="tap project-tap-off" onclick="tapChange('#session-4', '#session4-tap');">
					<span class="tap-span">
						<span>계좌</span> 
						<span>설정</span>
					</span>
				</div></th>
			</tr>
		</table>
	</div>
</div>

<div id="session-1" class="session">
<div id="project-intro" class="project-div project-outter-div-margin project-first project-title-last">
	<div class="project-title project-title-first">펀딩 개요</div>
	<div class="project-box">
		<div class="project-element-div project-bgcol-white">
			<div class="project-element-in-div project-element-title-div project-element-in-title">펀딩 제목</div>
			<div class="project-element-in-div project-description-button">
				설명
			</div>
			<div class="project-description-button-panel">
				<p>프로젝트를 대표할 이미지입니다. 후원자들이 한 번에 무슨 프로젝트인지 알 수 있도록 프로젝트의 선물 이미지 혹은 프로젝트 주제를 대표하는 이미지를 등록해 주시는 것이 좋답니다.</p>
			</div>
			<div class="project-element-in-div project-element-content-div">
				<input type="text" name="title" placeholder="프로젝트 제목을 입력해주세요.">
			</div>
		</div>
		<div class="project-element-div project-bgcol-white">
			<div class="project-element-in-div project-element-title-div project-element-in-title">펀딩 카테고리</div>
			<div class="project-element-in-div project-description-button">설명</div>
			<div class="project-description-button-panel">
				<p>프로젝트의 성격에 맞는 카테고리를 선택해 주세요.<br>
				(프로젝트 성격과 맞지 않는 카테고리를 선택하실 시 후원자가 해당 프로젝트를 찾기 어려워지기에 에디터에 의해 조정될 수 있습니다.)</p>
			</div>
			<div class="project-element-in-div project-element-content-div">
				<!-- <div align="center"> -->
				<select id="project-category" name="category" >
					<option value>선택하세요.</option>
					<option value="cate_id">문학</option>
					<option value="cate_id">문학</option>
					<option value="cate_id">골동품</option>
					<option value="cate_id">옷</option>
				</select>
				<select id="project-sub-category" name="sub_category">
					<option value>선택하세요.</option>
					<option value="sub_cate_id">카테고리에 따라</option>
					<option value="sub_cate_id">카테고리에 따라 달</option>
					<option value="sub_cate_id">카테고리에 따라 달라</option>
					<option value="sub_cate_id">카테고리에 따라 달라짐</option>
				</select>
				<!-- </div> -->
			</div>
		</div>
		<div class="project-element-div project-bgcol-white">
			<div class="project-element-title-div project-element-in-div project-element-in-title">펀딩 대표 이미지</div>
			<div class="project-element-in-div project-description-button">설명</div>
			<div class="project-description-button-panel">
				<p>프로젝트를 대표할 이미지입니다. 후원자들이 한 번에 무슨 프로젝트인지 알 수 있도록 프로젝트의 선물 이미지 혹은 프로젝트 주제를 대표하는 이미지를 등록해 주시는 것이 좋답니다.</p>
			</div>
			<div class="project-element-content-div project-element-in-div">
				<div class="filebox preview-image"> 
					<div>
						<input class="upload-name" value="파일선택" disabled> 
						<label for="ex_filename">업로드</label> 
						<input type="file" id="ex_filename" class="upload-hidden"> 
					</div>
				</div>
			</div>
		</div>
		<div class="project-element-div project-bgcol-white">
			<div class="project-element-title-div project-element-in-div project-element-in-title">대표 문구</div>
			<div class="project-element-in-div project-description-button">설명</div>
			<div class="project-description-button-panel">
				<p>후원자 분들에게 본 프로젝트를 간략하게 소개해 봅시다.</p>
			</div>
			<div class="project-element-content-div project-element-in-div">
				<textarea name="text" maxlength="400" class="reward-input" placeholder="대표 문구 및 요약" title="상세설명"></textarea>
			</div>
		</div>
	</div>
</div>
</div>

<div id="session-2" class="session">
<div id="" class="project-div project-outter-div-margin project-first">
	<div class="project-title project-title-first">목표 금액과 마감일</div>
	<div class="project-box">
		<div class="project-element-div project-bgcol-white">
			<div class="project-element-in-div project-element-title-div project-element-in-title">목표 금액</div>
			<div class="project-element-in-div project-description-button">설명</div>
			<div class="project-description-button-panel">
				<p>이번 프로젝트를 통해 모으고자 하는 펀딩 목표 금액이 얼마인가요?<br>
				마감일 자정까지 목표 금액을 100% 이상 달성하셔야만 모인 후원금이 결제 됩니다.<br>
				막판에 후원을 취소하는 후원자들도 있는 점을 감안해 10% 이상 초과 달성을 목표로 하시는게 안전합니다.<br>
				(목표 금액은 제작비, 선물 배송비, 진행자의 인건비, 예비 비용 등을 고려하시기 바랍니다.)<br>
				</p>
			</div>
			<div class="project-element-in-div project-element-content-div">
				<input type="text" name="goalPrice" style="width:200px;" placeholder="최소 1000원 이상"> 원
			</div>
		</div>
		<div class="project-element-div project-bgcol-white">
			<div class="project-element-in-div project-element-title-div project-element-in-title">펀딩 마감일</div>
			<div class="project-element-in-div project-description-button">설명</div>
			<div class="project-description-button-panel">
				<p>펀딩이 끝나는 마감일을 정해주세요.</p>
			</div>
			<div class="project-element-in-div project-element-content-div">
				<input type="text" name="deadlineDate" style="width:200px;" id="fundingDatepicker" placeholder="월/일/년도">  
				<span style="align:right; margin-left: 2%;">
					<input type="number" name="dday" style="width:100px; text-align:right;" value="10" readonly> 일 후에 마감일입니다.
				</span>
			</div>
		</div>
	</div>
</div>
<div id="" class="project-div project-outter-div-margin">
	<div class="project-title project-title-first">선물 구성</div>
	<div class="project-box">
		<div class="project-element-div project-bgcol-white">
			<div class="project-element-in-div project-element-title-div project-element-in-title">선물</div>
			<div class="project-element-in-div project-element-content-div">
				<h4><b>5000원 이상 후원하시는 분께 드리는 선물</b></h4>
				<ol>
					<li>선물 이름 (X 1)</li>
					<li>선물 이름 (X 2)</li>
				</ol>
				선물의 최대 수량은 10개 입니다.
			</div>
		</div>
	</div>
	<div class="project-box">
		<div class="project-element-div project-bgcol-white">
			<div class="project-element-in-div project-element-title-div project-element-in-title">최소 후원 금액</div>
			<div class="project-element-in-div project-description-button">설명</div>
			<div class="project-description-button-panel">
				<p>인기 금액대인 1만원대 선물부터 특별한 의미를 담은 10만원 이상 선물까지, 다양한 금액대로 구성하면 성공률이 더욱 높아집니다. <br>
				배송이 필요한 선물의 경우, 배송비 포함된 금액으로 작성해주세요.</p>
			</div>
			<div class="project-element-in-div project-element-content-div">
				<input type="text" name="gift_price" style="width:200px;" placeholder="최소 1000원 이상"> 원 이상 후원하시는 분께 드리는 선물입니다.
			</div>
		</div>
		<div class="project-element-div project-bgcol-white">
			<div class="project-element-in-div project-element-title-div project-element-in-title">선물에 포함된 아이템</div>
			<div class="project-element-in-div project-description-button">설명</div>
			<div class="project-description-button-panel">
				<p>아이템은 선물에 포함되는 구성 품목을 말합니다. 이 금액대의 선물을 선택한 후원자에게 어떤 아이템들을 얼마나 전달하실건가요?</p>
			</div>
			<div class="project-element-in-div project-element-content-div">
				<div style="border:1px solid rgba(0,0,0,0.15); border-radius: 3px;">
				<table class="project-gift-table">
					<colgroup>
						<col style="width: 7%;">
						<col style="width: 72%;">
						<col>
						<col style="width: 5%;">
						<col>
					</colgroup>
					<thead><tr>
						<th>선택</th><th style="text-align:left;">아이템 이름</th><th colspan="3">수량</th>
					</tr></thead>
					<tbody>
					<tr>
						<td><!-- 아이디 앞에 gift가 붙어있으면 update 아니면  insert -->
							<svg width="31.75" height="32.75" xmlns="http://www.w3.org/2000/svg" xmlns:svg="http://www.w3.org/2000/svg">
							 <g class="gift-chk-btn">
							  <circle r="13.963" cy="16.538" cx="15.963" fill="#E2E2E2"/>
							  <polyline points="  11.942,17.091 15.096,19.96 19.983,15.362 " stroke-miterlimit="10" stroke-linejoin="round" stroke-linecap="round" stroke-width="3" stroke="#000000" fill="none"/>
							 </g>
							</svg>
						</td>
						<td style="text-align:left;">아이템이름이름</td>
						<td>
							<svg width="29.833" height="30" xmlns="http://www.w3.org/2000/svg" xmlns:svg="http://www.w3.org/2000/svg">
							 <g>
							  <circle r="13.963" cy="15.061" cx="15.002" fill="#E2E2E2"/>
							  <line y2="15.06" x2="19.627" y1="15.06" x1="10.377" stroke-miterlimit="10" stroke-linejoin="round" stroke-linecap="round" stroke-width="2" stroke="#000000" fill="none"/>
							 </g>
							</svg>
						</td>
						<td>3434</td>
						<td>
							<svg width="29.833" height="30" xmlns="http://www.w3.org/2000/svg" xmlns:svg="http://www.w3.org/2000/svg">
							 <g>
							  <circle r="13.963" cy="15.061" cx="15.002" fill="#E2E2E2"/>
							  <line y2="15.06" x2="19.627" y1="15.06" x1="10.377" stroke-miterlimit="10" stroke-linejoin="round" stroke-linecap="round" stroke-width="2" stroke="#000000" fill="none"/>
							  <line y2="19.625" x2="14.917" y1="10.375" x1="14.917" stroke-miterlimit="10" stroke-linejoin="round" stroke-linecap="round" stroke-width="2" stroke="#000000" fill="none"/>
							 </g>
							</svg>
						</td>
					</tr>
					<tr>
						<td>
							<svg width="31.75" height="32.75" xmlns="http://www.w3.org/2000/svg" xmlns:svg="http://www.w3.org/2000/svg">
							 <g class="gift-chk-btn">
							  <circle r="13.963" cy="16.538" cx="15.963" fill="#E2E2E2"/>
							  <polyline points="  11.942,17.091 15.096,19.96 19.983,15.362 " stroke-miterlimit="10" stroke-linejoin="round" stroke-linecap="round" stroke-width="3" stroke="#000000" fill="none"/>
							 </g>
							</svg>
						</td>
						<td style="text-align:left;">아이템이름이름</td>
						<td>
							<svg width="29.833" height="30" xmlns="http://www.w3.org/2000/svg" xmlns:svg="http://www.w3.org/2000/svg">
							 <g>
							  <circle r="13.963" cy="15.061" cx="15.002" fill="#E2E2E2"/>
							  <line y2="15.06" x2="19.627" y1="15.06" x1="10.377" stroke-miterlimit="10" stroke-linejoin="round" stroke-linecap="round" stroke-width="2" stroke="#000000" fill="none"/>
							 </g>
							</svg>
						</td>
						<td>1</td>
						<td>
							<svg width="29.833" height="30" xmlns="http://www.w3.org/2000/svg" xmlns:svg="http://www.w3.org/2000/svg">
							 <g>
							  <circle r="13.963" cy="15.061" cx="15.002" fill="#E2E2E2"/>
							  <line y2="15.06" x2="19.627" y1="15.06" x1="10.377" stroke-miterlimit="10" stroke-linejoin="round" stroke-linecap="round" stroke-width="2" stroke="#000000" fill="none"/>
							  <line y2="19.625" x2="14.917" y1="10.375" x1="14.917" stroke-miterlimit="10" stroke-linejoin="round" stroke-linecap="round" stroke-width="2" stroke="#000000" fill="none"/>
							 </g>
							</svg>
						</td>
					</tr>
					</tbody>
				</table>
				</div>
				<br>
				<div align="right"><button class="btn btn-primary">아이템 관리</button></div>
			</div>
		</div>
		<div class="project-element-div project-bgcol-white">
			<div class="project-element-in-div project-element-title-div project-element-in-title">한정판 설정</div>
			<div class="project-element-in-div project-description-button">설명</div>
			<div class="project-description-button-panel">
				<p>한정판 선물을 선택할 수 있는 인원을 제한해주세요. 배송이 필요한 선물인 경우 후원자에게 주소지를 요청합니다.</p>
			</div>
			<div class="project-element-in-div project-element-content-div">
				<input type="checkbox" id="cap-chk" name="capacity-flag" />
				<label for="cap-chk"><span></span>선물의 최대 수량은 <input type="text" style="width:50px;height:30px;text-align:right;" name="capacity" value="0"> 개 입니다.</label>
			</div>
		</div>
	</div>
	<div class="project-box">
		<div class="project-element-div project-bgcol-white">
			<div class="project-element-in-div project-element-content-div">
				<div>선물 추가하기</div>
				<button>추가하기</button>
			</div>
		</div>
	</div>
</div>
<div id="" class="project-div project-outter-div-margin project-title-last">
	<div class="project-title project-title-first">환불 및 교환 정책</div>
	<div class="project-box">
		<div class="project-element-div project-bgcol-white">
			<div class="project-element-in-div project-description-button">설명</div>
			<div class="project-description-button-panel">
				<p>마감일 다음날 결제가 일괄 진행되며 결제된 금액은 자동으로 진행자에게 전달되므로, 그 후의 환불 및 교환 요청은 전적으로 진행자가 약속하는 정책을 따릅니다. 이 프로젝트에 꼭 맞는 환불 및 교환 정책을 신중하게 작성해주세요.</p>
			</div>
			<div class="project-element-in-div project-element-content-div">
				<textarea name="text" maxlength="400" class="reward-input" placeholder="정책 내용" title="상세설명"></textarea>
			</div>
		</div>
	</div>
</div>
</div>

<div id="session-3" class="session">
<div id="" class="project-div project-outter-div-margin project-first project-title-last">
	<div class="project-title project-title-first">소개 영상</div>
	<div class="project-box">
		<div class="project-element-div project-bgcol-white">
			<div class="project-element-in-div project-description-button">설명</div>
			<div class="project-description-button-panel">
				<p>프로젝트를 소개하는 영상을 만들면 내용을 더 효과적으로 알릴 수 있습니다. 2~3분 이내의 짧은 영상이 가장 반응이 좋답니다. 배경음악을 쓰신다면 저작권 문제에 유념해주세요.</p>
			</div>
			<div class="project-element-in-div project-element-content-div">
				<div class="filebox"> 
					<input class="upload-name" value="파일선택" type="hidden" disabled> 
					<label for="ex_filename">동영상 업로드</label> 
					<input type="file" id="ex_filename" class="upload-hidden"> 
				</div>
			</div>
		</div>
	</div>
	<div class="project-title project-title-first">상세 내용</div>
	<div class="project-box">
		<div class="project-element-div project-bgcol-white">
			<div class="project-element-in-div project-description-button">설명</div>
			<div class="project-description-button-panel">
				<p>프로젝트가 펀딩에 성공하게 되면 목표하신 후원 금액 혹은 그 이상을 전달받게 될 것입니다. <br>
				창작 활동에 목표하신 금액이 필요한 이유가 무엇인지, 모금액을 어떤 활동에 사용할 것인지에 대해 구체적으로 알려주세요.<br>
				이거는 시간나면 좀 길게 만들 것 + 이미지도 섞어서</p>
			</div>
			<div class="project-element-in-div project-element-content-div">
				<div id="jieun-textarea-div">
					<form method="post">
						<textarea id="jieuntextarea"  style="height:500px;"></textarea>
					</form>
				</div>
			</div>
			<!-- 임시 -->
			<button onclick="testtinymce()">테스트</button>
		</div>
	</div>
</div>
</div>

<div id="session-4" class="session">
<div id="" class="project-div project-outter-div-margin project-title-last">
	<div class="project-title project-title-first">본인 인증</div>
	<div class="project-box">
		<div class="project-element-div project-bgcol-white">
			<div class="project-element-in-div project-element-title-div project-element-in-title">휴대폰</div>
			<div class="project-element-in-div project-description-button">설명</div>
			<div class="project-description-button-panel">
				<p>진행자님이 연락 받으실 수 있는 휴대폰 연락처를 입력해 주세요. 프로젝트 진행과 관련된 긴급한 사항 전달에만 사용됩니다.</p>
			</div>
			<div class="project-element-in-div project-element-content-div">
				휴대폰 인증
			</div>
		</div>
	</div>
	<div class="project-title project-title-first">후원금 입금 계좌</div>
	<div class="project-box">
		<div class="project-element-div project-bgcol-white">
			<div class="project-element-in-div project-description-button">설명</div>
			<div class="project-description-button-panel">
				<p>모금에 성공할 경우 원(VAT 별도)의 송금 수수료가 발생합니다.</p>
			</div>
		</div>
		<div class="project-element-div project-bgcol-white">
			<div class="project-element-in-div project-element-title-div project-element-in-title">거래 은행</div>
			<div class="project-element-in-div project-element-content-div">
				<select id="project-bank" name="bank" >
					<option value="cate_id">선택하세요.</option>
					<option value="cate_id">국민은행</option>
					<option value="cate_id">우리은행</option>
					<option value="cate_id">하나은행</option>
					<option value="cate_id">우체국</option>
				</select>
			</div>
		</div>
		<div class="project-element-div project-bgcol-white">
			<div class="project-element-in-div project-element-title-div project-element-in-title">예금주 명</div>
			<div class="project-element-in-div project-element-content-div">
				<input type="text" name="BANK_NAME" style="width:300px;" placeholder="계좌에 등록된 예금주명과 일치해야 합니다.">
			</div>
		</div>
		<div class="project-element-div project-bgcol-white">
			<div class="project-element-in-div project-element-title-div project-element-in-title">계좌 번호</div>
			<div class="project-element-in-div project-element-content-div">
				<input type="text" name="BANK_NAME" style="width:300px;" placeholder="후원금을 받을 계좌 번호를 입력하세요.">
			</div>
		</div>
	</div>
</div>
</div>


<script>
	//설명 버튼 ----------------------------------------------------
	var acc = document.getElementsByClassName("project-description-button");
	console.log(acc.length);
	for (var i = 0; i < acc.length; i++) {
	  acc[i].addEventListener("click", function() {
	    this.classList.toggle("project-description-button-active");
	    var panel = this.nextElementSibling;
	    if (panel.style.maxHeight){
	      panel.style.maxHeight = null;
	    } else {
	      panel.style.maxHeight = panel.scrollHeight + "px";
	    } 
	  });
	}	
</script>

<c:import url="/WEB-INF/views/footer.jsp"/>
</body>
</html>