<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>회원관리</title>
<link href="/finalp/resources/css/adminPage.css" rel="stylesheet">
<style>
	#adminMain img.iconi{
		width:18px;
	}
	hr.hrst{
		background-color:#F7D358;
		border:1.5px solid #F7D358; 
	}
	#adminMain div.memtable{
		text-align:center;
	}
	#adminMain button#bid{
		border:1px solid #ced4da;
	}
	div#adminMain{
		font-family:"맑은 고딕";
		margin-top:2%;
		margin-left:5%;
		margin-right:10%;
		margin-bottom:20%;
		display:inline-block;
		width: 80%;
		float:center;
	}
	#adminMain div.searchdiv{
		width: 40%;
		float:right;
		margin-bottom: 5%;
	}
	#adminMain a.btna{
		text-decoration:none;
	}

@media screen and (min-width: 960px){ 
	div#adminMain{
		font-family:"맑은 고딕";
		margin-left:25%;
		margin-right:10%;
		display:inline-block;
		width: 60%;
		float:center;
		font-size: 13px;
	}
	#adminMain div.searchdiv{
		width: 140px;
		margin-right: 30px;
	}
	hr.hrst{
		background-color:#F7D358;
		border:1.5px solid #F7D358; 
	}
	#adminMain a.btna{
		text-decoration:none;
		color:black;
	}
	#adminMain button.btn{
		font-size:13px;
	}
	#adminMain input.searchinput{
		width: 200px;
		font-size:14px;
		float: right;
		margin-top:5px;
	}
	
 } 
</style>
<script type="text/javascript" src="/finalp/resources/js/jquery-3.3.1.min.js"></script>
  <script type="text/javascript">
//회원이름검색
  	$(function(){
  		$('#search').keypress(function(e){
  		  if ((e.which && e.which == 13) || (e.keyCode && e.keyCode == 13)){
  			var searchM = document.getElementById("search").value;
  			console.log(searchM);
  			$.ajax({
  				url: "searchMember.do",
  				data:{
  					searchM :  searchM
  				},
  				type: "post",
  				dataType: "json",
  				success: function(data){
					var jsonStr = JSON.stringify(data);
 					
 					var json = JSON.parse(jsonStr);
 					
 					$('#mtable').empty();
 					
 					var value = "<table class='table table-bordered table-hover' id='mtable'><thead><tr class='active'>"+
						"<th>이름</th><th>프로젝트 수</th><th>총 후원금</th><th>누적 신고 수</th><th>BLACKLIST</th><th>정지 / 탈퇴</th></tr></thead><tbody>";
					
 					if(json.smlist.length > 0 ){
 						for(var i=0; i<json.smlist.length; i++){
							value += "<tr><td><a href='adminMemberDetail.do?member_name="+ decodeURIComponent(json.smlist[i].member_name) +"'>"+
									decodeURIComponent(json.smlist[i].member_name) + "</a></td><td>"+ json.smlist[i].project_count +
									"</td><td>"+ json.smlist[i].spon_money +"</td><td>"+ json.smlist[i].total_report_count + 
									"</td><td>"+ json.smlist[i].blacklist_flag +"</td><td><a class='btna' href='adminMemberBlack.do?member_name="+
									decodeURIComponent(json.smlist[i].member_name) + "'><button class='btn btn-defult'>정지</button></a>&nbsp;"+
									"<a class='btna' href='adminMemberDelete.do?member_name="+
									decodeURIComponent(json.smlist[i].member_name) + "'><button class='btn btn-danger'>탈퇴</button></span></a></td></tr>";

							}
					}else{
						value += "<tr><td colspan='6'>조회된 회원이 없습니다.</td></tr>"
					}
 					$('#pagediv').empty();
 					$('#mtable').html(value);
  				},
  				error: function(request, status, errorData){
					alert("error code : " + request.status + "\n" 
						+ "message : " + request.responseText + "\n"
						+ "error : " + errorData );	
				}
  			});
  		  }
  		});
  	});
  </script>
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

<div id="adminMain">
<h3>회원관리</h3>
<hr class="hrst">
<br>
<div class="searchdiv">
    <div class="input-group">
        <input type="text" class="form-control searchinput" id="search" placeholder="이름검색" />
    </div>
</div>

<br>

  <div class="memtable">
  <table class="table table-bordered table-hover" id="mtable" >
    <thead>
      <tr class="active">
        <th>이름</th>
        <th>프로젝트 수</th>
		<th>총 후원금</th>
		<th>누적 신고 수</th>
		<th>BLACKLIST</th>
		<th>정지 / 탈퇴</th>
      </tr>
    </thead>
    <tbody>
    <c:forEach items="${ mlist }" var="mrow">
      <tr>
        <td><a href="adminMemberDetail.do?member_name=${ mrow.member_name }">${ mrow.member_name }</a></td>
        <td>${ mrow.project_count }</td>
		<td>${ mrow.spon_money }</td>
		<td>${ mrow.total_report_count }</td>
		<td>${ mrow.blacklist_flag }</td>
		<td>
		<a class="btna" href="adminMemberBlack.do?member_name=${ mrow.member_name }&num=0"><button class="btn btn-defult">정지</button></a>&nbsp;
		<a class="btna" href="adminMemberDelete.do?member_name=${ mrow.member_name }"><button class="btn btn-danger">탈퇴</button></span></a>
		</td>
      </tr>
    </c:forEach>
    </tbody>
  </table>
  </div>
  
  <!-- 페이지 번호 처리 -->
	<div style="text-align:center;" id="pagediv">
	<c:url var="first" value="adminMember.do">
		<c:param name="currentPage" value="1" />
	</c:url>
	<c:forEach var="p" begin="${startPage }" end="${endPage }" step="1">
	<c:url var="page" value="adminMember.do">
		<c:param name="currentPage" value="${p }" />
	</c:url>
	<ul class="pagination" style="display:inline-block;">
	<c:if test="${p ne currentPage }">
		<li><a href="${page }">${p }</a></li>
		<%-- <a href="${page }">	| ${p } |&nbsp; </a>  --%>
	</c:if>
	<c:if test="${p eq currentPage }">	
		<li class="active"><a href="${page }">${p }</a></li>
	<%-- <a href="${page }">	| <b>${p }</b> |&nbsp; </a> --%>
	</c:if>
	</ul>
	</c:forEach>
	<c:url var="next" value="adminMember.do">
		<c:param name="currentPage" value="${endPage + limit }" />
	</c:url>
	</div>

</div>

<c:import url="../footer.jsp"></c:import>
</body>
</html>