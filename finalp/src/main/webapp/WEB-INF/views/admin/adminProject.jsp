<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>프로젝트</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <link href="/finalp/resources/css/adminPage.css" rel="stylesheet">
  <style>
	div#projec{
		font-family:"맑은 고딕";
		margin-top:2%;
		margin-left:5%;
		margin-right:10%;
		display:inline-block;
		width: 60%;
		float:center;
		font-size: 13px;
	}
	#projec div.okptable{
		background-color:#F6FFCC;
	}
	#projec div.searchdiv{
		width: 20%;
		float:right;
	}
	#projec img.iconi{
		width:18px;
	}
	#projec button#bid{
		border:1px solid #ced4da;
	}
	#adtitle{
		background-color:#F3F781;
	}
	#projec div.pagediv{
		margin-left: 40%;
	}
	#projec ul.pagination > li > a{
		color:black;
	}
	#projec ul.pagination > li > a:hover{
		color:gray;
	}
  </style>
 </head>
 <body class="skin_main">
 <c:import url="adminMenu.jsp"/>
   <div id="lnb_area">
    <div class="lnb">
      <ul> 
         <li class="on">
            <a href="adminMain.do" style="color:black;">PROJECT <em style="color:black"></em></a>
         </li>
      </ul>
   </div>
</div>

<div id="projec">
  <h3>승인 요청 PROJECT</h3>
  <hr>
	  <div class="okptable">
  <table class="table table-condensed" >
    <thead>
      <tr class="active">
        <th>카테고리</th>
        <th>제목</th>
		<th>작성자</th>
		<th>승인</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>aaa</td>
        <td>Anna</td>
		<td>Anna</td>
		<td><button class="btn btn-success" data-toggle="modal" data-target="#myModal">승인</button></td>
      </tr>
      <tr>
        <td>aaaa</td>
        <td>Debbie</td>
		<td>Debbie</td>
		<td>완료</td>
      </tr>
      <tr>
        <td>a3aa</td>
        <td>John</td>
		<td>John</td>
		<td>완료</td>
      </tr>
    </tbody>
  </table>
  </div>
  
  <hr>
  
  <h3>모든 PROJECT</h3>
  <hr>
  
<div class="searchdiv">
  <form action="#">
    <div class="input-group">
      <select class="form-control">
		<option>전체</option>
		<option>프로젝트</option>
		<option>공동구매</option>
	  </select>
	  </div>
	  <br>
	  <input type="text" class="form-control" placeholder="Search" name="search">
      <div class="input-group-btn">
        <button class="btn btn-default" type="submit">
        <img class="iconi" src="/finalp/resources/images/adminimage/search.png" /></button>
    </div>
  </form>
</div>

<br>
<div class="allptable">
  <table class="table table-condensed" >
    <thead>
      <tr class="active">
        <th>카테고리</th>
        <th>제목</th>
		<th>작성자</th>
		<th>후원현황</th>
		<th>진행 / 종료</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>aaa</td>
        <td>Anna</td>
		<td>Anna</td>
		<td>200%</td>
		<td>진행</td>
      </tr>
      <tr>
        <td>aaaa</td>
        <td>Debbie</td>
		<td>Debbie</td>
		<td>15%</td>
		<td>종료</td>
      </tr>
      <tr>
        <td>a3aa</td>
        <td>John</td>
		<td>John</td>
		<td>10%</td>
		<td>진행</td>
      </tr>
    </tbody>
  </table>
  
  <div class="pagediv">
  <ul class="pagination">
    <li><a href="#">1</a></li>
    <li><a href="#">2</a></li>
    <li><a href="#">3</a></li>
    <li><a href="#">4</a></li>
    <li><a href="#">5</a></li>
  </ul>
  </div>
  
  </div>

</div>

<c:import url="../footer.jsp"></c:import>
</body>
</html>