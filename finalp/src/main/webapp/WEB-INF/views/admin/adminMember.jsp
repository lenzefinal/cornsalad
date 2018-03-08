<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>관리자테스트</title>
<link href="/finalp/resources/css/adminPage.css" rel="stylesheet">
<style>
	img.iconi{
		width:18px;
	}
	button#bid{
		border:1px solid #ced4da;
	}
	div.adminMain{
		font-family:"맑은 고딕";
		margin-top:2%;
		margin-left:5%;
		margin-right:10%;
		display:inline-block;
		width: 80%;
		float:center;
	}
	div.searchdiv{
		width: 40%;
		float:right;
		margin-bottom: 5%;
	}

@media screen and (min-width: 960px){ 
	div.adminMain{
		font-family:"맑은 고딕";
		margin-left:5%;
		margin-right:10%;
		display:inline-block;
		width: 60%;
		float:center;
		font-size: 13px;
	}
	div.searchdiv{
		width: 20%;
	}
	
 } 
</style>

</head>
<body class="skin_main">
 <c:import url="adminMenu.jsp"/>
   <div id="lnb_area">
    <div class="lnb">
      <ul> 
         <li class="on">
            <a href="adminMain.do" style="color:black;">MEMBER<em style="color:black"></em></a>
         </li>
      </ul>
   </div>
</div>

<div class="adminMain">
<h3>회원관리</h3>
<div class="searchdiv">
  <form action="#">
    <div class="input-group sfo">
      <input type="text" class="form-control" placeholder="Search" name="search">
      <div class="input-group-btn">
        <button id="bid" class="btn btn-default" type="submit">
        <img class="iconi" src="/finalp/resources/images/adminimage/search.png" /></button>
      </div>
    </div>
  </form>
</div>

<br>

  <div class="memtable">
  <table class="table table-hover" >
    <thead>
      <tr class="active">
        <th>아이디</th>
        <th>진행중인 프로젝트</th>
		<th>후원 현황</th>
		<th>누적 신고 수</th>
		<th>정지 / 탈퇴</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>user11</td>
        <td>안녕안녕</td>
		<td>20000</td>
		<td>3</td>
		<td><button class="btn btn-default">정지</button>&nbsp;<button class="btn btn-danger">탈퇴</button></td>
      </tr>
      <tr>
        <td>user22</td>
        <td>--</td>
		<td>--</td>
		<td>5</td>
		<td><button class="btn btn-default">정지</button>&nbsp;<button class="btn btn-danger">탈퇴</button></td>
      </tr>
    </tbody>
  </table>
  </div>


</div>

<c:import url="../footer.jsp"></c:import>
</body>
</html>