<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 정보 수정</title>
</head>
<body class="skin_main">
<c:import url="../header.jsp"/>
<c:import url="mypageIndexHeader.jsp"/>
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
             parent.prepend('<div class="upload-display"><img src="'
                   + src + '" class="upload-thumb"></div>'); 
          } 
          reader.readAsDataURL($(this)[0].files[0]); 
       } 
       else { 
          $(this)[0].select(); 
          $(this)[0].blur(); 
          
          var imgSrc = document.selection.createRange().text; 
          parent.prepend('<div class="upload-display"><img class="upload-thumb"></div>'); 
          
          var img = $(this).siblings('.upload-display').find('img'); 
          img[0].style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(enable='true',sizingMethod='scale',src=\""
                + imgSrc + "\")"; 
       } 
    });
});

</script>
<style type="text/css">
	.modify{
		margin-left:6%;
		width:95px;
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
	.cancel{		
		width:95px;
		height:40px;
		text-align:center;
	    background-color: #f5f6f8;
	    color: gray;
	    border: 2px solid red; 
	    -webkit-transition-duration: 0.4s;
   		transition-duration: 0.4s;
   		font-size:14px;
   		font-family: NanumGothic, 'Malgun Gothic', Dotum, Helvetica,
		'Apple SD GothicNeo', Sans-serif;
   		line-hieght:10px;
    }
    .cancel:hover {
    	color:white;
    	background-color:red;	
    }
    .modify:hover {
    	color:white;
    	background-color:#F7D358;	
    }
    
    dl dt{
    	font-size:12px;
    	margin-bottom:2%;
    }
    dl dd{
  		margin-bottom:5%;
  		height:20px;
    }
   /*  input{
    	width:200px;
    	height:20px;
    } */
    img {
    	border-radius:100%; 
    	width:255px;
    }    
    
	/* 업로드 버튼 ------------------------------------------------------------*/
	.filebox {
		margin-left:9%;
	}
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
   .filebox .upload-display img { /* 추가될 이미지 */ 
      display: block; 
      max-width: 100%; 
      width: 100% \9; 
      height: auto; 
   }
   select, input, input[type="password"] {
		width:50%;
		height:23px;
	}
	#container .column:first-child {
		width:40%;
	}
   
   @media (max-width:767px) and ( min-width : 0px){
    	.column {
    		float:none;
    	}
    	.modify{
			margin-left:0%;
			width:95px;
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
		img {
			width:270px;
		}
		select, input, input[type="password"] {
			width:270px;
			height:23px;
		}
		.filebox .upload-display img { /* 추가될 이미지 */ 
		    display: block; 
		    max-width: 270px; 
		    height:270px;
		}
		#container .column:first-child {
			width:100%;
		}
		.filebox {
			margin-left:19%;
		}
	}
</style>

	 <div id="container" style="height:724px;">
		<div id="content" class="section_home">
			<div class="c_header">
				<h2>내 정보 변경</h2>
				<p class="contxt">회원님의 정보를 확인하고 변경할 수 있습니다.</p>
			</div>
		<form>
			<div class="column">
				<img src="https://www.artistudy.com/files/attach/images/4672/776/005/13d6061ae653f3bfbc557879b8734dd0.jpg"/><br>
					<div class="filebox preview-image" > 
						<input class="upload-name" value="파일선택" type="hidden" disabled> <br>
						<label for="ex_filename">업로드</label> 
						<input type="file" id="ex_filename" class="upload-hidden"> 
						<button class="cancel" style="margin-bottom:5%"><b>이미지 삭제</b></button>
					</div>
				<dl class="accoutinfo">
					<dt><b>은행명</b></dt>
					<select style="margin-bottom:5%; height:30px;">
						<option>하나은행</option>
						<option>신한은행</option>
						<option>농협</option>
						<option>아무튼은행</option>
					</select>
				<dt><b>계좌번호</b></dt>
					<dd><input type="text" style="height:20px;"></dd>
				</dl>
			</div>
			<div class="column">
					<dl class="myinfo">
						<dt><b>ID</b></dt>
						<dd>ID IS NOT MODIFY</dd>
						<dt><b>현재 비밀번호</b></dt>
						<dd><input type="password" maxlength="16"></dd>
						<dt><b>변경할 비밀번호</b></dt>
						<dd><input type="password" maxlength="16"></dd>
						<dt><b>비밀번호 확인</b></dt>
						<dd><input type="password" maxlength="16"></dd>
						<dt><b>Phone</b></dt>
						<dd><input type="tel" maxlength="16"></dd>
						<dt><b>E-mail</b></dt>
						<dd><input type="email"/>
						<dt><b>주소</b></dt>
						<dd>주소 넣기</dd>
					</dl>
					<button type="submit" class="modify" style="margin-left:0%">수정하기</button> &nbsp;
			 		<button type="submit" class="cancel">취소</button>
			</div>
			</form> 
		</div>
	</div>
</body>
</html>