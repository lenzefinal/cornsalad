<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<title>fundingUpdateView.jsp</title>
</head>
<body>
<div id="project-top" style="disply:none;"></div>
<c:import url="/WEB-INF/views/header.jsp"/>


<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap. min.css">-->
<script src="/finalp/resources/js/jquery-ui.min.js"></script>
<link rel="stylesheet" href="/finalp/resources/css/jquery-ui.css"/>
<!-- <script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.4.js"></script> -->
<style>
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
		border: 1px solid #FAD07E;
		/* background-color: rgba(215,255,73,0.2); */
		background-color: #FAD07E;
		color: #777777;
		font-weight: bold;
	    border-radius: .25rem;
	    
	    transition: 0.4s;
	}
	.project-description-button:hover,
	.project-description-button-active {
		/* background-color: rgba(215,255,73,0.5); */
		background-color: #1ea18e;
		border-color: #1ea18e;
		color: white;
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
		/* opacity: 0.8; */
		background-color: rgba(59,76,83,0.1);
		border: 1px solid rgba(59,76,83,0.1);
		/* background-color: #3b4c53; */
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
		border: 1px solid #3b4c53;
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
	
	.colorwhite{
		color: white;
	}
	
	textarea#refundrole-textarea{
		min-height: 200px;
		overflow-y:scroll;
	}
	.mce-notification-warning{
    display:none;
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
			
			//중카테고리 선택
			var cateId = $("#receive-categoryid").attr("value");
			$("#project-category").val(cateId).prop("selected", true);
			
			//소카테고리 가져오기
			getSubCategoryListFuncFirst(cateId);
			
			//========================================================================================================
		},
		error: function(request, status, errorData){
			alert("error code: " + request.status + "\n"
					+ "message : " + request.responseText + "\n"
					+ "error : " + errorData);
		}
	});

	
	
}

//카테고리 아이디에 따라 서브 카테고리 리스트 가져오기(처음만)
function getSubCategoryListFuncFirst(categoryId){
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
			
			var catesubId = $("#receive-categorysubid").attr("value");
			$("#project-sub-category").val(catesubId).prop("selected", true);
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
			
			//은행 설정
	    	var bankId = $("#receive-bank").attr("value");
			$("#project-bank").val(bankId).prop("selected", true);
		},
		error: function(request, status, errorData){
			alert("error code: " + request.status + "\n"
					+ "message : " + request.responseText + "\n"
					+ "error : " + errorData);
		}
	});
}


//insert, update ========================================================================
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
	project.project_id = 		$("#save-project_id").val();
	project.category_sub_id = 	$("#save-category_sub_id").val();
	project.project_name = 		$("#save-project_name").val();
	project.rep_content = 		$("#save-rep_content").val();
	project.target_amount = 	$("#save-target_amount").val();
	project.end_date = 			$("#save-end_date").val();
	project.refund_role = 		$("#save-refund_role").val();
	project.certif_flag = 		$("#save-certif_flag").attr("value");
	project.request_flag = 		$("#save-requestFlag").attr("value");
	
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

function updateProjectContentFunc(){
	
	var content = new Object();
	content.project_id = 	$("#save-project_id").val();
	content.video_url = 	$("#save-video_url").val();
	content.content = 		$("#save-content").val();
	
	$.ajax({
		url: "updateProjectContent.do",
		data: JSON.stringify(content),
		type: "post",
		async: false,
		contentType: "application/json; charset=UTF-8",
		success: function(){
			console.log("프로젝트 컨텐츠 update 성공")
		},
		error: function(request, status, errorData){
			alert("error code: " + request.status + "\n"
					+ "message : " + request.responseText + "\n"
					+ "error : " + errorData);
		}
	}); 

}

