<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title></title>
<style>

	div#menunav{
		display:none;
		float:left;
		margin-left: 8%;
		margin-top: 7%;
		position:absolute;
	}
	#menunav ul.menunav{
		width: 100px;
		height: 150px;
		border-radius: 5%;
		background-color: #212121;
	}
	#menunav li.menu{
		background-color: #212121;
		text-align:center;
		border:none;
	}
	#menunav a.menua{
		font-size:10pt;
		color: white;
	}
	#menunav a.menua:hover{
		font-weight:bold;
		color:#F6FFCC;
	}
	div#menubt{
		display:inline-block;
		float:left;
		margin-left: 2%;
		margin-top:5%;
		width:25px;
		border-radius: 10%;
	}
	div#menubtclo{
		display:none;
		float:left;
		margin-left: 2%;
		margin-top:5%;
		width:25px;
		border-radius: 10%;
	}
@media screen and (min-width: 1080px){ 
	div#menubt{
		display:none;
	}
	div#menunav{
		display:inline-block;
		float:left;
		margin-left: 8%;
		margin-top: 7%;
	}
	#menunav ul.menunav{
		width: 160px;
		height: 75px;
		border-radius: 5%;
		background-color: #212121;
	}
	#menunav li.menu{
		background-color: #212121;
		text-align:center;
		border:none;
	}
	#menunav a.menua{
		font-size:10pt;
		color: white;
	}
	#menunav a.menua:hover{
		font-weight:bold;
		color:#F6FFCC;
	} 
	h4.modal-title{
		float:left;
	}
</style>
<script>
$(document).ready(function() {
	// 기존 css에서 플로팅 배너 위치(top)값을 가져와 저장한다.
	var side = parseInt($("#menunav").css('top'));
	// 250px 이런식으로 가져오므로 여기서 숫자만 가져온다. parseInt( 값 );
	$(window).scroll(function() {
		// 현재 스크롤 위치를 가져온다.
		var scrollTop = $(window).scrollTop();
		var newPosition = scrollTop + side + "px";
		/* 애니메이션 없이 바로 따라감
		 $("#floatMenu").css('top', newPosition);
		 */
 
		$("#menunav").stop().animate({
			"top" : newPosition
		}, 500);
 
	}).scroll();
 
});
</script>
</head>
<body>
<c:import url="../header.jsp"></c:import>
<div id="menunav">
	<ul class="list-group menunav">
			<c:url var="projectLikes" value="projectLikes.do">
	  			<c:param name="member_id" value="${loginUser.member_id }"/>
	  		</c:url>
	  		<c:url var="productLikes" value="productLikes.do">
  				<c:param name="member_id" value="${loginUser.member_id }"/>
  			</c:url>
		<li class="list-group-item menu"><a class="menua" href="${projectLikes}">프로젝트</a></li>
		<li class="list-group-item menu"><a class="menua" href="${productLikes}">공동구매</a></li>
	</ul>
</div>

</body>
</html>