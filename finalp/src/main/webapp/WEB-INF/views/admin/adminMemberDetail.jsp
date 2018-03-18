<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
		margin-bottom: 20%;
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
		height: 230px;
		margin:10px;
	}
	#adminmemde .table{
		width:600px;
		clear:both;
		text-align:center;
		float:right;
	}
	#adminmemde a.btna{
		text-decoration:none;
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
<script type="text/javascript" src="/finalp/resources/js/jquery-3.3.1.min.js"></script>
 <script type="text/javascript">
 
 function imgdefun(member_name){
	 $.ajax({
		 url:"adminImgDelete.do",
		 data: { member_name : member_name } ,
		 type: "post",
	  	 success:function(result){ 
	  		if(result == "ok"){
	  			$('#profileimg').attr('src', 'resources/images/mypageProfiles/defaultProfile.jpg');
	  		}else {
	  			alert("삭제 실패!");
	  		}
	  	 },
	  	error: function(request, status, errorData){
			alert("error code : " + request.status + "\n" 
				+ "message : " + request.responseText + "\n"
				+ "error : " + errorData );	
		}
	 });
 }
	
</script>
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
	<c:if test="${ empty mdetail.profile_img_oriname }">
		<img src="resources/images/mypageProfiles/defaultProfile.jpg" name="memberProfile" class="profile" id="profileimg" /><br>
	</c:if>
	<c:if test="${ !empty mdetail.profile_img_oriname }">
		<img src="resources/images/mypageProfiles/${mdetail.profile_img_rename }" name="memberProfile" class="profile" id="profileimg" /><br>
		<button class="btn btn-danger" id="btn1" onclick="imgdefun('${ mdetail.member_name }')">이미지 삭제</button>
	</c:if>
	
	</div>
	<div id="tdiv">
	<table class="table table-bordered">
		<tr>
			<th class="active">아이디</th><td>&nbsp;&nbsp;${ mdetail.member_id }</td>
		</tr>
		<tr>
			<th class="active">이름</th><td>&nbsp;&nbsp;${ mdetail.member_name }</td>
		</tr>
		<tr>
			<th class="active">성별 / 나이</th><td>&nbsp;&nbsp;${ mdetail.gender } / ${ mdetail.age }</td>
		</tr>
		<tr>
			<th class="active">이메일</th><td>&nbsp;&nbsp;${ mdetail.email }</td>
		</tr>
		<tr>
			<th class="active">연락처</th><td>&nbsp;&nbsp; ${ mdetail.phone }</td>
		</tr>
		<tr>
			<th class="active">총 후원금</th><td>&nbsp;&nbsp; ${ mdetail.spon_money }</td>
		</tr>
		<tr>
			<th class="active">누적 신고 수 /블랙리스트</th><td>&nbsp;&nbsp; ${ mdetail.total_report_count } / ${ mdetail.blacklist_flag }</td>
		</tr>
		<tr>
			<th class="active" colspan="2"><span class="btnspan">
			<a class="btna" href="adminMemberBlack.do?member_name=${ mdetail.member_name }&num=1"><button class="btn btn-defult">정지</button></a>&nbsp;
			<a class="btna" href="adminMemberDelete.do?member_name=${ mdetail.member_name }"><button class="btn btn-danger">탈퇴</button></a></span></th>
		</tr>
	</table>
	
	</div>
  </div>
  <br><br>
  <div id="dbot">
	<h3>${ mdetail.member_name } 님의 PROJECT or PRODUCT</h3>
	<hr class="hrst">
	<div id="tdiv2">
	<table class="table table-bordered" id="table2">
		<tr><th>카테고리</th><th>세부카테고리</th><th>제목</th><th>진행 / 종료</th><th>후원 현황</th><th>누적 신고 수</th></tr>
		<c:choose>
			<c:when test="${ fn:length(mplist) > 0 }">
			<c:forEach items="${ mplist }" var="mprow">
				<tr>
					<td>${ mprow.project_category_name }</td>
					<td>${ mprow.category_sub_name }</td>
					<td><a href="">${ mprow.project_name }</a></td>
					<td>
						<c:if test="${ mprow.ing_flag eq 'Y' }">
							진행중
						</c:if>
						<c:if test="${ mprow.ing_flag eq 'N' }">
							종료
						</c:if>
					</td>
					<td>${ mprow.spon } %</td>
					<td>${ mprow.report_count }</td>
				</tr>
			</c:forEach>
			</c:when>
			<c:otherwise>
				<tr>
					<td colspan="6">${ mdetail.member_name }님이 등록하신 PROJECT가 없습니다.</td>
				</tr>
			</c:otherwise>
		</c:choose>
	</table>
	</div>
  </div>
  
</div>
<c:import url="../footer.jsp"></c:import>
</body>
</html>