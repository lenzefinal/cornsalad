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
	
	
	body, button, input, select, textarea {
		font-family: Roboto,Noto Sans KR,-apple-system,Dotum,sans-serif;
		font-weight: 400;
		background-color: rgba(253,255,232,0.5);
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
		color: #767676;
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
	
	.project-description-button {
		border: 1px solid rgba(0,0,0,0.1);
		/* background-color: rgba(215,255,73,0.2); */
		background-color: rgba(0,0,0,0.4);
		color: white;
		font-weight: bold;
	    border-radius: .25rem;
	}
	.project-description-button:hover{
		/* background-color: rgba(215,255,73,0.5); */
		background-color: rgba(0,0,0,0.6);
	}
	
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
		background-color: rgba(215,255,73,0.2);
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
		width: 60%; 
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




	
	

</style>
<script>
	$(function(){
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
			var parent = $(this).parent(); 
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
		
		
		//펀딩 마감일
		 $( "#fundingDatepicker" ).datepicker();
		
		
		//처음에는 처음 탭 영역만 보이도록
		 $(".session").attr('style', "display:none");
		 $("#session-1").attr("style", "display:block");
	
	});


	function tapChange(sessionDivId, sessionTapId){
		$(".session").attr("style", "display:none");
		$(sessionDivId).attr("style", "display:block");
		
		$(".tap").removeClass("project-tap-on");
		$(".tap").addClass("project-tap-off");
		
		
		$(sessionTapId).removeClass("project-tap-off");
		$(sessionTapId).addClass("project-tap-on");
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
			<div class="project-element-in-div project-description-button">설명</div>
			<div class="project-element-in-div project-element-content-div">
				<input type="text" name="title" placeholder="프로젝트 제목을 입력해주세요.">
			</div>
		</div>
		<div class="project-element-div project-bgcol-white">
			<div class="project-element-in-div project-element-title-div project-element-in-title">펀딩 카테고리</div>
			<div class="project-element-in-div project-description-button">설명</div>
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
		
			<!-- <div class="preview-image"></div> -->

			<div class="project-element-content-div project-element-in-div">
				<div class="filebox preview-image"> 
					<input class="upload-name" value="파일선택" disabled> 
					<label for="ex_filename">업로드</label> 
					<input type="file" id="ex_filename" class="upload-hidden"> 
				</div>
			</div>
		</div>
		<div class="project-element-div project-bgcol-white">
			<div class="project-element-title-div project-element-in-div project-element-in-title">대표 문구</div>
			<div class="project-element-in-div project-description-button">설명</div>
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
			<div class="project-element-in-div project-element-content-div">
				<input type="text" name="goalPrice" style="width:200px;" placeholder="최소 1000원 이상"> 원
			</div>
		</div>
		<div class="project-element-div project-bgcol-white">
			<div class="project-element-in-div project-element-title-div project-element-in-title">펀딩 마감일</div>
			<div class="project-element-in-div project-description-button">설명</div>
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
			<div class="project-element-in-div project-element-content-div">
				이미 있는 선물 (또 다른 div만들어서)이 없으면 얘도 없겠지
			</div>
		</div>
		<div class="project-element-div project-bgcol-white">
			<div class="project-element-in-div project-element-content-div">
				<div class="project-element-in-div project-description-button">설명</div>
				선물 추가
			</div>
		</div>
	</div>
</div>
<div id="" class="project-div project-outter-div-margin project-title-last">
	<div class="project-title project-title-first">환불 및 교환 정책</div>
	<div class="project-box">
		<div class="project-element-div project-bgcol-white">
			<div class="project-element-in-div project-description-button">설명</div>
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
			<div class="project-element-in-div project-element-content-div">
				<div class="filebox"> 
					에디터 사용
				</div>
			</div>
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
			<div class="project-element-in-div project-element-content-div">
				휴대폰 인증
			</div>
		</div>
	</div>
	<div class="project-title project-title-first">후원금 입금 계좌</div>
	<div class="project-box">
		<div class="project-element-div project-bgcol-white">
			<div class="project-element-in-div project-description-button">설명</div>
			<div class="project-element-in-div project-element-title-div project-element-in-title">거래 은행</div>
			<div class="project-element-in-div project-element-content-div">
				<input type="text" name="BANK_NAME" style="width:200px;" placeholder="은행 이름"> 원
			</div>
		</div>
	</div>
</div>
</div>

<c:import url="/WEB-INF/views/footer.jsp"/>
</body>
</html>