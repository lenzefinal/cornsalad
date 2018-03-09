<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>회원상세보기/회원 사진 삭제</title>
<link href="/finalp/resources/css/adminPage.css" rel="stylesheet">
<style>
	div#adminmemde{
		font-family:"맑은 고딕";
		margin-top:2%;
		margin-left:25%;
		margin-right:10%;
		display:inline-block;
		width: 60%;
		float:center;
		font-size: 13px;
  	}
	#adminmemde div#dtop{
		margin-left: 2%;
		width: 95%;
		height: 300px;
		padding:10px;
		border: 1px solid #F7D358;
	}
	#adminmemde hr.hrst{
		background-color:#F7D358;
		border:1.5px solid #F7D358; 
	}
	#adminmemde #idiv{
		float:left;
	}
	#adminmemde #tdiv{
		float:right;
	}
	#adminmemde img{
		float:left;
		width:200px;
		margin:10px;
	}
	#adminmemde .table{
		margin:10px;
		width:600px;
		clear:both;
		text-align:center;
		float:right;
	}
	#adminmemde #btn1{
		margin-left:80px;
		margin-top: 10px;
		clear:both;
		float:left;
	}
	#adminmemde #dbot{
		float:center;
	}
	#adminmemde table#table2{
		width: 95%;
		text-align:center;
		float:left;
	}
	#adminmemde span.btnspan{
		float:right;
  	}
</style>
</head>
<body class="skin_main">
  <c:import url="adminMenu.jsp"/>
   <div id="lnb_area">
    <div class="lnb">
      <ul> 
         <li class="on">
            <a href="adminMain.do" style="color:black;">MEMBER DETAIL<em style="color:black"></em></a>
         </li>
      </ul>
   </div>
</div>

<div id="adminmemde">
<h3>회원 상세보기</h3>
<hr class="hrst">
  <div id="dtop">
	<div id="idiv">
	<img src="https://www.artistudy.com/files/attach/images/4672/776/005/13d6061ae653f3bfbc557879b8734dd0.jpg"/>
	<button class="btn btn-danger" id="btn1">이미지 삭제</button>
	</div>
	<div id="tdiv">
	<table class="table table-bordered">
		<tr>
			<th class="active">아이디</th><td>&nbsp;&nbsp;aaa</td>
		</tr>
		<tr>
			<th class="active">이름</th><td>&nbsp;&nbsp;이땡땡</td>
		</tr>
		<tr>
			<th class="active">성별 / 나이</th><td>&nbsp;&nbsp;남 / 99</td>
		</tr>
		<tr>
			<th class="active">이메일</th><td>&nbsp;&nbsp;aaa@naver.com</td>
		</tr>
		<tr>
			<th class="active">연락처</th><td>&nbsp;&nbsp; 010789456123</td>
		</tr>
		<tr>
			<th class="active">누적 신고 수 /블랙리스트</th><td>&nbsp;&nbsp; 15 / Y</td>
		</tr>
		<tr>
			<th class="active" colspan="2"><span class="btnspan"><button class="btn btn-defult">정지</button>&nbsp;
	<button class="btn btn-danger">탈퇴</button></span></th>
		</tr>
	</table>
	
	</div>
  </div>
  <br><br>
  <div id="dbot">
	<h3>이떙땡 님의 PROJECT or PRODUCT</h3>
	<hr class="hrst">
	<div id="tdiv2">
	<table class="table table-bordered" id="table2">
		<tr><th>카테고리</th><th>제목</th><th>마감일</th><th>후원 현황</th></tr>
		<tr><td>PROJECT</td><td><a href="">안뇽안뇽</a></td><td>2018.04.05</td><th>15%</th></tr>
	</table>
	</div>
  </div>
  
</div>
</body>
</html>