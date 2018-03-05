<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
	<title>Home.jsp</title>
</head>
<body>
	<c:import url="header.jsp"></c:import>
	
	<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
	<link href="/finalp/resources/css/modern-business.css" rel="stylesheet">
	<!-- <script src="/test/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script> -->
	<header class="masthead">
      <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
     	 <div class="main_visual_text" style="position: absolute;left: 0;top: 55%;width: 80%;margin-top: -150px;text-align: center;z-index:990;margin-left:10%">  
             <div class="frame" style="opacity: 1; transform: scaleX(1) scaleY(1);position: absolute;left: 50%;top: 115px;width: 669px;height: 100%;margin-left: -328px;">
                 <p class="topEdge" style="position: absolute;width: 29px;height: 145px;box-sizing: border-box;border: 1px solid #fff;left: 0;top: 0;border-right: 0;"></p>
                 <p class="btmEdge" style="right: 0;bottom: 0;top: 0;position: absolute;width: 29px;height: 145px;box-sizing: border-box;border: 1px solid #fff;border-left: 0;"></p>
             </div>
             <dl style="padding: 70px 0;color: #fff;margin-top: 40px;">
                 <dt class="" style="opacity: 1; transform: translateY(0px);font-size: 60px;font-family: 'nanum_eb';line-height: 55px;margin-left: 15px;">CORNSALAD <br> 개발1팀 PROJECT</dt><!-- [D] 영문 20자 / 한글 16자 내외(공백포함) -->
                 <dd class="" style="opacity: 1; transform: translateY(0px);width: 450px;margin: 0 auto;font-size: 16px;margin-top: 10px;line-height: 26px;word-break: keep-all;">화이팅 합시다 우리</dd>
             </dl>
         </div>
         
         <div class="carousel-inner" role="listbox">
             <!-- Slide One - Set the background image for this slide in the line below -->
            <div class="carousel-item active" style="background-image: url('/finalp/resources/images/sliderimage/airplane.jpg')"></div>
            
            <!-- Slide Two - Set the background image for this slide in the line below -->
            <div class="carousel-item" style="background-image: url('/finalp/resources/images/sliderimage/camera.jpg')"></div>
            
            <!-- Slide Three - Set the background image for this slide in the line below -->
            <div class="carousel-item" style="background-image: url('/finalp/resources/images/sliderimage/man.jpg')"></div>
         </div>
         
         <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev" style="top:25% !important">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
         </a>
         <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next" style="top:25% !important">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
         </a>
      </div>
   </header>


	<div style="width:500px; height:2000px;border:1px solid black;"></div>



<h1>테스트테스트</h1>

<c:import url="footer.jsp"/>
</body>
</html>
