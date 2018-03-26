<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>projectInsertGuideView.jsp</title>
</head>
<body>
<c:import url="/WEB-INF/views/header.jsp"/>

<style>
	.projectview-mainbox{
		background-color: rgba(0,0,0,0.9);
		width: 100%;
		height: 500px;
	}
	
	.projectview-btnbox{
		position: absolute;
		top: 47%;
		left: 37%;
	}
	
	.btn-primary{
		background-color: black;
		color: #FFC72B;
		border-color: #FFC72B;
	}
	.btn-primary:hover{
		background-color: #FFC72B;
		border-color: #FFC72B;
	}
	
	/* fundingInsertView.do */
</style>
<script>

	$(function(){
		$(".topEdge").remove();
		$(".btmEdge").remove();
 
	});
	
	function goFundingView(){
		location.href="fundingInsertView.do";
	}
	
	function goParView(){
		location.href="grouppurInsertView.do";
	}
	
	function funUpdate(){
		location.href="fundingUpdateView.do?projectId=152189809208550";
	}
	
	function grouUpdate(){
		location.href="grouppurUpdateView.do?projectId=152203975804215";
	}
	
	function goPDtailView(){
		location.href="projectDetailGPView.do?member_id=jieun&project_id=152183749892742";
	}
	
</script>

<link href="/finalp/resources/css/modern-business.css" rel="stylesheet">
<div class="projectview-mainbox main-color-cornsalad" >
	
	<!-- <script src="/test/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script> -->
	<header class="masthead">
      <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
     	 <div class="main_visual_text" style="position: absolute;left: 0;top: 55%;width: 80%;margin-top: -150px;text-align: center;z-index:990;margin-left:10%">  
             <div class="frame" style="opacity: 1; transform: scaleX(1) scaleY(1);position: absolute;left: 50%;top: 115px;width: 669px;height: 100%;margin-left: -328px;">
                 <p class="topEdge" style="position: absolute;width: 29px;height: 145px;box-sizing: border-box;border: 1px solid #fff;left: 0;top: 0;border-right: 0;"></p>
                 <p class="btmEdge" style="right: 0;bottom: 0;top: 0;position: absolute;width: 29px;height: 145px;box-sizing: border-box;border: 1px solid #fff;border-left: 0;"></p>
             </div>
            
         </div>
         
         <div class="carousel-inner" role="listbox" style="background-color:black">
             <!-- Slide One - Set the background image for this slide in the line below -->
            <div class="carousel-item active main-color-cornsalad" 
            	style="background-image:url('/finalp/resources/images/sliderimage/projectslider01.png');">
				<!-- <dl style="padding: 70px 0;color: #fff;margin-left: 10%;">
	                 <dt class="" style="opacity: 1; transform: translateY(0px);font-size: 60px;font-family: 'nanum_eb';line-height: 55px;margin-left: 15px;">CORNSALAD에서 <br> 수익을 창출하세요!</dt>[D] 영문 20자 / 한글 16자 내외(공백포함)
	                 <dd class="" style="opacity: 1; transform: translateY(0px);width: 450px;margin: 0 auto;font-size: 16px;margin-top: 10px;line-height: 26px;word-break: keep-all;">Welcome!</dd>
             	</dl> -->
			</div>
            
            <!-- Slide Two - Set the background image for this slide in the line below -->
            <div class="carousel-item main-color-cornsalad" 
            	style="background-image:url('/finalp/resources/images/sliderimage/projectslider02.png');">
            	<!-- <dl style="padding: 70px 0;color: #fff;margin-left: 10%;">
	                 <dt class="" style="opacity: 1; transform: translateY(0px);font-size: 60px;font-family: 'nanum_eb';line-height: 55px;margin-left: 15px;">여기를 어떻게<br>바꿔야 할까ㅠㅠㅠ</dt>[D] 영문 20자 / 한글 16자 내외(공백포함)
	                 <dd class="" style="opacity: 1; transform: translateY(0px);width: 450px;margin: 0 auto;font-size: 16px;margin-top: 10px;line-height: 26px;word-break: keep-all;">Welcome!</dd>
             	</dl> -->
            </div>
         </div>
      </div>
   </header>
	 <div class="projectview-btnbox">
		<button class="btn btn-primary" style="width:250px;height:60px;margin-right:10px;" onclick="goFundingView()"><b>펀딩 프로젝트 만들기</b></button>
		<button class="btn btn-primary" style="width:250px;height:60px;" onclick="goParView()"><b>공동구매 프로젝트 만들기</b></button>
		<button class="btn btn-primary" style="width:250px;height:60px;" onclick="goPDtailView()"><b>공동구매 상세페이지</b></button>
	</div>
</div>
<div style="height:400px;">
</div>
<button onclick="funUpdate()">펀딩 수정 페이지</button>
<button onclick="grouUpdate()">공동거래 수정 페이지</button>
<c:import url="/WEB-INF/views/footer.jsp"/>
</body>
</html>