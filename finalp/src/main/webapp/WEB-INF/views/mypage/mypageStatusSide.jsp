<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mypageSide</title>
</head>
<body>
<style>
	#side{
		position: absolute;
		width: 200px;
		height: 124px;
		left: 275px;
		background-color: white;
		color: black;
		border-top:1px solid #F7D358;
		border-bottom:1px solid #F7D358;
	}
	#side li {
		text-align:left;
		margin-top:10px;
		margin-left:12px;
		font-family:Roboto;
		font-size:12px;
		font-weight:bold;
	}
	#side a {
		color:gray;
	}
	@media( max-width:767px){
		#side{
			position: absolute;
			width: 100%;
			height: 124px;
			left: 0;
			background-color: white;
			color: black;
			border-top:1px solid #F7D358;
			border-bottom:1px solid #F7D358;
		}
		#side li {
			float:left;
			text-align:left;
			margin-top:8px;
			margin-left:12px;
			font-family:Roboto;
			font-size:12px;
			font-weight:bold;
		}
	}
</style>
<script>
$(document).ready(function() {
	// 기존 css에서 플로팅 배너 위치(top)값을 가져와 저장한다.
	var side = parseInt($("#side").css('top'));
	// 250px 이런식으로 가져오므로 여기서 숫자만 가져온다. parseInt( 값 );
	$(window).scroll(function() {
		// 현재 스크롤 위치를 가져온다.
		var scrollTop = $(window).scrollTop();
		var newPosition = scrollTop + side + "px";
		/* 애니메이션 없이 바로 따라감
		 $("#floatMenu").css('top', newPosition);
		 */
 
		$("#side").stop().animate({
			"top" : newPosition
		}, 500);
 
	}).scroll();
 
});

</script>
<div id="side">
 	<div>
	<dl>
		<li><a href="myProject.do">내가 등록한 프로젝트</a></li>
		<li><a href="fundingProject.do">내가 펀딩한 프로젝트</a></li>
	</dl>
	<dl>
		<li><a href="myProduct.do">판매중인 공동구매 상품</a></li>
		<li><a href="purchaseProduct.do">구매 신청한 공동구매 상품</a></li>
	</dl>
	</div>
</div>

</body>
</html>