function updateProjectAccountFunc(){

	var content = new Object();
	content.project_id = 		$("#save-project_id").val();
	content.bank_id = 			$("#save-bank_id").val();
	content.account_name = 		$("#save-account_name").val();
	content.account_number = 	$("#save-account_number").val();
	
	$.ajax({
		url: "updateProjectAccount.do",
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

function removeProductFunc(){
	
	var projectId = $("#save-project_id").val();
	
	$.ajax({
		url: "deleteProduct.do",
		data: { "projectId": projectId },
		type: "post",
		async: false,
		success: function(){
			console.log("해당 프로젝트 물품 삭제 성공")
		},
		error: function(request, status, errorData){
			alert("error code: " + request.status + "\n"
					+ "message : " + request.responseText + "\n"
					+ "error : " + errorData);
		}
	});
}



function insertProductFunc(){
	
 	var projectId = $("#save-project_id").val();
 	var prodEles = document.getElementsByClassName("save-gift");
 	var prodArr = [];
 	
 	for(var i=0; i<prodEles.length; ++i){
 		
 		var prodSaveIds = prodEles[i].getAttribute("id");
 		var prodIdSel = "#" + prodSaveIds;
 		var product = new Object();
 		
 		product.product_id = 		$(prodIdSel + " .gift-product_id").attr("value");
 		product.project_id = 		projectId;
 		product.product_name = 		$(prodIdSel + " .gift-product_name").attr("value");
 		product.product_price = 	$(prodIdSel + " .gift-product_price").attr("value");
 		product.mincount = 			$(prodIdSel + " .gift-mincount").attr("value");
 		
 		prodArr[i] = product;
 	}
	
	$.ajax({
		url: "insertProduct.do",
		data: JSON.stringify(prodArr),
		type: "post",
		async: false,
		contentType: "application/json; charset=UTF-8",
		success: function(result){
			console.log("물품 insert 성공")
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
//에디터 ----------------------------------------------------------
tinymce.init({
	  selector: '#jieuntextarea',
	  init_instance_callback : function(editor) {
		    editor.setContent($("#receive-content").attr("value"));
		  },
	 
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
		     
		    $("#jieuntextarea img").attr("width", 200);
	   },
	     
       /*기본 이미지 설정 가능 */
	   image_list: [
	     {title: 'My image 1', value: 'https://www.tinymce.com/my1.gif'},
	     {title: 'My image 2', value: 'http://www.moxiecode.com/my2.gif'}
	   ]
		
});





//ready ==========================================================================================
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
	
	    
		 //물품 추가 버튼
	    $(".gift-add-btn").on("click", function(){
	    	descriptionBtnFunc();
	    	
	    	var productId = new Date().getTime();
	    	
	    	var value = $("#gift-totalbox-div").html();
	    	value += '<div id="'+ productIndex +'"></div>' +
	    			'<div value="'+ productIndex +'"class="project-box gift-head-div '+ productId +'">' +
						'<div class="project-element-div project-bgcol-white">' +
							'<div class="project-element-in-div">' +
								'<div align="right">' +
									'<button class="btn btn-danger project-custom-btn" onclick="deleteGift('+ productId +',1)">삭제하기</button>' +
									'<button class="btn btn-primary project-custom-btn" onclick="updateGift('+ productId +')">수정하기</button>' +
								'</div>' +
								'<div class="gift-pretitle-style" style="display:inline-block;">' +
									'<span class="gift-name"><b></b></span>' +
								'</div>' +
								'<div class="gift-price-style" >' +
									'<span class="gift-price"></span> 원' +
								'</div>' +
							'</div>' +
						'</div>' +
					'</div>' +
					'<div id="'+ productId +'" class="project-box gift-body-div">' +
						'<div class="project-element-div project-bgcol-white">' +
							'<div class="project-element-in-div project-element-title-div project-element-in-title">물품 이름(정보)</div>' +
							'<div class="project-element-in-div project-element-content-div">' +
								'<input type="text" class="gift-name-input" placeholder="ex) s사이즈_티셔츠(black)">' +
							'</div>' +
						'</div>' +
						'<div class="project-element-div project-bgcol-white">' +
							'<div class="project-element-in-div project-element-title-div project-element-in-title">가격</div>' +
							'<div class="project-element-in-div project-element-content-div">' +
								'<input type="text" class="gift-price-input" style="width:200px;" placeholder="0원부터 시작합니다." value="0"> 원' +
							'</div>' +
						'</div>' +
						'<div class="project-element-div project-bgcol-white">' +
							'<div class="project-element-in-div project-element-title-div project-element-in-title">물품 최소 구매량 설정</div>' +
							'<div class="project-element-in-div project-description-button">설명</div>' +
							'<div class="project-description-button-panel">' +
								'<p>사은품 지급의 기준으로 정할 물품의 최소 구매량을 설정해주세요.<br>' +
								'	최소 구매량을 따로 설정하지 않으시면 따로 표시되지 않습니다.</p>' +
							'</div>' +
							'<div class="project-element-in-div project-element-content-div">' +
								'선 구매가 <input type="text" class="gift-mincount-input" style="width:50px;height:30px;text-align:right;" ' +
									'name="mincount" value="0"> 건 이상일 때 사은품이 지급됩니다.' +
							'</div>' +
						'</div>' +
						'<div align="right" class="project-bgcol-white" style="padding:0px 30px 20px 0px;">' +
							'<button class="btn btn-primary project-custom-btn" onclick="cancleGift('+ productId +')"><b>x</b> 취소하기</button>' +
							'<button class="btn btn-danger project-custom-btn" onclick="deleteGift('+ productId +',0)">삭제하기</button>' +
							'<button class="btn btn-primary project-custom-btn" onclick="saveGift('+ productId +')">저장하기</button>' +
						'</div>' +
					'</div>';
				
	    	$("#gift-totalbox-div").html(value);
	    	
	    	productIndex++;
	    	
	   		$("."+productId).hide();
	    	$("#"+productId).hide();
	    	$("#"+productId).fadeToggle(toggleSpeed); 
	    	
	    	
	    	//물품 추가 버튼 박스는 안보이게
	    	$(".gift-add-btn-box").hide();
	    	
	    	//설명 버튼 이벤트 연결
	    	descriptionBtnFunc();

	    });
	    
	    
		//설명 버튼 이벤트 연결
		descriptionBtnFunc();
		
		//처음에 페이지 들어올 때 프로젝트 정보 가져오기	-------------------update-------------------------------------
    	$(".gift-body-div").hide();
    		
    	
    	//마감일 설정
    	var enddateStr = $("#receive-enddate").attr("value");
    	var enddate = new Date(enddateStr);
    
    	$("#fundingDatepicker").datepicker({
            dateFormat: 'mm-dd-yy'
        }).datepicker('setDate', enddate)
        
        var pickerDate = $("#fundingDatepicker").datepicker("getDate").getTime();
		var currentDate = new Date().getTime();
		
		var gap = Math.ceil((pickerDate - currentDate)/1000/60/60/24);
		$("#dday-input").attr("value", gap);
        
        
		
		//페이지 나갈 때 실행되는 함수 ============================================================================
		$(window).on("beforeunload", function (){
			
			lastUpdate();
		});
		
		
		 
	});//ready end
	
	
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
	
	
	
	//물품 -----------------------------------------------------------------
	//물품 토글 스피드
	productIndex = 100;
	toggleSpeed = 300;
	
	//물품 수정 취소
	function cancleGift(giftIdIndex){
		$("."+giftIdIndex).slideToggle(toggleSpeed);
		$("#"+giftIdIndex).slideToggle(toggleSpeed);
		
		//물품 추가 버튼 박스 보이게
    	$(".gift-add-btn-box").show();
		
    	var targetId = $("."+giftIdIndex).attr("value");
		location.href="#"+targetId;
		
		console.log(targetId);
		
		document.documentElement.scrollTop -= 57;
	}
	
	//물품 삭제
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
				$("#gift-totalbox-div "+"."+giftId).remove();
				$("#gift-totalbox-div "+"#"+giftId).remove();
			});
		}
		else{
			$("#gift-totalbox-div "+"."+giftId).remove();
			$("#gift-totalbox-div "+"#"+giftId).remove();
		}
		
		var targetId = $("#gift-totalbox-div "+"."+giftId).attr("value");
		$("#"+targetId).remove();
	}
	
	//물품 저장
	function saveGift(giftId){
		var giftId_class = "."+giftId;
		var giftId_id = "#"+giftId;
		
		$(giftId_class).slideToggle(toggleSpeed);
		$(giftId_id).slideToggle(toggleSpeed);
		
		//물품 이름
		var productName = $(giftId_id + " .gift-name-input").val();
		$(giftId_class+" .gift-name").attr("value", productName);
		$(giftId_class+" .gift-name").text(productName);
		$(giftId_id+" .gift-name-input").attr("value", productName);
		
		//가격
		var productPrice = $(giftId_id + " .gift-price-input").val();
		var productPriceCom = comma(productPrice);
		
		$(giftId_class+" .gift-price").attr("value", productPriceCom);
		$(giftId_class+" .gift-price").text(productPriceCom);
		$(giftId_id+" .gift-price-input").attr("value", productPrice);
		
		//최소 구매량
		var productMincount = $(giftId_id + " .gift-mincount-input").val();
		$(giftId_id+" .gift-mincount-input").attr("value", productMincount);
    	
   
		//물품 추가 버튼 박스 보이게
    	$(".gift-add-btn-box").show();
		
    	var targetId = $(giftId_class).attr("value");
		location.href="#"+targetId;
		
		console.log(targetId);
		
		document.documentElement.scrollTop -= 57;
	}
	
	//물품 수정
	function updateGift(giftId){
		$(".gift-head-div").show();
		$(".gift-body-div").hide();
		
		$("."+giftId).hide();
		$("#"+giftId).fadeToggle(toggleSpeed);
		
		//물품 추가 버튼 박스는 안보이게
    	$(".gift-add-btn-box").hide();
	}
	
	
	
	
	
	
	
	
	
	//카테고리 선택 이벤트
	function categorySelectEvent(){
		var categoryId = $("#project-category").val();
		console.log("categoryId]"+categoryId);
		if(categoryId != "undefined"){
			getSubCategoryListFunc(categoryId);
		} else{
			var values = "<option>선택하세요.</option>";
			
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
	
	
	//제목 바뀌면 위에 타이블도 바뀌도록
	function changeTitle(){
		$(".project-header-title").text($("#project-title-input").val());
	}
	
	
	//임시저장 플래그
	temporaryFlag = false;
	
	//임시 저장
	function temporarySave(){
		
		temporaryFlag = true;
		
		var value ="";
		
		//project
		var project_id = $("#project-id-input").val();
		var category_sub_id = $("#project-sub-category").val();
		var project_name = $("#project-title-input").val();
		var rep_content = $("#repcontent-textarea").val();
		var target_amount = $("#goalprice-input").val();
		var end_date = $("#fundingDatepicker").val();
		var refund_role = $("#refundrole-textarea").val();
		var certif_flag = $("#certifflag_input").attr("value");
		
		if(category_sub_id == 'null' ||
				category_sub_id == '선택하세요.'){
			category_sub_id = "";
		}
		
		value += '<input id="save-project_id" type="hidden" value="'+ project_id +'">' +
				 '<input id="save-category_sub_id" type="hidden" value="'+ category_sub_id +'">' +
				 '<input id="save-project_name" type="hidden" value="'+ project_name +'">' +
				 "<input id='save-rep_content' type='hidden' value='"+ rep_content +"'>" +
				 '<input id="save-target_amount" type="hidden" value="'+ target_amount +'">' +
				 '<input id="save-end_date" type="hidden" value="'+ end_date +'">' +
				 '<input id="save-refund_role" type="hidden" value="'+ refund_role +'">' +
				 '<input id="save-requestFlag" type="hidden" value="N">' +
				 '<input id="save-certif_flag" type="hidden" value="'+ certif_flag +'">';
				 
		//projectContent
		var video_url = $("#content-videourl-input").val();
		var content = tinymce.get("jieuntextarea").getContent();
		
		value += "<input id='save-video_url' type='hidden' value='"+ video_url +"'>" +
		 		 "<input id='save-content' type='hidden' value='"+ content +"'>";
		
		 		 
		//projectAccount
		var bank_id = $("#project-bank option:selected").val();
		var account_name = $("#accountName-input").val();
		var account_number = $("#accountNumber-input").val();
		
		if(bank_id == "undefined" ||
				bank_id == '선택하세요.'){
			bank_id = "";
		}
		
		value += '<input id="save-bank_id" type="hidden" value="'+ bank_id +'">' +
				 '<input id="save-account_name" type="hidden" value="'+ account_name +'">' +
				 '<input id="save-account_number" type="hidden" value="'+ account_number +'">';
		
		//product
		var prodEles = document.getElementsByClassName("gift-body-div");
		
		for(var i=0; i<prodEles.length; ++i){
			var product_id = prodEles[i].getAttribute("id");
			var idSeletor = "#" + product_id;
			
			var name = $(idSeletor + " .gift-name-input").val(); 
			var price = $(idSeletor + " .gift-price-input").val(); //가격
			var mincount = $(idSeletor + " .gift-mincount-input").val();
			

			value += '<div id="'+ product_id +'" class="save-gift">' +
						'<input type="hidden" class="gift-product_id" value="'+ product_id +'">' +
						'<input type="hidden" class="gift-product_name" value="'+ name +'">' +
						'<input type="hidden" class="gift-product_price" value="'+ price +'">' +
						'<input type="hidden" class="gift-mincount" value="'+ mincount +'">' +
					 '</div>';
		}
		
		
		$("#temporarySave-div").html(value);
		
		snackbarShowfunc();
		
	}
	
	//다음 단계로 이동 버튼 
	function nextTap(tapNum){
		
		console.log("nextTap");
		
		
		var sessionDivId = "#session-" + tapNum;
		var sessionTapId = "#session" + tapNum + "-tap";
		
		$(".session").attr("style", "display:none");
		$(sessionDivId).attr("style", "display:block");
		
		$(".tap em").removeClass("project-tap-em-active")
		$(sessionTapId + " em").addClass("project-tap-em-active");
		
		document.documentElement.scrollTop = 300;
		
		//물품 수정 영역 안보이게
		$(".gift-body-div").hide();
		$(".gift-head-div").show();
	
	}
	
	
	
	
	//임시 저장이 됐으면 업데이트
	function lastUpdate(){
		//임시 저장한 이력이 있으면
		if(temporaryFlag){
			updateProjectFunc();
			updateProjectContentFunc();
			updateProjectAccountFunc();
			removeProductFunc();
			insertProductFunc();
		}
	}
	
	//검토 요청하기 버튼
	function sendRequest(){
		//임시 저장으로 이미 있으면 지우기
		$("#save-requestFlag").remove();
		
		//요청 값을 y로 설정
		var value = $("#temporarySave-div").html();
		value += '<input id="save-requestFlag" type="hidden" value="Y">';
		$("#temporarySave-div").html(value);
		
		location.href="projectSendRequestView.do?projectName=" + 
				$("#project-title-input").val();
	}
	
	//미리보기 버튼
	function projectPreview(){
		var projectId = $("#project-id-input").val();
		var memberId = $("#sellerId-input").attr("value");
		
		location.href="projectDetailGPView.do?member_id="+ memberId +"&project_id="+ projectId;
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
		console.log(tinymce.get("jieuntextarea").getContent());
		insertGiftInItemFunc();
	}
		
</script>

<input type="hidden" id="sellerId-input" value="${ loginUser.member_id }">
<!-- 임시 저장했을 때 저장하는 부분 -->
<div id="temporarySave-div"></div>

<!-- 처음에 받아온 값들을 저장하는 부분 -->
<input type="hidden" id="receive-categoryid" value="${ project.category_id }">
<input type="hidden" id="receive-categorysubid" value="${ project.category_sub_id }">
<input type="hidden" id="receive-bank" value="${ projectAcc.bank_id }">
<input type="hidden" id="receive-content" value='${ projectCon.content }'>
<input type="hidden" id="receive-enddate" value="${ project.end_date }">


<div id="session-0" class="project-bgcol-white session-tap">
<c:if test="${ project.project_name != null }">
	<h2 class="project-header-title">${ project.project_name }</h2>
</c:if>
<c:if test="${ project.project_name == null }">
	<h2 class="project-header-title">프로젝트 등록</h2>
</c:if>
	<div class="project-notice project-outter-div-margin">
		<p>수정할 내용을 입력하신 후<br>
			페이지 하단에 있는 '임시저장'버튼을 누르시면 수정된 내용이 따로 저장됩니다.<br>
			페이지에서 벗어날 때 임시 저장한 내용이 자동으로 저장됩니다.</p>
	</div>
	<div class="project-outter-div-margin" align="center"  style="margin-top:20px;margin-bottom:20px;">
		<button class="btn btn-primary" onclick="projectPreview()"><b>미리 보기</b></button>
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
						<span>공동거래</span> 
						<span>개요</span>
					</span>
					<em class="project-tap-em-active" style="color:black"></em>
				</div></th>
				<th><div id="session2-tap" class="tap project-tap-off" onclick="tapChange('#session-2', '#session2-tap');">
					<span class="tap-span">
						<span>물품</span> 
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
	<div class="project-title project-title-first">공동거래 개요</div>
	<div class="project-box">
		<div class="project-element-div project-bgcol-white">
			<div class="project-element-in-div project-element-title-div project-element-in-title">공동거래 제목</div>
			<div class="project-element-in-div project-description-button">
				설명
			</div>
			<div class="project-description-button-panel">
				<p>프로젝트를 대표할 이미지입니다. 구매자들이 한 번에 무슨 프로젝트인지 알 수 있도록 물품 이미지 혹은 프로젝트 주제를 대표하는 이미지를 등록해 주시는 것이 좋답니다.</p>
			</div>
			<div class="project-element-in-div project-element-content-div">
				<c:if test="${ !empty project.project_name }">
					<input type="text" id="project-title-input" name="title" placeholder="프로젝트 제목을 입력해주세요." 
						value="${ project.project_name }" onchange="changeTitle()">
				</c:if>
				<c:if test="${ empty project.project_name }">
					<input type="text" id="project-title-input" name="title" placeholder="프로젝트 제목을 입력해주세요."
						onchange="changeTitle()">
				</c:if>
			</div>
		</div>
		<div class="project-element-div project-bgcol-white">
			<div class="project-element-in-div project-element-title-div project-element-in-title">공동거래 카테고리</div>
			<div class="project-element-in-div project-description-button">설명</div>
			<div class="project-description-button-panel">
				<p>프로젝트의 성격에 맞는 카테고리를 선택해 주세요.<br>
				(프로젝트 성격과 맞지 않는 카테고리를 선택하실 시 구매자가 해당 프로젝트를 찾기 어려워지기에 에디터에 의해 조정될 수 있습니다.)</p>
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
			<div class="project-element-title-div project-element-in-div project-element-in-title">공동거래 대표 이미지</div>
			<div class="project-element-in-div project-description-button">설명</div>
			<div class="project-description-button-panel">
				<p>프로젝트를 대표할 이미지입니다. 구매자들이 한 번에 무슨 프로젝트인지 알 수 있도록 물품의 이미지 혹은 프로젝트 주제를 대표하는 이미지를 등록해 주시는 것이 좋답니다.</p>
			</div>
			<form id="projectRepImageUploadForm" action="projectRepImageUpload.do" method="post" enctype="multipart/form-data">
				<div class="project-element-content-div project-element-in-div">
					<div class="filebox preview-image"> 
					<c:if test="${ project.image_rename != null }">
						<div class="upload-display"><div class="upload-thumb-wrap">
							<img src="/finalp/resources/uploadProPreImages/${ project.image_rename }" class="upload-thumb" style="width:600px;"></div></div>
						<div>
							<input class="upload-name" value="${ project.image_oriname }" disabled> 
							<label for="ex_filename">업로드</label> 
							<input type="file" id="ex_filename" name="file" class="upload-hidden"> 
						</div>
					</c:if>
					<c:if test="${ project.image_rename == null }">
						<div>
							<input class="upload-name" value="파일선택" disabled> 
							<label for="ex_filename">업로드</label> 
							<input type="file" id="ex_filename" name="file" class="upload-hidden"> 
						</div>
					</c:if>
					</div>
				</div>
				<input type="hidden" id="project-id-input" name="project_id" value="${ project.project_id }"/>
			</form>
		</div>
		<div class="project-element-div project-bgcol-white">
			<div class="project-element-title-div project-element-in-div project-element-in-title">대표 문구</div>
			<div class="project-element-in-div project-description-button">설명</div>
			<div class="project-description-button-panel">
				<p>구매자 분들에게 본 프로젝트를 간략하게 소개해 봅시다.</p>
			</div>
			<div class="project-element-content-div project-element-in-div">
			<c:if test="${ project.rep_content != null }">
				<textarea id="repcontent-textarea" name="text" maxlength="400" class="reward-input" placeholder="대표 문구 및 요약" title="상세설명">${ project.rep_content }</textarea>
			</c:if>
			<c:if test="${ project.rep_content == null }">
				<textarea id="repcontent-textarea" name="text" maxlength="400" class="reward-input" placeholder="대표 문구 및 요약" title="상세설명"></textarea>
			</c:if>
			</div>
		</div>
	</div>
</div>
<div class="btnsgroup" align="center" style="margin-bottom:100px;">
	<button class="btn btn-primary btn-greentea-invert" style="margin-right:20px;width:120px;" onclick="temporarySave()">임시 저장</button>
	<button class="btn btn-primary btn-greentea-invert" style="width:120px;" onclick="nextTap(2)">다음 단계로</button>
</div>
</div>

<div id="session-2" class="session">
<div id="" class="project-div project-outter-div-margin project-first">
	<div class="project-title project-title-first">최소 수량과 마감일</div>
	<div class="project-box">
		<div class="project-element-div project-bgcol-white">
			<div class="project-element-in-div project-element-title-div project-element-in-title">공동구매 최소 수량</div>
			<div class="project-element-in-div project-description-button">설명</div>
			<div class="project-description-button-panel">
				<p>공동구매를 진행할 최소 구매 수량을 정해주세요.<br>
				마감일 자정까지 목표 수량을 100% 이상 달성하셔야만 모인 모금액이 결제 됩니다.<br>
				막판에 구매를 취소하는 구매자들도 있는 점을 감안해 10% 이상 초과 달성을 목표로 하시는게 안전합니다.<br>
				</p>
			</div>
			<div class="project-element-in-div project-element-content-div">
				<input id="goalprice-input" type="text" name="goalPrice" style="width:300px;" 
						placeholder="공동구매를 진행할 최소 구매 수량을 입력하세요." value="${ project.target_amount }"> 개
			</div>
		</div>
		<div class="project-element-div project-bgcol-white">
			<div class="project-element-in-div project-element-title-div project-element-in-title">펀딩 마감일</div>
			<div class="project-element-in-div project-description-button">설명</div>
			<div class="project-description-button-panel">
				<p>공동구매가 끝나는 마감일을 정해주세요.</p>
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
	<div class="project-title project-title-first">물품 구성</div>
<c:set var="productIdIndex" value="0"/>
<c:forEach var="product" items="${ prodList }">
	<div id="${ productIdIndex }" style="width:1px;height:1px;"></div>
	<div class="project-box gift-head-div ${ product.product_id }" value="${ productIdIndex }">
	<c:set var="productIdIndex" value="${ productIdIndex  + 1 }"/>
		<div class="project-element-div project-bgcol-white">
			<div class="project-element-in-div">
				<div align="right">
					<button class="btn btn-danger project-custom-btn" onclick="deleteGift(${ product.product_id },1)">삭제하기</button>
					<button class="btn btn-primary project-custom-btn" onclick="updateGift(${ product.product_id })">수정하기</button>
				</div>
				<div class="gift-pretitle-style" style="display:inline-block;">
					<span class="gift-name"><b>${ product.product_name }</b></span>
				</div>
				<div class="gift-price-style" >
					<fmt:formatNumber var="commaPrice" value="${ product.product_price }" type="number"/>
					<span class="gift-price">${ commaPrice }</span> 원
				</div>
			</div>
		</div>
	</div>
	<div id="${ product.product_id }" class="project-box gift-body-div">
		<div class="project-element-div project-bgcol-white">
			<div class="project-element-in-div project-element-title-div project-element-in-title">물품 이름(정보)</div>
			<div class="project-element-in-div project-element-content-div">
				<input type="text" class="gift-name-input" placeholder="ex) s사이즈_티셔츠(black)"value="${ product.product_name }">
			</div>
		</div>
		<div class="project-element-div project-bgcol-white">
			<div class="project-element-in-div project-element-title-div project-element-in-title">가격</div>
			<div class="project-element-in-div project-element-content-div">
				<input type="text" class="gift-price-input" style="width:200px;" placeholder="0원부터 시작합니다." value="${ product.product_price }"> 원
			</div>
		</div>
		<div class="project-element-div project-bgcol-white">
			<div class="project-element-in-div project-element-title-div project-element-in-title">최소 구매량 설정</div>
			<div class="project-element-in-div project-description-button">설명</div>
			<div class="project-description-button-panel">
				<p>최소 구매량을 설정해주세요. 마감일까지 각 물품마다 하나라도 최소 구매량을 넘지 못하면 모금액 전액은 구매자에게 환불됩니다. <br>
					최소 구매량을 따로 설정하지 않을 때는 기본값인 0을 입력하세요.</p>
			</div>
			<div class="project-element-in-div project-element-content-div">
				선 구매가 <input type="text" class="gift-mincount-input" style="width:50px;height:30px;text-align:right;" 
					name="mincount" value="${ product.mincount }"> 건 이상일 때 공동 구매를 진행합니다.
			</div>
		</div>
		<div align="right" class="project-bgcol-white" style="padding:0px 30px 20px 0px;">
			<button class="btn btn-primary project-custom-btn" onclick="cancleGift(${ product.product_id })"><b>x</b> 취소하기</button>
			<button class="btn btn-danger project-custom-btn" onclick="deleteGift(${ product.product_id },0)">삭제하기</button>
			<button class="btn btn-primary project-custom-btn" onclick="saveGift(${ product.product_id })">저장하기</button>
		</div>
	</div>	
</c:forEach>


</div>
<div class="project-div project-outter-div-margin gift-add-btn-box">
<div class="project-box">
		<div class="project-element-div project-bgcol-white">
			<div class="project-element-in-div project-element-content-div">
				<div align="center" style="padding: 10px 10px 10px 10px;"><b>물품 추가하기</b></div>
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
			<c:if test="${ project.refund_role != null }">
				<textarea name="text" id="refundrole-textarea" onkeydown="resize(this)" onkeyup="resize(this)" 
					class="reward-input" placeholder="정책 내용" title="상세설명">${ project.refund_role }</textarea>
			</c:if>
			<c:if test="${ project.refund_role == null }">
				<textarea name="text" id="refundrole-textarea" maxlength="400" class="reward-input" placeholder="정책 내용" title="상세설명"></textarea>
			</c:if>
			</div>
		</div>
	</div>
</div>
<div class="btnsgroup" align="center" style="margin-bottom:100px;">
	<button class="btn btn-primary btn-greentea-invert" style="margin-right:20px;width:120px;" onclick="temporarySave()">임시 저장</button>
	<button class="btn btn-primary btn-greentea-invert" style="width:120px;" onclick="nextTap(3)">다음 단계로</button>
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
				<c:if test="${ projectCon.video_url != null }">
					<textarea name="text" id="content-video-url" maxlength="400" style="height:70px;" class="reward-input" placeholder="유투브의 퍼가기 버튼에서 생성된 테그를 입력하세요. " title="embed video" onchange="saveVideoUrl()">${ projectCon.video_url }</textarea>
					<div><label onclick="preShowVideo()">동영상 미리보기</label></div>
					<input type="hidden" id="content-videourl-input" value='${ projectCon.video_url }'/>
					${ projectCon.video_url }
				</c:if>
				<c:if test="${ projectCon.video_url == null }">
					<textarea name="text" id="content-video-url" maxlength="400" style="height:70px;" class="reward-input" placeholder="유투브의 퍼가기 버튼에서 생성된 테그를 입력하세요. " title="embed video" onchange="saveVideoUrl()"></textarea>
					<div><label onclick="preShowVideo()">동영상 미리보기</label></div>
					<input type="hidden" id="content-videourl-input"/>
				</c:if>
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
						<textarea id="jieuntextarea" style="height:500px;"></textarea>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="btnsgroup" align="center" style="margin-bottom:100px;">
	<button class="btn btn-primary btn-greentea-invert" style="margin-right:20px;width:120px;" onclick="temporarySave()">임시 저장</button>
	<button class="btn btn-primary btn-greentea-invert" style="width:120px;" onclick="nextTap(4)">다음 단계로</button>
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
			<c:if test="${ project.certif_flag == 'Y' }">
				<b>&nbsp;&nbsp;&nbsp;&nbsp;이메일 인증 완료</b>
				<input type="hidden" id="certifflag_input" value="Y"/>
			</c:if>
			<c:if test="${ project.certif_flag == 'N' }">
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
			</c:if>
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
			<c:if test="${ projectAcc.account_name != null }">
				<input type="text" id="accountName-input" name="accountName" style="width:300px;" placeholder="계좌에 등록된 예금주명과 일치해야 합니다." value="${ projectAcc.account_name }">
			</c:if>
			<c:if test="${ projectAcc.account_name == null }">
				<input type="text" id="accountName-input" name="accountName" style="width:300px;" placeholder="계좌에 등록된 예금주명과 일치해야 합니다.">
			</c:if>
			</div>
		</div>
		<div class="project-element-div project-bgcol-white">
			<div class="project-element-in-div project-element-title-div project-element-in-title">계좌 번호</div>
			<div class="project-element-in-div project-element-content-div">
			<c:if test="${ projectAcc.account_number != null }">
				<input type="text" id="accountNumber-input" name="accountNumber" style="width:300px;" placeholder="후원금을 받을 계좌 번호를 입력하세요." value="${ projectAcc.account_number }">
			</c:if>
			<c:if test="${ projectAcc.account_number == null }">
				<input type="text" id="accountNumber-input" name="accountNumber" style="width:300px;" placeholder="후원금을 받을 계좌 번호를 입력하세요.">
			</c:if>
			</div>
		</div>
	</div>
</div>
<div class="btnsgroup" align="center" style="margin-bottom:100px;">
	<button class="btn btn-primary btn-greentea-invert" style="margin-right:20px;width:120px;" onclick="temporarySave()">임시 저장</button>
	<button class="btn btn-primary btn-greentea-invert" style="width:120px;" onclick="nextTap(1)">처음 단계로</button>
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
			       	  	  
			       	  	  console.log("인증성공임");
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


<style>
	
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
	
	
	/* snackbar */
	#snackbar {
	    visibility: hidden;
	    min-width: 250px;
	    margin-left: -125px;
	    background-color: #333;
	    color: #fff;
	    text-align: center;
	    border-radius: 2px;
	    padding: 16px;
	    position: fixed;
	    z-index: 1;
	    left: 50%;
	    bottom: 30px;
	    font-size: 17px;
	}
	
	#snackbar.show {
	    visibility: visible;
	    -webkit-animation: fadein 0.5s, fadeout 0.5s 2.5s;
	    animation: fadein 0.5s, fadeout 0.5s 2.5s;
	}
	
	@-webkit-keyframes fadein {
	    from {bottom: 0; opacity: 0;} 
	    to {bottom: 30px; opacity: 1;}
	}
	
	@keyframes fadein {
	    from {bottom: 0; opacity: 0;}
	    to {bottom: 30px; opacity: 1;}
	}
	
	@-webkit-keyframes fadeout {
	    from {bottom: 30px; opacity: 1;} 
	    to {bottom: 0; opacity: 0;}
	}
	
	@keyframes fadeout {
	    from {bottom: 30px; opacity: 1;}
	    to {bottom: 0; opacity: 0;}
	}

</style>

<div id="snackbar">현재까지 입력하신 정보가 임시 저장되었습니다.</div>


<script>
	//임시 저장하면 뜨는 바
	function snackbarShowfunc() {
	    var x = document.getElementById("snackbar")
	    x.className = "show";
	    setTimeout(function(){ x.className = x.className.replace("show", ""); }, 3000);
	}


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