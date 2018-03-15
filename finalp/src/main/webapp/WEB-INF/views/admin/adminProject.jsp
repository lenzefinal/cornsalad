<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
		margin-left:25%;
		margin-right:10%;
		margin-bottom: 20%;
		display:inline-block;
		width: 60%;
		float:center;
		font-size: 13px;
	}
	hr.hrst{
		background-color:#F7D358;
		border:1.5px solid #F7D358; 
	}
	#projec div.okptable{
		background-color:#F6FFCC;
		text-align:center;
	}
	#projec img.iconi{
		width:18px;
	}
	#projec button#bid{
		border:1px solid #ced4da;
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
	#projec div.allptable{
		text-align:center;
	}
	#projec div.searchdiv{
		float:right;
		margin-right: 30px;
	}
	#projec select.searchse{
		margin-top:5px;
		width: 60px;
	}
	#projec div.searchin{
		width: 140px;
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
  <hr class="hrst">
	  <div class="okptable">
  <table class="table table-bordered table-condensed" >
    <thead>
      <tr class="active">
        <th>카테고리</th>
        <th>제목</th>
		<th>작성자</th>
		<th>승인</th>
      </tr>
    </thead>
    <tbody>
    	<c:choose>
    		<c:when test="${ fn:length(oplist) > 0 }">
    			<c:forEach items="${ oplist }" var="oprow">
    				<tr>
       					<td>${ oprow.project_category_name }</td>
        				<td>${ oprow.project_name }</td>
						<td>${ oprow.member_name }</td>
						<td><button class="btn btn-default" data-toggle="modal" data-target="#myModal">승인</button></td>
      				</tr>
      			</c:forEach>
      		</c:when>
      	</c:choose>
    </tbody>
  </table>
  </div>
 
 
 <br>
  <h3>모든 PROJECT</h3>
  <hr class="hrst">
  
<div class="searchdiv">
  <form action="#">
    <div class="input-group">
      <select class="form-control searchse">
		<option>전체</option>
		<option>프로젝트</option>
		<option>공동구매</option>
	  </select>&nbsp;
	  <div class="input-group searchin">
      <input type="text" class="form-control" placeholder="Search" name="search">
      <div class="input-group-btn">
        <button id="bid" class="btn btn-default" type="submit">
        <img class="iconi" src="/finalp/resources/images/adminimage/search.png" /></button>
      </div>
    </div>
   </div> 
  </form>
</div>

<br><br><br>

<div class="allptable">
  <table class="table table-bordered table-condensed" >
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
      <c:choose>
    		<c:when test="${ fn:length(aplist) > 0 }">
    			<c:forEach items="${ aplist }" var="aprow">
    				<tr>
       					<td>${ aprow.project_category_name }</td>
        				<td>${ aprow.project_name }</td>
						<td>${ aprow.member_name }</td>
						<td>${ aprow.spon } % </td>
						<td>
							<c:if test="${ aprow.ing_flag eq 'Y' }">
								진행중
							</c:if>
							<c:if test="${ aprow.ing_flag eq 'N' }">
								종료
							</c:if>
						</td>
      				</tr>
      			</c:forEach>
      		</c:when>
      	</c:choose>
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