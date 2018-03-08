<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>찜한 프로젝트 목록 보기</title>

<style>
	td img{
		width:100px;
	}
	.limg{
		width:160px;
	}
	td:nth-child(3){
		width:180px;
		text-align:center;
	}
	.ltitle{
		width:500px	;
	}
	tr:nth-child(n+4){
		display:none;
	}
</style>
</head>
 <body class="skin_main">
<c:import url="../header.jsp"/>
<c:import url="mypageLikesHeader.jsp"/>
<c:import url="mypageLikesSide.jsp"/>

	<div id="container" >
		<div id="content" class="section_home">
			<div class="c_header">
				<h2>제목은 추후에 수정하기(찜 프로젝트)</h2>
				<p class="contxt">이것 저것 알아볼 수 있어요</p>
			</div>
		</div>
			<div class="">
				<table class="tbl_type" cellspacing="0" border="1">
				<tr>
					<td class="limg">
						<img src="https://pbs.twimg.com/profile_images/949374088249671680/MuxDEZpD_400x400.jpg"/>
					</td>
					<td>이거 제목1</td>
					<td>등록일1</td>	
					</tr>
				<tr><td class="limg">
						<img src="https://pbs.twimg.com/profile_images/949374088249671680/MuxDEZpD_400x400.jpg"/>
					</td>
					<td>이거 제목2</td>
					<td>등록일2</td>
				</tr>
				<tr><td class="limg">
						<img src="https://pbs.twimg.com/profile_images/949374088249671680/MuxDEZpD_400x400.jpg"/>
					</td>
					<td>이거 제목3</td>
					<td>등록일3</td>
				</tr>
				<tr><td class="limg">
						<img src="https://pbs.twimg.com/profile_images/949374088249671680/MuxDEZpD_400x400.jpg"/>
					</td>
					<td>이거 제목4</td>
					<td>등록일4</td>
				</tr>
				<tr><td class="limg">
						<img src="https://pbs.twimg.com/profile_images/949374088249671680/MuxDEZpD_400x400.jpg"/>
					</td>
					<td>이거 제목5</td>
					<td>등록일5</td>
				</tr>
			</table>
				<div class="more_wrap">
					<a href="#" class="btn_more" style="color:#666;">more?</a> <!-- 더보기 버튼 구현 -->
				</div>
		</div>
	</div>
 	
</body>
</html>