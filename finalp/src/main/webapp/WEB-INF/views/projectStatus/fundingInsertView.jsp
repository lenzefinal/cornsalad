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
<link rel="stylesheet" href="/finalp/resources/css/jquery-ui.css"/>
<script src="/finalp/resources/js/jquery-ui.min.js"></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.4.js"></script>

<style>
	
	
	/* body, button, input, select, textarea {
		font-family: Roboto,Noto Sans KR,-apple-system,Dotum,sans-serif;
		font-weight: 400;
		background-color: rgba(253,255,232,0.5);
	} */
	body{
		background: rgba(220,220,220,0.2);
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
		margin-bottom: 0px;
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
	
	
	
	/* 탭 버튼 ---------------------------------------------------*/
	.project-tap-table{
		margin: auto;
		cellspacing: 0;
	}
	.project-taptable{
		border: 1px solid rgba(0,0,0,0.1);
		border-left: none;
		border-right: none;
		border-top: none;
	}
	.project-tap-table .tap {
		padding: .92857143em 1.42857143em;
		border-radius: .28571429rem .28571429rem 0 0!important;
		cursor: pointer;
		position: relative;
	}
	.project-tap-table .tap em {
		position: absolute;
		z-index: 10;
		right: 0;
		bottom: 0;
		left: 0;
		border-bottom: 3px solid #F7D358;
		opacity: 0;
		transition: 0.4s;
	}
	
	.project-tap-table .tap .project-tap-em-active{
		opacity: 1;
		transition: 0.4s;
	}
	.project-tap-table .tap .project-tap-em-hover{
		opacity: 1;
		transition: 0.4s;
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
		padding: 1.0em 1.5em 1.0em 1.5em;
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
		background-color: #3b4c53;
		color: white;
		font-weight: bold;
	    border-radius: .25rem;
	    
	    transition: 0.4s;
	}
	.project-description-button:hover,
	.project-description-button-active {
		/* background-color: rgba(215,255,73,0.5); */
		background-color: #1ea18e;
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
	
	/* 기본 색 ------------------------------------------------------*/
	/*		#FFFBC5;			*/
	
	.project-element-content-div{
		opacity: 0.7;
		border: 3px solid #f9bf30;
		background-color: #f9bf30;
		/* border: 3px solid #FFC72B;
		background-color: white; */
		/* border: 1px solid rgba(0,0,0,0.1);
		background-color: #FFFBC5; *//* rgba(215,255,73,0.2); */
		/* background-color: rgba(0,0,0,0.4); */
	    border-radius: .25rem;
	}
	.project-element-content-div input[type=text],
	.project-element-content-div input[type=email],
	.project-element-content-div input[type=tel],
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
		color: white; 
		font-size: inherit; 
		line-height: normal; 
		vertical-align: middle; 
		background-color: #27a399; 
		cursor: pointer; 
		border: 1px solid #27a399; 
		border-bottom-color: #27a399; 
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




	/* 선물 안 아이템 테이블 -----------------------------------------------------*/
	.project-gift-in-item-table{
	    border-collapse: collapse;
	    width: 100%;
	    background-color:white;
	    margin-bottom:0px;
	}
	.project-gift-in-item-table th, 
	.project-gift-in-item-table td{
		padding: 8px;
	    text-align: center;
	}
	.project-gift-in-item-table th{
		background-color: rgba(0,0,0,0.1);
	}
	.project-gift-in-item-table td{
		 border-top: 1px solid #ddd;
		 
	}
	.project-gift-in-item-table tr{
		transition: 0.4s;
	}
	
	.project-gift-in-item-table .project-gift-in-item-check{
		background-color: #28a49a;
		transition: 0.4s;
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
	
	
	/* 선물 안 아이템 수량 ----------------------------------------------*/
	..itemcount-minus,
	.itemcount-plus{
		cursor: pointer;
	}
	.itemcount-minus circle,
	.itemcount-plus circle {
		fill: #E2E2E2;
		transition: 0.4s;
	}
	
	.itemcount-minus line,
	.itemcount-plus line {
		stroke: #000000;
	}
	
	.itemcount-minus:hover circle,
	.itemcount-plus:hover circle {
		fill: #F7D358;
		transition: 0.4s;
	}
	
	.itemcount-minus_plus-mousedown line{
		stroke: #FFFFFF;
	}
	
	/* 취소하기 / 수정하기 / 삭제하기 버튼 */
	.project-custom-btn{
		display: inline-block;
		margin-left: 10px;
	}
	
	
	.gift-pretitle-style{
		font-weight: bold;
		font-size: 14pt;
		padding-bottom: 10px;
	}
	
	.btn-primary{
		border: 1px solid #3e4b53;
		background-color: white;
		color: #3e4b53;
	}
	.btn-primary:hover{
		border: 1px solid #3e4b53;
		background-color: #3e4b53;
		color: white;
	}
	
	.btn-danger{
		border: 1px solid #3e4b53;
		background-color: #3e4b53;
		color: white;
	}
	.btn-danger:hover{
		border: 1px solid black;
		background-color: black;
		color: white;
	}
	
	.btn-greentea-invert{
		border:1px solid #26a499;
		background-color: #26a499;
		color: white;
		height:50px;
		font-weight: bold;
	}
	.btn-greentea-invert:hover{
		border:1px solid #26a499;
		background-color: white;
		color: #26a499;
		height:50px;
	}
	.btn-greentea:hover path{
		fill: white;
	}
	
	
	/* 인증 관련 */
	.field em.error,
	em.timeout {
		color: #f66;
	}
	
	input.error[type=text],
	input.error[type=email]{
		border-color: #f66;
	}
	
	/* 탭 위에 */
	.project-notice{
		border: 1px solid #f9bf30;
    	border-radius: .25rem;
    	font-weight: bold;
    	color: rgba(0,0,0,0.3);
    	text-align: center;
    	padding: 15px 0px 0px 15px;
	}
	
	.btn-greenteareverse-submit{
		border:1px solid #26a499;
		background-color: #26a499;
		color: white;
	}
	
	textarea#refundrole-textarea{
		min-height: 200px;
		overflow-y:scroll;
	}
	
</style>


<script src="https://cloud.tinymce.com/stable/tinymce.min.js?apiKey=n950z8giku55kswh4gbnzrjj5d4wgtd69uzc7hg7jkp1r2yd"></script>


<script>
//ajax용

//카테고리 전체 가져오기
function getCategoryListFunc(){
	//컨트롤러로 부터 리스트를 받아서 출력 처리함
	$.ajax({
		url: "proStscategoryList.do",
		type: "post",
		dataType: "json",
		success: function(data){
			//리턴된 하나의 객체를 문자열로 변환
			var jsonStr = JSON.stringify(data);
			//변환된 문자열을 json 객체로 변환
			var json = JSON.parse(jsonStr);
			
			var values = "<option value=''>선택하세요.</option>";
			
			for(var i in json.list){
				values += '<option value="'+ json.list[i].categoryId +'">' +
						decodeURIComponent(json.list[i].categoryName) +'</option>';
			}
			
			$("#project-category").html(values);
		},
		error: function(request, status, errorData){
			alert("error code: " + request.status + "\n"
					+ "message : " + request.responseText + "\n"
					+ "error : " + errorData);
		}
	});
}

//카테고리 아이디에 따라 서브 카테고리 리스트 가져오기
function getSubCategoryListFunc(categoryId){
	//컨트롤러로 부터 리스트를 받아서 출력 처리함
	$.ajax({
		url: "proStsSubcategoryListByCaId.do",
		type: "post",
		data: {"categoryId": categoryId},
		dataType: "json",
		success: function(data){
			//리턴된 하나의 객체를 문자열로 변환
			var jsonStr = JSON.stringify(data);
			//변환된 문자열을 json 객체로 변환
			var json = JSON.parse(jsonStr);
			
			var values = "<option value=''>선택하세요.</option>";
			
			for(var i in json.list){
				values += '<option value="'+ json.list[i].subCategoryId +'">' +
						decodeURIComponent(json.list[i].subCategoryName) +'</option>';
			}
			
			$("#project-sub-category").html(values);
		},
		error: function(request, status, errorData){
			alert("error code: " + request.status + "\n"
					+ "message : " + request.responseText + "\n"
					+ "error : " + errorData);
		}
	});
}

//은행 명 리스트 가져오기
function getBankList(){
	//컨트롤러로 부터 리스트를 받아서 출력 처리함
	$.ajax({
		url: "proStsBankList.do",
		type: "post",
		dataType: "json",
		success: function(data){
			//리턴된 하나의 객체를 문자열로 변환
			var jsonStr = JSON.stringify(data);
			//변환된 문자열을 json 객체로 변환
			var json = JSON.parse(jsonStr);
			
			var values = "<option value=''>선택하세요.</option>";
			
			for(var i in json.list){
				values += '<option value="'+ json.list[i].bankId +'">' +
						decodeURIComponent(json.list[i].bankName) +'</option>';
			}
			
			$("#project-bank").html(values);
		},
		error: function(request, status, errorData){
			alert("error code: " + request.status + "\n"
					+ "message : " + request.responseText + "\n"
					+ "error : " + errorData);
		}
	});
}


//insert ========================================================================
function insertProjectFunc(){
	//자바스크립트 또는 제이쿼리에서 json 객체를 만들어서
	//서버 쪽 컨트롤러로 전송하기 
	
	$.ajax({
		url: "insertProject.do",
		data: {"projectCategoryId" : "PC-FUND"},
		type: "post",
		success: function(result){
			console.log("ajax로 받은아이디]"+result);
			$("#project-id-input").val(result);
		},
		error: function(request, status, errorData){
			alert("error code: " + request.status + "\n"
					+ "message : " + request.responseText + "\n"
					+ "error : " + errorData);
		}
	}); 

}

function projectPreImgUploadFunc(){
	
	console.log("대표이미지 ajax로 등록");
	var form = $("#projectRepImageUploadForm")[0];
	var formData = new FormData(form);
	formData.append("fileObj", $("#ex_filename")[0].files[0]);
	/* formData.append("project_id", $("#project-id-input").val()); */

	$.ajax({
		url: "projectRepImageUpload.do",
		processData: false,
		contentType: false,
		data: formData,
		type: 'POST',
		success: function(){
			console.log("대표 이미지 업로드 성공");
		},
		error: function(request, status, errorData){
			alert("error code: " + request.status + "\n"
					+ "message : " + request.responseText + "\n"
					+ "error : " + errorData);
		}
	});
}

function updateProjectFunc(){
	
	var project = new Object();
	project.project_id = $("#project-id-input").val();
	project.category_sub_id = $("#project-sub-category").val();
	project.project_name = $("#project-title-input").val();
	project.rep_content = $("#repcontent-textarea").val();
	project.target_amount = $("#goalprice-input").val();
	project.end_date = $("#fundingDatepicker").val();
	project.refund_role = $("#refundrole-textarea").val();
	project.certif_flag = $("#certifflag_input").val();
	project.request_flag = $("#request_flag-input").attr("value");
	
	console.log("project.target_amount]"+project.target_amount);
	
	if(project.target_amount == "undefined"){
		console.log("안돼");
		project.target_amount = 0;
	}
	
	$.ajax({
		url: "updateProject.do",
		data: JSON.stringify(project),
		type: "post",
		async: false,
		contentType: "application/json; charset=UTF-8",
		success: function(){
			console.log("프로젝트 업데이트 성공")
		},
		error: function(request, status, errorData){
			alert("error code: " + request.status + "\n"
					+ "message : " + request.responseText + "\n"
					+ "error : " + errorData);
		}
	}); 

}

function insertProjectContentFunc(){
	
	var content = new Object();
	content.project_id = $("#project-id-input").val();
	content.video_url = $("#content-videourl-input").val();
	content.content = tinymce.get("jieuntextarea").getContent();
	
	$.ajax({
		url: "insertProjectContent.do",
		data: JSON.stringify(content),
		type: "post",
		async: false,
		contentType: "application/json; charset=UTF-8",
		success: function(){
			console.log("프로젝트 컨텐츠 insert 성공")
		},
		error: function(request, status, errorData){
			alert("error code: " + request.status + "\n"
					+ "message : " + request.responseText + "\n"
					+ "error : " + errorData);
		}
	}); 

}

function insertProjectAccountFunc(){
	
	var content = new Object();
	content.project_id = $("#project-id-input").val();
	content.bank_id = $("#project-bank option:selected").val();
	content.account_name = $("#accountName-input").val();
	content.account_number = $("#accountNumber-input").val();
	
	$.ajax({
		url: "insertProjectAccount.do",
		data: JSON.stringify(content),
		type: "post",
		async: false,
		contentType: "application/json; charset=UTF-8",
		success: function(){
			console.log("프로젝트 계좌 insert 성공")
		},
		error: function(request, status, errorData){
			alert("error code: " + request.status + "\n"
					+ "message : " + request.responseText + "\n"
					+ "error : " + errorData);
		}
	}); 

}

function insertGiftFunc(){
	
	var idesArr = [];
	var giftEles = document.getElementsByClassName("gift-body-div");
	for(var i=0; i<giftEles.length; ++i){
		idesArr[i] = giftEles[i].getAttribute("id");
	}
	
	var giftesArr = [];
	for(var i=0; i<giftEles.length; ++i){
		var idSeletor = "#"+idesArr[i];
		var gift = new Object();
		
		gift.gift_id = idesArr[i];
		gift.support_price = $(idSeletor + " .gift-supportPrice-input").val(); //후원금액
		
		var capacityValue = "0";
		if($(idSeletor + " .capacity-flag").is(":checked")){
			capacityValue = $(idSeletor + " .gift-capacity-input").val();
		}
		gift.capacity = capacityValue;
		
		gift.project_id = $("#project-id-input").val();
		
		//배열에 넣기
		giftesArr[i] = gift;
	}
	
	$.ajax({
		url: "insertGift.do",
		data: JSON.stringify(giftesArr),
		type: "post",
		async: false,
		contentType: "application/json; charset=UTF-8",
		success: function(result){
			console.log("선물 insert 성공")
		},
		error: function(request, status, errorData){
			alert("error code: " + request.status + "\n"
					+ "message : " + request.responseText + "\n"
					+ "error : " + errorData);
		}
	});
	
}

function insertItemFunc(){
	
	var idesArr = [];
	var itemEles = document.getElementsByClassName("modal-item-list-basic");
	for(var i=0; i<itemEles.length; ++i){
		idesArr[i] = itemEles[i].getAttribute("id");
	}
	
	var itemesArr = [];
	for(var i=0; i<itemEles.length; ++i){
		var idSeletor = "#"+idesArr[i];
		var item = new Object();
		
		item.item_id = idesArr[i];
		item.item_name = $(idSeletor + " .modal-item-list-name").attr("value");
		
		item.project_id = $("#project-id-input").val();
		
		//배열에 넣기
		itemesArr[i] = item;
	}

	
	$.ajax({
		url: "insertItem.do",
		data: JSON.stringify(itemesArr),
		type: "post",
		async: false,
		contentType: "application/json; charset=UTF-8",
		success: function(result){
			console.log("아이템 insert 성공")
		},
		error: function(request, status, errorData){
			alert("error code: " + request.status + "\n"
					+ "message : " + request.responseText + "\n"
					+ "error : " + errorData);
		}
	});
	
}

function insertGiftInItemFunc(){
	
	var index = 0;
	var setArr = [];
	
	var giftEles = document.getElementsByClassName("gift-body-div");
	
	console.log("giftEles]"+giftEles.length);
	
	for(var i=0; i<giftEles.length; ++i){
		var giftId = giftEles[i].getAttribute("id");
		var giftIdSeletor = "#" + giftId;
		var thisGift = document.getElementById(giftId);
		
		var itemEles = thisGift.getElementsByClassName("gift-in-item-list");
		
		console.log("itemEles]"+itemEles.length);
		
		for(var j=0; j<itemEles.length; ++j){
			var itemId = itemEles[j].getAttribute("value");
			
			if($(giftIdSeletor + " ."+itemId + " .gift-chk-btn").hasClass("gift-chk-btn-active")){
				
				var giftinitem = new Object();
				giftinitem.gift_id = giftId;
				giftinitem.item_id = itemId;
				giftinitem.count = $(giftIdSeletor + " ."+itemId + " .gift-in-item-count").attr("value");
				
				setArr[index] = giftinitem;
				index++;
			}
		}
	}
	
	$.ajax({
		url: "insertGitfInItem.do",
		data: JSON.stringify(setArr),
		type: "post",
		async: false,
		contentType: "application/json; charset=UTF-8",
		success: function(result){
			console.log("선물 속 아이템 insert 성공")
		},
		error: function(request, status, errorData){
			alert("error code: " + request.status + "\n"
					+ "message : " + request.responseText + "\n"
					+ "error : " + errorData);
		}
	});
	
}


</script>

<script>
	$(function(){
		//ajax로 값 가져오기 ====================================================================================
		//카테고리 리스트
		getCategoryListFunc();
		
		//은행 리스트
		getBankList();
		
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
			
			//대표이미지 서버에 등록 --------------------------------------
			projectPreImgUploadFunc();
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
							+ src + '" class="upload-thumb" style="width:600px;"></div></div>'); 
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
		
		$('#fundingDatepicker').on('change', function() {
				var pickerDate = $("#fundingDatepicker").datepicker("getDate").getTime();
				var currentDate = new Date().getTime();
				
				var gap = Math.ceil((pickerDate - currentDate)/1000/60/60/24);
				$("#dday-input").attr("value", gap);
		});
		
		
		//처음에는 처음 탭 영역만 보이도록 -----------------------------------------
		 $(".session").attr('style', "display:none");
		 $("#session-1").attr("style", "display:block");
		 
		//탭 버튼에 hover됐을 때
		$(".tap").on("mouseover", function(){
			$("#"+this.id+" em").addClass("project-tap-em-hover");
		});
		$(".tap").on("mouseout", function(){
			$("#"+this.id+" em").removeClass("project-tap-em-hover");
		});
	
		 
	    
		//아이템 체크, 수량 버튼
		settingItemListChk_Count_btn();
		
		
		
		//영역을 벗어나고 mousedown 이벤트가 발생했을 때 계속 증감되는 버그 방지 코드
		window.addEventListener("mouseup", function(){
			console.log("들어옴");
			clearTimeout($(".itemcount-plus").downTimer);
			$(".itemcount-plus").removeClass("itemcount-minus_plus-mousedown");
			
			clearTimeout($(".itemcount-minus").downTimer);
			$(".itemcount-minus").removeClass("itemcount-minus_plus-mousedown");
		});
		/* $(window).mouseup(function(){
			
		}); */
	    //itemcount-minus_plus-mousedown
	    
	    
	    
	    
	    //선물 추가 버튼
	    $(".gift-add-btn").on("click", function(){
	    	descriptionBtnFunc();
	    	
	    	var giftId = new Date().getTime();
	    	
	    	var value = $("#gift-totalbox-div").html();
	    	value += '<div id="'+ giftIndex +'" class="project-box gift-head-div '+ giftId + '">' +
						'<div class="project-element-div project-bgcol-white">' +
							'<div class="project-element-in-div">' +
								'<div align="right">' +
									'<button class="btn btn-danger project-custom-btn" onclick="deleteGift(' + giftId + ',1)">삭제하기</button>' + 
									'<button class="btn btn-primary project-custom-btn" onclick="updateGift(' + giftId + ')">수정하기</button>' +
								'</div>' + 
								'<div class="gift-pretitle-style" style="display:inline-block;"><span class="gift-price">0</span>원 이상 후원하시는 분께 드리는 선물</div>' +
								'<ol></ol>' +
							'</div>' +
						'</div>' +
					'</div>' +
					'<div id="' + giftId + '" class="project-box gift-body-div">' +
						'<div class="project-element-div project-bgcol-white">' +
							'<div class="project-element-in-div project-element-title-div project-element-in-title">최소 후원 금액</div>' +
							'<div class="project-element-in-div project-description-button">설명</div>' +
							'<div class="project-description-button-panel">' +
								'<p>인기 금액대인 1만원대 선물부터 특별한 의미를 담은 10만원 이상 선물까지, 다양한 금액대로 구성하면 성공률이 더욱 높아집니다. <br>' +
								'배송이 필요한 선물의 경우, 배송비 포함된 금액으로 작성해주세요.</p>' +
							'</div>' +
							'<div class="project-element-in-div project-element-content-div">' +
								'<input type="text" class="gift-supportPrice-input" style="width:200px;" placeholder="0원부터 시작합니다." value="1000"> 원 이상 후원하시는 분께 드리는 선물입니다.' +
							'</div>' +
						'</div>' +
						'<div class="project-element-div project-bgcol-white">' +
							'<div class="project-element-in-div project-element-title-div project-element-in-title">선물에 포함된 아이템</div>' +
							'<div class="project-element-in-div project-description-button">설명</div>' +
							'<div class="project-description-button-panel">' +
								'<p>아이템은 선물에 포함되는 구성 품목을 말합니다. 이 금액대의 선물을 선택한 후원자에게 어떤 아이템들을 얼마나 전달하실건가요?</p>' +
							'</div>' +
							'<div class="project-element-in-div project-element-content-div">' +
								'<div style="border:1px solid rgba(0,0,0,0.15); border-radius: 3px;">' +
								'<table class="project-gift-in-item-table">' +
									'<colgroup>' +
										'<col style="width: 7%;">' +
										'<col style="width: 72%;">' +
										'<col>' +
										'<col style="width: 5%;">' +
										'<col>' +
									'</colgroup>' +
									'<tr>' +
										'<th>선택</th><th style="text-align:left;">아이템 이름</th><th colspan="3">수량</th>' +
									'</tr>' +
								'</table>' +
								'</div>' +
								'<br>' +
								'<div align="right"><button class="btn btn-primary" data-toggle="modal" data-target="#itemManager-modal" style="width:120px;height:45px;">아이템 관리</button></div>' +
							'</div>' +
						'</div>' +
						'<div class="project-element-div project-bgcol-white">' +
							'<div class="project-element-in-div project-element-title-div project-element-in-title">한정판 설정</div>' +
							'<div class="project-element-in-div project-description-button">설명</div>' +
							'<div class="project-description-button-panel">' +
								'<p>한정판 선물을 선택할 수 있는 인원을 제한해주세요. 배송이 필요한 선물인 경우 후원자에게 주소지를 요청합니다.</p>' +
							'</div>' +
							'<div class="project-element-in-div project-element-content-div">' +
								'<input type="checkbox" id="cap-chk'+giftId+'" class="capacity-flag" name="capacity-flag" onchange="changeGiftCapacityChk('+ giftId +')" value="'+ giftId +'"/>' +
								'<label for="cap-chk'+giftId+'"><span></span>선물의 최대 수량은 <input type="text" class="gift-capacity-input" style="width:50px;height:30px;text-align:right;" name="capacity" value="0"> 개 입니다.</label>' +
								'<input type="hidden" class="capacity-flag-save-input" value="0">' +
							'</div>' +
						'</div>' +
						'<div align="right" class="project-bgcol-white" style="padding:0px 30px 20px 0px;">' +
							'<button class="btn btn-primary project-custom-btn" onclick="cancleGift('+ giftId + ')"><b>x</b> 취소하기</button>' +
							'<button class="btn btn-danger project-custom-btn" onclick="deleteGift('+ giftId + ',0)">삭제하기</button>' +
							'<button class="btn btn-primary project-custom-btn" onclick="saveGift('+ giftId + ')">저장하기</button>' +
						'</div>' +
					'</div>';
			
			giftIndex++;
				
	    	$("#gift-totalbox-div").html(value);
	    	
	    	$("."+giftId).hide();
	    	$("#"+giftId).hide();
	    	$("#"+giftId).fadeToggle(toggleSpeed);
	    	
	    	console.log("개수가"+$(".modal-item-list-basic").length);
	    	//생성된 아이템이 없으면 빈 아이템을 생성
	    	if($(".modal-item-list-basic").length == 0){
	    		addEmptyItemFunc(giftId);
	    	}
	    	else{//이미 존재하는 아이템들 각 선물에 추가
	    		var itemList = document.getElementsByClassName("modal-item-list-basic");
	    	
	    		console.log(itemList.length);
	    		for(var i=0; i<itemList.length; ++i){
	    			var loc_itemId = itemList[i].id;
	    			console.log("[loc_itemId]"+loc_itemId);
	    			
	    			addGiftInItemFunc(giftId, loc_itemId);
	    		}
	    	}
	    	
	    	//선물 추가 버튼 박스는 안보이게
	    	$(".gift-add-btn-box").hide();
	    	
	    	//설명 버튼 이벤트 연결
	    	descriptionBtnFunc();
	    	
	    	settingItemListChk_Count_btn();
	    	
	    	//선물 한정 수량 버튼 계속 초기화 되는거 막는 코드
	    	setTotalGiftCapacityChk();
	    	
	    });
		
		//아이템 추가 버튼
		$(".item-add-btn").on("click", function(){
			var value = '<div class="modal-item-adddetail-div">' +
							'<div style="padding:1em;">' +
								'<div style="color:rgba(0,0,0,0.6);"><b>아이템 이름</b></div>' +
								'<div style="padding: 10px 0px 10px 0px;"><input type="text" placeholder="새로 만들 아이템의 이름을 입력하세요." autofocus>/></div>' +
								'<div align="right">' +
									'<button class="btn btn-default btn-greentea project-custom-btn" onclick="cancleItem()"><b>x&nbsp;취소하기</b></button>' +
									'<button class="btn btn-primary btn-greentea project-custom-btn" onclick="saveItem()"><b>저장하기</b></button>' +
								'</div>' +
							'</div>' +
						'</div>';
			
			$(".modal-item-adddetail-location").html(value);
			
			$(".modal-item-add-div").slideToggle(toggleSpeed);
			$(".modal-item-adddetail-location").hide();
			$(".modal-item-adddetail-location").slideToggle(toggleSpeed);
			
			
		});
		
		//아이템 리스트는 처음에 보여서는 안 됨(처음은 아이템 리스트가 없기 때문)
		$("#modal-item-list-box").hide();
		
		//설명 버튼 이벤트 연결
		descriptionBtnFunc();
		
		//처음에 페이지 들어올 때 프로젝트를 생성	-------------------insert-------------------------------------
		insertProjectFunc();
		
		
		//페이지 나갈 때 실행되는 함수 ============================================================================
		$(window).on("beforeunload", function (){
			updateProjectFunc();
			insertProjectContentFunc();
			insertProjectAccountFunc();
			
			insertGiftFunc();
			insertItemFunc();
			insertGiftInItemFunc();
			//return "레알 나감????????????";
		});
		
		
		 
	});//ready end
	
	//빈 아이템 추가 함수 ---------------------------------------------------
	function addEmptyItemFunc(giftId){
		var itemValue = $("#"+giftId+" .project-gift-in-item-table").html();
		itemValue += '<tr class="gift-in-item" value="itemId">' +
						'<td>' +
							'<svg width="31.75" height="32.75" xmlns="http://www.w3.org/2000/svg" xmlns:svg="http://www.w3.org/2000/svg">' +
							 '<g class="gift_chk_btn" value="#' + giftId + ' .gift-in-item">' +
							  '<circle r="13.963" cy="16.538" cx="15.963" fill="#E2E2E2"/>' +
							  '<polyline points="  11.942,17.091 15.096,19.96 19.983,15.362 " stroke-miterlimit="10" stroke-linejoin="round" stroke-linecap="round" stroke-width="3" stroke="#000000" fill="none"/>' +
							 '</g>' +
							'</svg>' +
						'</td>' +
						'<td style="text-align:left;"><div class="gift_in_item_name" value="">아이템을 생성해주세요</div></td>' +
						'<td>' +
							'<svg width="29.833" height="30" xmlns="http://www.w3.org/2000/svg" xmlns:svg="http://www.w3.org/2000/svg">' +
							 '<g class="itemcount_minus" value="#' + giftId + ' .gift-in-item">' +
							  '<circle r="13.963" cy="15.061" cx="15.002" fill="#E2E2E2"/>' +
							  '<line y2="15.06" x2="19.627" y1="15.06" x1="10.377" stroke-miterlimit="10" stroke-linejoin="round" stroke-linecap="round" stroke-width="2" stroke="#000000" fill="none"/>' +
							 '</g>' +
							'</svg>' +
						'</td>' +
						'<td><div class="gift-in-item-count" value="0" >0</div></td>' +
						'<td>' +
							'<svg width="29.833" height="30" xmlns="http://www.w3.org/2000/svg" xmlns:svg="http://www.w3.org/2000/svg">' +
							 '<g class="itemcount_plus" value="#' + giftId + ' .gift-in-item">' +
							  '<circle r="13.963" cy="15.061" cx="15.002" fill="#E2E2E2"/>' +
							  '<line y2="15.06" x2="19.627" y1="15.06" x1="10.377" stroke-miterlimit="10" stroke-linejoin="round" stroke-linecap="round" stroke-width="2" stroke="#000000" fill="none"/>' +
							  '<line y2="19.625" x2="14.917" y1="10.375" x1="14.917" stroke-miterlimit="10" stroke-linejoin="round" stroke-linecap="round" stroke-width="2" stroke="#000000" fill="none"/>' +
							 '</g>' +
							'</svg>' +
						'</td>' +
					'</tr>';
			
		$("#"+giftId+" .project-gift-in-item-table").html(itemValue);
	}
	
	//아이템 체크, 수량 버튼 ------------------------------------------------
	function settingItemListChk_Count_btn(){
		
		//선물 체크 버튼 
	    $(".gift-chk-btn").on("click", function(){
	    	
	    	console.log("선물체크버튼 클릭");
	    	var countSelector = $(this).attr("value")+" .gift-in-item-count";
	    	
	    	if($(this).hasClass("gift-chk-btn-active")){//선택 해제
	    		
	    		$(countSelector).attr("value", 0);
	    		$(countSelector).text(0);
	    	} 
	    	else{
	    		var count = 0;
	    		
	   			if($(countSelector).attr("value") == 0){
	   				count = 1;
	   			} 
	   			else{
	   				count = $(countSelector).attr("value");
	   			}
	   			
	    		$(countSelector).attr("value", count);
	    		$(countSelector).text(count);
	    	}
	    	
	    	$(this).toggleClass("gift-chk-btn-active");
	    	$($(this).attr("value")).toggleClass("project-gift-in-item-check");
	    	
	    });
	    
	    //수량 버튼 
		$(".itemcount-minus").on("mousedown", function() {
	        clearTimeout(this.downTimer);
	        
	        var thisValue = $(this).attr("value");
	       
	        this.downTimer = setInterval(function() {
	        	//버튼 눌렀을 때 실행될 코드
	            var itemcountTagId = thisValue + " .gift-in-item-count";
	        	var itemCount = Number($(itemcountTagId).attr("value"));
	        	var totalCount = 0;
	        	
	        	if(itemCount > 0){
	        		totalCount = itemCount - 1;
	        		$(itemcountTagId).attr("value", totalCount);
		        	$(itemcountTagId).text(totalCount);
	        	}
	        	
	        }, 100);
	       
	        $(this).addClass("itemcount-minus_plus-mousedown");
	        
	    }).mouseup(function(e) {
	        clearTimeout(this.downTimer);
	        $(this).removeClass("itemcount-minus_plus-mousedown");
	    });
	    
		$(".itemcount-plus").mousedown(function(e) {
			clearTimeout(this.downTimer);
		        
	        var thisValue = $(this).attr("value");
	       
	        this.downTimer = setInterval(function() {
	        	//버튼 눌렀을 때 실행될 코드
	            var itemcountTagId = thisValue + " .gift-in-item-count";
	        	var totalCount = Number($(itemcountTagId).attr("value")) + 1;
	        	
	        	$(itemcountTagId).attr("value", totalCount);
	        	$(itemcountTagId).text(totalCount);
	        	
	        }, 100);
	       
	        $(this).addClass("itemcount-minus_plus-mousedown");
	        
	    }).mouseup(function(e) {
	    	 clearTimeout(this.downTimer);
		     $(this).removeClass("itemcount-minus_plus-mousedown");
	    });
		
	}

	
	//탭 버튼 색 ---------------------------------------------
	function tapChange(sessionDivId, sessionTapId){
		$(".session").attr("style", "display:none");
		$(sessionDivId).attr("style", "display:block");
		
		$(".tap em").removeClass("project-tap-em-active")
		$(sessionTapId + " em").addClass("project-tap-em-active");
		
		//선물 수정 영역 안보이게
		$(".gift-body-div").hide();
		$(".gift-head-div").show();
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
	
	//선물 ------------------------------------------------------------------
	//선물 index
	giftIndex = 0;
	//선물 id pre
	giftIdPre = "gift-in-item";
	
	
	//선물 토글 스피드
	toggleSpeed = 300;
	
	//선물 수정 취소
	function cancleGift(giftIdIndex){
		$("."+giftIdIndex).slideToggle(toggleSpeed);
		$("#"+giftIdIndex).slideToggle(toggleSpeed);
		
		//선물 추가 버튼 박스 보이게
    	$(".gift-add-btn-box").show();
		
    	var targetId = $(giftId_class).attr("id");
		location.href="#"+targetId;
	}
	
	//선물 삭제
	function deleteGift(giftId, flag){
		if(flag == 0){
			$("#gift-totalbox-div "+"#"+giftId).fadeToggle(toggleSpeed,function(){
				$("#gift-totalbox-div "+"."+giftId).remove();
				$("#gift-totalbox-div "+"#"+giftId).remove();
			});
			
			//선물 추가 버튼 박스 보이게
	    	$(".gift-add-btn-box").show();
		} 
		else if(flag == 1){		
			$("#gift-totalbox-div "+"."+giftId).fadeToggle(toggleSpeed,function(){
				$("#gift-totalbox-div "+"."+giftIdx).remove();
				$("#gift-totalbox-div "+"#"+giftId).remove();
			});
		}
		else{
			$("#gift-totalbox-div "+"."+giftId).remove();
			$("#gift-totalbox-div "+"#"+giftId).remove();
		}
	}
	
	//선물 저장
	function saveGift(giftId){
		var giftId_class = "."+giftId;
		var giftId_id = "#"+giftId;
		
		$(giftId_class).slideToggle(toggleSpeed);
		$(giftId_id).slideToggle(toggleSpeed);
		
		//내용을 선물 헤드에 저장
		
		//후원 금액
		var priceValue = $(giftId_id+" .gift-supportPrice-input").val();
		var priceValueCom = comma(priceValue);
		
		$(giftId_class+" .gift-price").attr("value", priceValueCom);
		$(giftId_class+" .gift-price").text(priceValueCom);
		
		$(giftId_id+" .gift-supportPrice-input").attr("value", priceValue);
		
    	//선물 헤드에 체크한 아이템 추가
    	var giftInItemChkBtnList = $(giftId_id+" .gift-chk-btn-active");//document.getElementsByClassName("gift-chk-btn");
    	console.log("과연"+giftInItemChkBtnList.length);
    	
    	var giftHeadItemValue = "";
    	for(var i=0; i<giftInItemChkBtnList.length; ++i){
    		//체크된 아이템이면
   			var itemId = $(giftInItemChkBtnList[i].getAttribute("value")+" .gift-in-item-hidden-itemId").val();
   	    	var itemCount = $(giftInItemChkBtnList[i].getAttribute("value")+" .gift-in-item-count").attr("value");
   	    	var itemName = $(giftInItemChkBtnList[i].getAttribute("value")+" .gift_in_item_name").attr("value");
   	    	
   	    	console.log("itemid]"+itemId);
   	    	console.log("giftId]"+giftId);
   	    	console.log("itemCount]"+itemCount);
   	    	console.log("itemName]"+itemName);
   	    	
   	    	
   	    	/* var giftHeadItemValue = $(".gift-head-div"+" ."+itemId+" ol").html(); */
   			giftHeadItemValue += '<li class="'+itemId+'">' +
   									'<span class="gift-item-name" value="'+itemName+'">'+itemName+'</span> (X <span class="gift-item-count">'+itemCount+'</span>)</li>';
    	}
    	
    	$(giftId_class+" ol").html(giftHeadItemValue);
    	
    	
    	var capacityValue = $(giftId_id+" .gift-capacity-input").val();
    	$(giftId_id+" .gift-capacity-input").attr("value", capacityValue);
								
		//선물 추가 버튼 박스 보이게
    	$(".gift-add-btn-box").show();
		
    	var targetId = $(giftId_class).attr("id");
		location.href="#"+targetId;
	}
	
	//선물 수정
	function updateGift(giftId){
		$(".gift-head-div").show();
		$(".gift-body-div").hide();
		
		$("."+giftId).hide();
		$("#"+giftId).fadeToggle(toggleSpeed);
		
		//선물 추가 버튼 박스는 안보이게
    	$(".gift-add-btn-box").hide();
		
    	var priceValue = $("."+giftId+" .gift-supportPrice-input-div").attr("value");
    	$("."+giftId+" .gift-supportPrice-input").val(priceValue);
		
	}
	
	//아이템 -----------------------------------------------------------------
	
	//아이템 추가 취소
	function cancleItem(){
		$(".modal-item-adddetail-location").slideToggle(toggleSpeed, function(){
			$(".modal-item-adddetail-div").remove();
		});
		
		$(".modal-item-add-div").slideToggle(toggleSpeed);
	}
	
	//아이템 저장
	function saveItem(){
		var itemName = $(".modal-item-adddetail-div input").val();
		
		var itemId = new Date().getTime();
		
		var value = $(".modal-item-table").html();
		value += '<tr id="' + itemId + '" class="modal-item-list-basic">' +
						'<td style="text-align:left; padding-left:20px;" class="modal-item-list-name" value="'+ itemName +'">'+ itemName + '</td>' +
						'<td style="padding-right:20px;"><button class="btn btn-default" onclick="showUpdateItem('+ itemId +')"><b>수정하기</b></button></td>' +
						'<td style="padding-right:20px;"><button class="btn btn-default" onclick="deleteListItem('+ itemId +')"><b>삭제하기</b></button></td>' +
					'</tr>' +
					'<tr class="modal-item-list-update ' + itemId + '">' +
						'<td colspan="3">' +
							'<div style="padding:1em;">' +
								'<div style="color:rgba(0,0,0,0.6);" align="left"><b>아이템 이름</b></div>' +
								'<div style="padding: 10px 0px 10px 0px;"><input type="text" class="modal-item-list-updatename" placeholder="수정할 아이템의 이름을 입력하세요."/></div>' +
								'<div align="right">' +
									'<button class="btn btn-default project-custom-btn" onclick="cancleListItem(' + itemId + ')"><b>x&nbsp;취소하기</b></button>' +
									'<button class="btn btn-primary project-custom-btn" onclick="updateItemName(' + itemId + ')"><b>수정하기</b></button>' +
								'</div>' +
							'</div>' +
						'</td>' +
					'</tr>';
					
		$(".modal-item-table").html(value);
		$("."+itemId).hide();
		
		$(".modal-item-notin-div").hide();
		
		$("#modal-item-list-box").show();
		$(".modal-item-adddetail-location").slideToggle(toggleSpeed);
		$(".modal-item-add-div").slideToggle(toggleSpeed);
		
		//빈 리스트에 아이템을 추가하는 경우
		var giftBodyDiv = document.getElementsByClassName("gift-body-div");
		for(var i=0; i<giftBodyDiv.length; ++i){
			seleteEmptyItemFunc(giftBodyDiv[i].id);
			
			//각 선물에 아이템 추가
			addGiftInItemFunc(giftBodyDiv[i].id, itemId);
		}
		
		settingItemListChk_Count_btn();
		
	}
	function seleteEmptyItemFunc(giftId){
		$("#"+giftId+" .gift-in-item").remove();
	}
	function addGiftInItemFunc(giftId, itemId){
		var itemName = $("#"+itemId+" .modal-item-list-name").attr("value");
		
		var value = $("#"+giftId+" .project-gift-in-item-table").html();
		
		value += '<tr class="gift-in-item-list '+ itemId +'" value="'+itemId+'">' +
					'<td>' +
						'<input type="hidden" class="gift-in-item-hidden-itemId" value="'+itemId+'">' +
						'<svg width="31.75" height="32.75" xmlns="http://www.w3.org/2000/svg" xmlns:svg="http://www.w3.org/2000/svg">' +
						 '<g class="gift-chk-btn" value="#' + giftId + ' .'+ itemId +'">' +
						  '<circle r="13.963" cy="16.538" cx="15.963" fill="#E2E2E2"/>' +
						  '<polyline points="  11.942,17.091 15.096,19.96 19.983,15.362 " stroke-miterlimit="10" stroke-linejoin="round" stroke-linecap="round" stroke-width="3" stroke="#000000" fill="none"/>' +
						 '</g>' +
						'</svg>' +
					'</td>' +
					'<td style="text-align:left;"><div class="gift_in_item_name" value="'+itemName+'">'+itemName+'</div></td>' +
					'<td>' +
						'<svg width="29.833" height="30" xmlns="http://www.w3.org/2000/svg" xmlns:svg="http://www.w3.org/2000/svg">' +
						 '<g class="itemcount-minus" value="#' + giftId + ' .'+ itemId +'">' +
						  '<circle r="13.963" cy="15.061" cx="15.002" fill="#E2E2E2"/>' +
						  '<line y2="15.06" x2="19.627" y1="15.06" x1="10.377" stroke-miterlimit="10" stroke-linejoin="round" stroke-linecap="round" stroke-width="2" stroke="#000000" fill="none"/>' +
						 '</g>' +
						'</svg>' +
					'</td>' +
					'<td><div class="gift-in-item-count" value="0" >0</div></td>' +
					'<td>' +
						'<svg width="29.833" height="30" xmlns="http://www.w3.org/2000/svg" xmlns:svg="http://www.w3.org/2000/svg">' +
						 '<g class="itemcount-plus" value="#' + giftId + ' .'+ itemId +'">' +
						  '<circle r="13.963" cy="15.061" cx="15.002" fill="#E2E2E2"/>' +
						  '<line y2="15.06" x2="19.627" y1="15.06" x1="10.377" stroke-miterlimit="10" stroke-linejoin="round" stroke-linecap="round" stroke-width="2" stroke="#000000" fill="none"/>' +
						  '<line y2="19.625" x2="14.917" y1="10.375" x1="14.917" stroke-miterlimit="10" stroke-linejoin="round" stroke-linecap="round" stroke-width="2" stroke="#000000" fill="none"/>' +
						 '</g>' +
						'</svg>' +
					'</td>' +
				'</tr>';
			
		$("#"+giftId+" .project-gift-in-item-table").html(value);
	}
	
	//아이템 수정 영역 show
	function showUpdateItem(itemId){
		$("#modal-item-list-box ."+itemId).slideToggle(toggleSpeed);
		console.log("아이템수정 영역 쇼"+toggleSpeed);
	}
	
	//리스트에서 아이템 삭제
	function deleteListItem(itemId){
		$("#"+itemId).fadeToggle(toggleSpeed, function(){
			$("."+itemId).remove();
			$("#"+itemId).remove();
			
			//아이템이 한 개도 없으면
			if($(".modal-item-list-basic").length == 0){
				$(".modal-item-notin-div").show();
				$("#modal-item-list-box").hide();
				
				//각 선물에 빈 아이템 추가
				var giftBodyDiv = document.getElementsByClassName("gift-body-div");
				for(var i=0; i<giftBodyDiv.length; ++i){
					addEmptyItemFunc(giftBodyDiv[i].id);
				}
			}
		});
	}
	
	//모달 아이템 리스트 업데이트에서 취소
	function cancleListItem(itemId){
		$("#modal-item-list-box ."+itemId).hide();
	}
	
	//모달 아이템 리스트 업데이트에서 수정
	function updateItemName(itemId){
		var updateNamgSel = "."+itemId+" .modal-item-list-updatename";
		var updateName = $(updateNamgSel).val();
		
		var nameTagSel = "#"+itemId+" .modal-item-list-name";
		$(nameTagSel).attr("value", updateName);
		$(nameTagSel).text(updateName);
		
		$(updateNamgSel).val('');//input 초기화
		
		$("#modal-item-list-box ."+itemId).hide();
		
		//선물 바디
		$("."+itemId+" .gift_in_item_name").attr("value", updateName);
		$("."+itemId+" .gift_in_item_name").text(updateName);
		
		//선물 헤드
		$("."+itemId+" .gift-item-name").attr("value", updateName);
		$("."+itemId+" .gift-item-name").text(updateName);
	}
	
	
	
	//카테고리 선택 이벤트
	function categorySelectEvent(){
		var categoryId = $("#project-category").val();
		console.log("categoryId]"+categoryId);
		if(categoryId != "undefined" && categoryId != ""){
			getSubCategoryListFunc(categoryId);
		} else{
			var values = "<option value=''>선택하세요.</option>";
			
			$("#project-sub-category").html(values);
		}
	}
	
	
	
	//동영상 미리보기
	function saveVideoUrl(){
		var urlTag = $("#content-video-url").val();
		$("#content-videourl-input").val(urlTag);
		$("#content-video-url").attr("value", urlTag);
	}
		
	function preShowVideo(){
		
		$(".video-preshow-div iframe").remove();
		
		var urlTag = $("#content-videourl-input").val();
		
		console.log(urlTag);
		
		if(urlTag != ''){
			var value = $(".video-preshow-div").html();
			value += urlTag;
					 
			$(".video-preshow-div").html(value);
		}	
	}
	
	
	
	function changeGiftCapacityChk(giftId){
	      console.log("giftId]"+giftId);
	      
	      if($("#"+giftId+" .capacity-flag").attr("checked") == true){
	         $("#"+giftId+" .capacity-flag-save-input").attr("value", "0");
	         
	         console.log("체크해제");
	      } 
	      else{
	         $("#"+giftId+" .capacity-flag-save-input").attr("value", "1");
	         console.log("체크");
	      }
	   }
	
	function setTotalGiftCapacityChk(){
		
		var capacityFlagEles = document.getElementsByClassName("capacity-flag");
		
		for(var i=0; i<capacityFlagEles.length; ++i){
			
			var giftId = capacityFlagEles[i].getAttribute("value");
			var giftIdSel = "#" + giftId;
			
			console.log(giftIdSel + " .capacity-flag-save-input");
			console.log($(giftIdSel + " .capacity-flag-save-input").attr("value"));
			if($(giftIdSel + " .capacity-flag-save-input").attr("value") == "1"){
				$(giftIdSel + " .capacity-flag").attr("checked", true);
				
				console.log("true~");
			}
			else{
				$(giftIdSel + " .capacity-flag").attr("checked", false);
				console.log("false~");
			}
		}
	}
	
	//제목 바뀌면 위에 타이블도 바뀌도록
	function changeTitle(){
		$(".project-header-title").text($("#project-title-input").val());
	}
	

	//검토 요청하기 버튼
	function sendRequest(){
		//요청 값을 y로 설정
		$("#request_flag-input").attr("value", "Y");
		
		location.href="projectSendRequestView.do?projectName=" + 
				$("#project-title-input").val();
	}
	
	
	
	//textarea 자동조절
	function resize(obj) {
		  obj.style.height = "1px";
		  obj.style.height = (12+obj.scrollHeight)+"px";
	}
	
	
	// 콤마 찍기
	function comma(str) {
	  str = String(str);
	  return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
	}
	
	
	
	//임시
	function testtinymce(){
		updateProjectFunc();
		insertProjectContentFunc();
		insertProjectAccountFunc();
		
		insertGiftFunc();
		insertItemFunc();
		insertGiftInItemFunc();
	}
		
</script>

<input type="hidden" value=true>
<!-- 검토 요청 플래그 -->
<input type="hidden" id="request_flag-input" value="N">

<div id="session-0" class="project-bgcol-white session-tap">
	<h2 class="project-header-title">프로젝트 등록 </h2>
	<div class="project-notice project-outter-div-margin">
		<p>이 페이지에는 저장 버튼이 따로 존재하지 않습니다.<br>
			하지만 걱정마세요!<br>
			페이지를 벗어나는 동시에 입력하신 정보를 자동으로 저장합니다.</p>
	</div>
	<div class="project-outter-div-margin" align="center"  style="margin-top:20px;margin-bottom:20px;">
		<button class="btn btn-primary" onclick=""><b>미리 보기</b></button>
		<button class="btn btn-greentea" style="width:150px;" onclick="sendRequest()">
			<svg width="15" height="15" xmlns="http://www.w3.org/2000/svg" xmlns:svg="http://www.w3.org/2000/svg">
 			 <path fill="#26a499" id="svg_1444" d="m9.21033,6.39269a0.25125,0.25125 0 0 0 -0.36042,-0.34655l-4.50518,3.83286l-2.37908,-0.92009a0.57874,0.57874 0 0 1 -0.06758,-1.05005l9.87673,-5.5327a0.48691,0.48691 0 0 1 0.71563,0.47478l-0.86638,9.03114a0.5978,0.5978 0 0 1 -0.81786,0.49904l-2.89544,-1.1211l-1.81766,1.7033a0.46958,0.46958 0 0 1 -0.79014,-0.34655l0,-1.33769l3.90737,-4.88639l-0.00001,0l0.00001,0.00001z"/>
			</svg>
			<b>검토 요청하기</b>
		</button>
	</div>
	<div class="project-taptable"></div>
	<div class="project-tap project-outter-div-margin">
		<table class="project-tap-table">
			<tr>
				<th><div id="session1-tap" class="tap project-tap-on" onclick="tapChange('#session-1', '#session1-tap');">
					<span class="tap-span">
						<span>펀딩</span> 
						<span>개요</span>
					</span>
					<em class="project-tap-em-active" style="color:black"></em>
				</div></th>
				<th><div id="session2-tap" class="tap project-tap-off" onclick="tapChange('#session-2', '#session2-tap');">
					<span class="tap-span">
						<span>펀딩</span> 
						<span>구성</span>
					</span> 
					<em style="color:black"></em>
				</div></th>
				<th><div id="session3-tap" class="tap project-tap-off" onclick="tapChange('#session-3', '#session3-tap');">
					<span>
						상세 내용
					</span>
					<em style="color:black"></em>
					</div></th>
				<th><div id="session4-tap" class="tap project-tap-off" onclick="tapChange('#session-4', '#session4-tap');">
					<span class="tap-span">
						<span>계좌</span> 
						<span>설정</span>
					</span>
					<em style="color:black"></em>
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
				<input type="text" id="project-title-input" name="title" placeholder="프로젝트 제목을 입력해주세요." onchange="changeTitle()">
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
				<select id="project-category" name="category" onchange="categorySelectEvent()">
					<option value>선택하세요.</option>
					
				</select>
				<select id="project-sub-category" name="sub_category">
					<option value>선택하세요.</option>
					
				</select>
			</div>
		</div>
		<div class="project-element-div project-bgcol-white">
			<div class="project-element-title-div project-element-in-div project-element-in-title">펀딩 대표 이미지</div>
			<div class="project-element-in-div project-description-button">설명</div>
			<div class="project-description-button-panel">
				<p>프로젝트를 대표할 이미지입니다. 후원자들이 한 번에 무슨 프로젝트인지 알 수 있도록 프로젝트의 선물 이미지 혹은 프로젝트 주제를 대표하는 이미지를 등록해 주시는 것이 좋답니다.</p>
			</div>
			<form id="projectRepImageUploadForm" action="projectRepImageUpload.do" method="post" enctype="multipart/form-data">
				<div class="project-element-content-div project-element-in-div">
					<div class="filebox preview-image"> 
						<div>
							<input class="upload-name" value="파일선택" disabled> 
							<label for="ex_filename">업로드</label> 
							<input type="file" id="ex_filename" name="file" class="upload-hidden"> 
						</div>
					</div>
				</div>
				<input type="hidden" id="project-id-input" name="project_id"/>
			</form>
		</div>
		<div class="project-element-div project-bgcol-white">
			<div class="project-element-title-div project-element-in-div project-element-in-title">대표 문구</div>
			<div class="project-element-in-div project-description-button">설명</div>
			<div class="project-description-button-panel">
				<p>후원자 분들에게 본 프로젝트를 간략하게 소개해 봅시다.</p>
			</div>
			<div class="project-element-content-div project-element-in-div">
				<textarea id="repcontent-textarea" name="text" maxlength="400" class="reward-input" placeholder="대표 문구 및 요약" title="상세설명"></textarea>
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
				<input id="goalprice-input" type="text" name="goalPrice" style="width:200px;" placeholder="최소 1000원 이상"> 원
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
					<input id="dday-input" type="number" name="dday" style="width:100px; text-align:right;" value="10" readonly> 일 후에 마감일입니다.
				</span>
			</div>
		</div>
	</div>
</div>
<div id="gift-totalbox-div" class="project-div project-outter-div-margin">
	<div class="project-title project-title-first">선물 구성</div>
	<%-- <div class="project-box gift0">
		<div class="project-element-div project-bgcol-white">
			<div class="project-element-in-div">
				<div align="right">
					<button class="btn btn-danger project-custom-btn" onclick="deleteGift(0)">삭제하기</button>
					<button class="btn btn-primary project-custom-btn" onclick="updateGift(0)">수정하기</button>
				</div>
				<div class="gift-pretitle-style" style="display:inline-block;"><span class="gift-price">5000</span>원 이상 후원하시는 분께 드리는 선물</div>
				<ol>
					<li class="itemId"><span class="gift-item-name">선물 이름</span> (X <span class="gift-item-count">1</span>)</li>
					<li class="itemId"><span class="gift-item-name">선물 이름</span> (X <span class="gift-item-count">2</span>)</li>
				</ol>
				<div>선물의 최대 수량은 <span class="gift-count">10</span>개 입니다.</div>
			</div>
		</div>
	</div>
	<div id="gift0" class="project-box">
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
				<table class="project-gift-in-item-table">
					<colgroup>
						<col style="width: 7%;">
						<col style="width: 72%;">
						<col>
						<col style="width: 5%;">
						<col>
					</colgroup>
					<tr>
						<th>선택</th><th style="text-align:left;">아이템 이름</th><th colspan="3">수량</th>
					</tr>
					<tr class="gift-in-item0" value="itemId">
						<td><!-- 아이디 앞에 gift가 붙어있으면 update 아니면  insert -->
							<svg width="31.75" height="32.75" xmlns="http://www.w3.org/2000/svg" xmlns:svg="http://www.w3.org/2000/svg">
							 <g class="gift-chk-btn" value="#gift0 .gift-in-item0">
							  <circle r="13.963" cy="16.538" cx="15.963" fill="#E2E2E2"/>
							  <polyline points="  11.942,17.091 15.096,19.96 19.983,15.362 " stroke-miterlimit="10" stroke-linejoin="round" stroke-linecap="round" stroke-width="3" stroke="#000000" fill="none"/>
							 </g>
							</svg>
						</td>
						<td style="text-align:left;"><div class="gift-in-item-name" value="아이템이름이름">아이템이름이름</div></td>
						<td>
							<svg width="29.833" height="30" xmlns="http://www.w3.org/2000/svg" xmlns:svg="http://www.w3.org/2000/svg">
							 <g class="itemcount-minus" value="#gift0 .gift-in-item0">
							  <circle r="13.963" cy="15.061" cx="15.002" fill="#E2E2E2"/>
							  <line y2="15.06" x2="19.627" y1="15.06" x1="10.377" stroke-miterlimit="10" stroke-linejoin="round" stroke-linecap="round" stroke-width="2" stroke="#000000" fill="none"/>
							 </g>
							</svg>
						</td>
						<td><div class="gift-in-item-count" value="10" >10</div></td>
						<td>
							<svg width="29.833" height="30" xmlns="http://www.w3.org/2000/svg" xmlns:svg="http://www.w3.org/2000/svg">
							 <g class="itemcount-plus" value="#gift0 .gift-in-item0">
							  <circle r="13.963" cy="15.061" cx="15.002" fill="#E2E2E2"/>
							  <line y2="15.06" x2="19.627" y1="15.06" x1="10.377" stroke-miterlimit="10" stroke-linejoin="round" stroke-linecap="round" stroke-width="2" stroke="#000000" fill="none"/>
							  <line y2="19.625" x2="14.917" y1="10.375" x1="14.917" stroke-miterlimit="10" stroke-linejoin="round" stroke-linecap="round" stroke-width="2" stroke="#000000" fill="none"/>
							 </g>
							</svg>
						</td>
					</tr>
					<tr id="gift-in-item1">
						<td>
							<svg width="31.75" height="32.75" xmlns="http://www.w3.org/2000/svg" xmlns:svg="http://www.w3.org/2000/svg">
							 <g class="gift-chk-btn" value="#gift0 .gift-in-item1">
							  <circle r="13.963" cy="16.538" cx="15.963" fill="#E2E2E2"/>
							  <polyline points="  11.942,17.091 15.096,19.96 19.983,15.362 " stroke-miterlimit="10" stroke-linejoin="round" stroke-linecap="round" stroke-width="3" stroke="#000000" fill="none"/>
							 </g>
							</svg>
						</td>
						<td style="text-align:left;">아이템이름이름</td>
						<td>
							<svg width="29.833" height="30" xmlns="http://www.w3.org/2000/svg" xmlns:svg="http://www.w3.org/2000/svg">
							 <g class="itemcount-minus" value="#gift0 .gift-in-item1">
							  <circle r="13.963" cy="15.061" cx="15.002" fill="#E2E2E2"/>
							  <line y2="15.06" x2="19.627" y1="15.06" x1="10.377" stroke-miterlimit="10" stroke-linejoin="round" stroke-linecap="round" stroke-width="2" stroke="#000000" fill="none"/>
							 </g>
							</svg>
						</td>
						<td><div class="gift-in-item-count" value="1">1</div></td>
						<td>
							<svg width="29.833" height="30" xmlns="http://www.w3.org/2000/svg" xmlns:svg="http://www.w3.org/2000/svg">
							 <g class="itemcount-plus" value="#gift0 .gift-in-item1">
							  <circle r="13.963" cy="15.061" cx="15.002" fill="#E2E2E2"/>
							  <line y2="15.06" x2="19.627" y1="15.06" x1="10.377" stroke-miterlimit="10" stroke-linejoin="round" stroke-linecap="round" stroke-width="2" stroke="#000000" fill="none"/>
							  <line y2="19.625" x2="14.917" y1="10.375" x1="14.917" stroke-miterlimit="10" stroke-linejoin="round" stroke-linecap="round" stroke-width="2" stroke="#000000" fill="none"/>
							 </g>
							</svg>
						</td>
					</tr>
				</table>
				</div>
				<br>
				<div align="right"><button class="btn btn-primary" data-toggle="modal" data-target="#itemManager-modal">아이템 관리</button></div>
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
		<div align="right" class="project-bgcol-white" style="padding:0px 30px 20px 0px;">
			<button class="btn btn-primary project-custom-btn" onclick="cancleGift(0)"><b>x</b> 취소하기</button>
			<button class="btn btn-danger project-custom-btn" onclick="deleteGift(0)">삭제하기</button>
			<button class="btn btn-primary project-custom-btn" onclick="saveGift(0)">저장하기</button>
		</div>
	</div> --%>
</div>
<div class="project-div project-outter-div-margin gift-add-btn-box">
<div class="project-box">
		<div class="project-element-div project-bgcol-white">
			<div class="project-element-in-div project-element-content-div">
				<div align="center" style="padding: 10px 10px 10px 10px;"><b>선물 추가하기</b></div>
				<div align="center"><button class="btn btn-primary gift-add-btn"><b>+</b> 추가하기</button></div>
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
				<textarea name="text" id="refundrole-textarea" onkeydown="resize(this)" onkeyup="resize(this)"
					class="reward-input" placeholder="정책 내용" title="상세설명"></textarea>
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
				<div class="filebox video-preshow-div"> 
					<!-- <input class="upload-name" value="파일선택" type="hidden" disabled>  -->
					<textarea name="text" id="content-video-url" maxlength="400" style="height:70px;" class="reward-input" placeholder="유투브의 퍼가기 버튼에서 생성된 테그를 입력하세요. " title="embed video" onchange="saveVideoUrl()"></textarea>
					<!-- <input type="text" id="content-video-url" placeholder="영상의 url을 입력하세요." width="80%"> -->
					<div><label onclick="preShowVideo()">동영상 미리보기</label></div>
					<input type="hidden" id="content-videourl-input"/>
					<!-- <input type="file" id="ex_filename" class="upload-hidden">  -->
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
			<!-- <button onclick="testtinymce()">테스트</button> -->
		</div>
	</div>
</div>
</div>


<div id="session-4" class="session">
<div id="" class="project-div project-outter-div-margin project-title-last">
	<div class="project-title project-title-first">본인 인증</div>
	<div class="project-box">
		<div class="project-element-div project-bgcol-white">
			<div class="project-element-in-div project-element-title-div project-element-in-title">이메일</div>
			<div class="project-element-in-div project-description-button">설명</div>
			<div class="project-description-button-panel">
				<p>진행자님이 실제 사용하고 계시는 이메일을 입력해주세요. 본인 인증에만 사용됩니다.</p>
			</div>
			<div class="project-element-in-div project-element-content-div">
				<form name="form-project" id="form-project" method="post" novalidate="novalidate">
					<input type="hidden" name="secureStateBagKey" value="" />
					<input type="hidden" id="certifflag_input" value="N"/>
					<div class="check-email-field">
						<label class="field">
						  <div class="inner-container">
							<input id="Email" name="Email" type="email" style="width:300px;" placeholder="이메일 계정" required aria-required="true">
							<button id="btnCheckEmail" class="btn btn-greentea-invert" type="button" style="height:45px;">인증하기</button>
						  </div>
						</label>
						<p class="notice">해당 이메일로 본인 인증 번호가 발송됩니다.<br>사용하는 이메일이 아닌 경우, 변경해주시길 바랍니다.</p>
					</div>
					<div id="emailToken" class="email-token" style="display: none;">
						<label class="field">
						  <div class="inner-container">
							<div class="input-area">
							  <input type="tel" style="width:300px;" id="" name="tokenValue" maxlength="6" placeholder="이메일 인증번호 입력" required aria-required="true">
							  <em id="emailTimeOut" class="timeout">03:00</em>
							  <button id="checkToken" type="button" class="btn btn-greentea-invert" style="margin-left:30px; height:45px;">인증확인</button>
							</div>
						  </div>
						</label>
					</div>
				</form>
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
					<option>선택하세요.</option>
				
				</select>
			</div>
		</div>
		<div class="project-element-div project-bgcol-white">
			<div class="project-element-in-div project-element-title-div project-element-in-title">예금주 명</div>
			<div class="project-element-in-div project-element-content-div">
				<input type="text" id="accountName-input" name="accountName" style="width:300px;" placeholder="계좌에 등록된 예금주명과 일치해야 합니다.">
			</div>
		</div>
		<div class="project-element-div project-bgcol-white">
			<div class="project-element-in-div project-element-title-div project-element-in-title">계좌 번호</div>
			<div class="project-element-in-div project-element-content-div">
				<input type="text" id="accountNumber-input" name="accountNumber" style="width:300px;" placeholder="후원금을 받을 계좌 번호를 입력하세요.">
			</div>
		</div>
	</div>
</div>
</div>



<script src="/finalp/resources/jquery-validation-1.17.0/dist/jquery.validate.min.js" type="text/javascript"></script>
<script src="/finalp/resources/jquery-validation-1.17.0/dist/additional-methods.min.js" type="text/javascript"></script>
<script src="/finalp/resources/jquery-validation-1.17.0/dist/localization/messages_ko.min.js" type="text/javascript"></script>
<script src="https://cdn.rawgit.com/alertifyjs/alertify.js/v1.0.10/dist/js/alertify.js"></script>
<script src="https://www.wadiz.kr/resources/static/js/countdown.js" type="text/javascript"></script>
<script type="text/javascript">
(function($){
	$(function(){
		
		var $form       = $('#form-project');                  
		  
		var $btnCheckEmail        = $('#btnCheckEmail', $form);
		var $btnChangeEmailModal  = $('#btnChangeEmailModal', $form);
		var $Email             = $('#Email', $form);                
	
		function initPage() {
		
		  // 유효성 검사
		  $form.validate({
		    rules: {
		      tokenValue: { required: true, maxlength: 6 },
		      Email:   { required: true, email: true}
		    },
		    messages: {
		      tokenValue: { required: '이메일 인증번호를 입력해주세요.', maxlength: '인증번호 6자리를 확인해주세요.' },
		      Email:   { required: '인증번호를 보낼 이메일을 입력해주세요.', email: '이메일을 정확히 입력해주세요.'}
		    },
		    errorElement: 'em',
		    errorPlacement: function(error, element) {
		        $parent = $(element).parent();
		        if (!$parent.hasClass('field')) {
		          $parent = $parent.parent();
		          console.log("필드없다");
		        }
		        if ($(element).prop('name') === 'tokenValue') {
		          $parent = $('#emailToken .field', $form);
		          console.log("인증볺");
		        }
		        error.appendTo($parent);
		
		        console.log("들어오네");
		      }
		  });	  
		
		  // 에러처리 jQuery Validate.
		  function checkField(element, evt) {
		    $(element).valid();
		    var isInvalid = ($form.valid()) ? false : true;
		  
		  };
		
		  // 커스텀 rules  
		  $.validator.addMethod("pwcheck", function(value, element) {
		    return /^(?=.*[a-zA-Z])(?=.*[!@#$%^&*+=-])(?=.*[0-9]).{8,16}$/.test(value);
		  });
		}
		
		
		//Email 값 작성 후 유효성에 따른 버튼 활성화 처리 및 가입된 이메일 여부 확인
		$Email.on('keyup blur', function(){
		     var $this = $(this);
		     var isInvalid = !$this.hasClass('valid');
		     $btnCheckEmail.prop('disabled', isInvalid);
		});
   
     
        //이메일 계정 인증하기 시 타이머, 인증번호 입력창.show()
        // 인증메일 발송
     	function sendEmail() {
     	  var Email = $Email.val();
  
     	  // 인증코드 이메일 발송 요청
     	  var param = {"Email": Email}
     	  
     		$.ajax({
	            type: 'POST',
	            url: 'projectAjaxSendEmailAuthCode.do',
	            dataType:"json",
	            data: {Email: Email},
	            success: function(data) {
	          	  	var jsonStr = JSON.stringify(data);
					var json = JSON.parse(jsonStr);
						
		          	if (json.code != "SUSS000") {
		  	      	  	alertify.alert(json.message);
		  	            $Email.val('').focus();
		  	       	}
		            else {
		  	       	  	console.log(json.code+" 인증메일 발송");
		  	       	  	alertify.alert('인증메일이 발송되었습니다. <br/>메일 안에 있는 인증번호를 확인해주세요.');
		  	       	  	$Email.addClass('disable');
			    	    $("#emailToken").show();
			    	    enableTokenInput(true);
			    	    setTimer();
		  	       	  	
		  	       	  	$("input[name='secureStateBagKey']").val(json.message);
		  	       	  	console.log(json.message);
		  	       	}  
		        }, 
	            fail: function(xhr) {
	      		    alertify.alert("오류가 발생했습니다. 관리자에 문의해주세요. 오류코드 : " + xhr.status);
	            },
	            beforeSend: function () {
	                var width = 0;
	                var height = 0;
	                var left = 0;
	                var top = 0;

	                width = 50;
	                height = 50;

	                top = ( $(window).height() - height ) / 2 + $(window).scrollTop();
	                left = ( $(window).width() - width ) / 2 + $(window).scrollLeft();

	                if($("#div_ajax_load_image").length != 0) {
	                       $("#div_ajax_load_image").css({
	                              "top": top+"px",
	                              "left": left+"px"
	                       });
	                       $("#div_ajax_load_image").show();
	                }
	                else {
	                       $('body').append('<div id="div_ajax_load_image" style="position:absolute; top:' + 
	                       			top + 'px; left:' + left + 'px; width:' + width + 'px; height:' + height + 
	                       			'px; z-index:9999; background:#f0f0f0; filter:alpha(opacity=50); opacity:alpha*0.5; margin:auto; padding:0; ">' + 
	                       			'<img src="/finalp/resources/images/ajax_loader4.gif" style="width:50px; height:50px;"></div>');
	                }
		         },
		         complete: function () {
			            $("#div_ajax_load_image").hide();
			     }
          });
     	}
        
        $btnCheckEmail.on('click', sendEmail);

        //3분 타이머 시작
    	function setTimer() {
	    	  var tokenExpirationTime = 180;
	    	  
	    	  $("#btnCheckEmail").text("재전송").prop('disabled', false);
	    	  
	    	  $('#emailTimeOut').countdown({
	    	    date: (new Date()).getTime() + (tokenExpirationTime * 1000),
	    	  	end: function() {
		    	   	enableTokenInput(false);
		            $('#emailTimeOut').text("입력 시간 초과").before().addClass('error');
	    	    }
	        });
    	}

        //인증코드 검증
     	function checkToken() {
	        var Email = $Email.val();
	     	var tokenValue = $("input[name='tokenValue']").val();
	     	var secureStateBagKey = $("input[name='secureStateBagKey']").val();
	     	 
	     	if ($("input[name='tokenValue']").prop("disabled")) {
	     	 	return;
	     	}

		    // 유효성체크 요청
			$.ajax({
	            url: 'projectAjaxIsValidToken.do',
	            data: {"token": tokenValue, "secureStateBagKey": secureStateBagKey},
	            success: function(data) {
						
					  if (data != "SUSS000") {
			              alertify.alert("인증번호가 틀렸습니다.");
			       	  }
					  else {
			       	  	  $Email.prop('readonly', true);
			              $btnCheckEmail.text("인증완료").addClass('gray disabled').prop('disabled', true);
			              
			              enableTokenInput(false);
			              
			              $('#emailToken').hide();
			       	  	  $("input[name='tokenValue']").prop("disabled", true);
			       	  	  
			       	  	  $("#certifflag_input").attr("value","Y");
			       	  }
	  	       	  	  
	            }, 
	            fail: function(xhr) {
	      		    alertify.alert("오류가 발생했습니다. 관리자에 문의해주세요. 오류코드 : " + xhr.status);
	            }
	        });
      }
      
      $('#checkToken').on('click', checkToken);

     

      // 인증번호 입력창 활성화/비활성화
      function enableTokenInput(isShow) {
	        var $inputTokenValue = $("input[name='tokenValue']");
	        var $emailTimeOut = $("#emailTimeOut");
		    	
	        if (isShow) {
		        $inputTokenValue.prop("disabled", false).val("").focus();
		        $emailTimeOut.show();
		    } 
	        else {
		        $inputTokenValue.prop("disabled", true);
		        $emailTimeOut.countdown("destroy");
		        $Email.focus();
	    	}
	    	
	        $("[id^=errMsg]").hide();
      }

      // 초기화 실행
      initPage();
    });
    
  }(window.jQuery));
  
</script>






<!-- 아이템 관리 modal -------------------------------------------------------------- -->
<link href="/finalp/resources/css/modalcss/itemManagerModal.css" rel="stylesheet"/>
<style>
	/* 선물 안 아이템 테이블 -----------------------------------------------------*/
	#itemManager-modal input[type=text], input[type=password] {
	  height: 40px;
	  font-size: 16px;
	  width: 100%;
	  margin-bottom: 10px;
	  -webkit-appearance: none;
	  background: #fff;
	  border: 1px solid #d9d9d9;
	  border-top: 1px solid #c0c0c0;
	  /* border-radius: 2px; */
	  padding: 0 8px;
	  box-sizing: border-box;
	  -moz-box-sizing: border-box;
	}
	
	#itemManager-modal input[type=text]:hover, input[type=password]:hover {
	  border: 1px solid #b9b9b9;
	  border-top: 1px solid #a0a0a0;
	  -moz-box-shadow: inset 0 1px 2px rgba(0,0,0,0.1);
	  -webkit-box-shadow: inset 0 1px 2px rgba(0,0,0,0.1);
	  box-shadow: inset 0 1px 2px rgba(0,0,0,0.1);
	}
	.modal-item-table{
	    border-collapse: collapse;
	    width: 100%;
	    background-color:white;
	    margin-bottom:0px;
	}
	.modal-item-table td{
	    text-align: center;
	    padding-top: 10px;
		padding-bottom: 10px;
		border-top: 1px solid #ddd;
	}
	.modal-item-table tr:first-child td{
		border-top: none;
	}
	.modal-item-table tr{
		transition: 0.2s;
	}
	
	.modal-item-tableoutter{
		border:1px solid rgba(0,0,0,0.15); 
		border-radius: 5px;
	}
	.modal-item-table .modal-item-list-update{
		background-color:#f9bf30;
	}
	
	.modal-item-add-div{
		padding: 1.5em;
		margin: 0.5em;
		border: 1px solid rgba(0,0,0,0.1);
		border-radius: .25rem;
		background-color:white;
	}
	.modal-item-adddetail-div{
		padding: 1.5em;
		margin: 0.5em;
		border: 1px solid rgba(0,0,0,0.1);
		border-radius: .25rem;
		background-color:#FFFBC5;
	}
	.modal-item-title{
		padding-top: 2em;
		padding-bottom: 0.5em;
		margin: 0.5em;
		font-weight: bold;
		color: rgba(0,0,0,0.6);
	}
	.modal-item-notin-div{
		margin: 1em 0.5em 0.5em 0.5em;
	}
	
	.btn-default:hover{
		background-color: rgba(200,200,200,1);
	}
	
	.btn{
		width: 100px;
	}
	
	.btn-greentea{
		border:1px solid #26a499;
		background-color: white;
		color: #26a499;
	}
	.btn-greentea:hover{
		border:1px solid #26a499;
		background-color: #26a499;
		color: white;
	}
	
	.btn-greenteareverse{
		border:1px solid #26a499;
		background-color: #26a499;
		color: white;
	}
	.btn-greenteareverse{
		border:1px solid #167b72;
		background-color: #167b72;
		color: white;
	}

</style>

<div class="modal fade" id="itemManager-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none; z-index:9999;">
	<div class="modal-dialog">
	 <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header" style="padding-bottom: 5px;">
          <h4 class="modal-title"><b>아이템 관리</b></h4>
          <button type="button" class="close" data-dismiss="modal"><b>&times;</b></button>
        </div>
        <div class="modal-body" style="background-color: #f6f5f5;">
			<div class="modal-item-add-div">
				<div align="center" style="padding: 10px 10px 0px 10px;"><b>아이템 추가하기</b></div>
				<div align="center" style="padding: 0px 10px 10px 10px;">선물 구성에 추가할 아이템을 만듭니다</div>
				<div align="center"><button class="btn btn-primary btn-greentea item-add-btn"><b>+</b> 추가하기</button></div>
			</div>
			<div class="modal-item-adddetail-location">
				<!-- <div class="modal-item-adddetail-div">
					<div style="padding:1em;">
						<div style="color:rgba(0,0,0,0.6);"><b>아이템 이름</b></div>
						<div style="padding: 10px 0px 10px 0px;"><input type="text" placeholder="새로 만들 아이템의 이름을 입력하세요."/></div>
						<div align="right">
							<button class="btn btn-default project-custom-btn" onclick="cancleGift('+ giftIndex + ')"><b>x&nbsp;취소하기</b></button>
							<button class="btn btn-primary project-custom-btn" onclick="saveGift('+ giftIndex + ')"><b>저장하기</b></button>
						</div>
					</div>
				</div> -->
			</div>
			<div id="modal-item-list-box">
				<div class="modal-item-title">아이템 목록</div>
				<div class="modal-item-in-div modal-item-tableoutter">
			        <table class="modal-item-table">
						<colgroup>
							<col style="width: 80%;">
							<col style="width: 10%;">
							<col>
						</colgroup>
						<tbody>
						<!-- <tr id="itemid">
							<td id="itemId" style="text-align:left; padding-left:20px;">아이템 이름</td>
							<td style="padding-right:20px;"><button class="btn btn-default"><b>수정하기</b></button></td>
							<td style="padding-right:20px;"><button class="btn btn-default"><b>삭제하기</b></button></td>
						</tr>
						<tr class="modal-item-list-update itemid">
							<td colspan="3">
								<div style="padding:1em;">
									<div style="color:rgba(0,0,0,0.6);" align="left"><b>아이템 이름</b></div>
									<div style="padding: 10px 0px 10px 0px;"><input type="text" placeholder="수정할 아이템의 이름을 입력하세요."/></div>
									<div align="right">
										<button class="btn btn-default project-custom-btn" onclick="cancleListItem(itemid)"><b>x&nbsp;취소하기</b></button>
										<button class="btn btn-primary project-custom-btn" onclick="updateItem(itemid)"><b>수정하기</b></button>
									</div>
								</div>
							</td>
						</tr>  -->
						</tbody>
				    </table>
			    </div>
		    </div>
		    <div class="modal-item-notin-div" align="center">
	        	<div><img src="/finalp/resources/images/icon/noun_1539704_cc.png"></div>
	        	<div style="color: rgba(0,0,0,0.4);"><b>추가된 아이템이 존재하지 않습니다.</b></div>
	        </div>
        </div>
        <div class="modal-footer" style="padding-top: 5px;">
          <button type="button" class="btn btn-danger" data-dismiss="modal">닫기</button>
        </div>
      </div>	
	</div>
</div>
	


<script>
	function descriptionBtnFunc(){
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
	}
	


</script>

<c:import url="/WEB-INF/views/footer.jsp"/>
</body>
</html>