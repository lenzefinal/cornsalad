<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset=:UTF-8">
<title>MyPage Index Header</title>
<link href="/finalp/resources/css/mypage.css" rel="stylesheet">
</head>
<body>
<div id="lnb_area">
	 <div class="lnb">
		<ul> 
			<li id="myInfo" class="on">
				<a href="mypageIndex.do" style="color:black;">나의 정보<em style="color:black"></em></a>
			</li>
			<li id="myStatus" class="on">
				<a href="mypageStatus.do" style="color:black;">현황 보기</a>
			</li>
			<li id="Likes" class="on">
				<a href="mypageLikes.do" style="color:black;">찜한 상품</a>
			</li>
		</ul>
	</div>
</div>
</body>
</html>