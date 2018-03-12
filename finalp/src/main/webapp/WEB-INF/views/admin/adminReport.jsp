<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>금지어 / 신고</title>
  <link href="/finalp/resources/css/adminPage.css" rel="stylesheet">
  <style>
 div#report{
		font-family:"맑은 고딕";
		margin-top:2%;
		margin-left:25%;
		margin-right:10%;
		display:inline-block;
		width: 60%;
		float:center;
		font-size: 13px;
 }
 hr.hrst{
		background-color:#F7D358;
		border:1.5px solid #F7D358; 
	}
	#report div.repotable{
		margin-top: 5%;
		text-align:center;
	}
	#report div.searchdiv{
		float:right;
	}
	#report #myModal.modal-body{
		height: auto;
	}
	#report ul.ull{
		height: 100px;
		overflow:auto;
	}
	#report div.mo{
		background-color: #D5D5D5;
	}
	#report input.fo{
		width: 230px;
		background-color: #A6A6A6;
	}
	#report button.bu{
		background-color:#5D5D5D;
		font-size:13px;
		color: white;
	}
	#report button.taboobt{
		font-size:14px;
		background-color:#F7D358;
	}
	
	#report div.modal-body{
		height: auto;
	}
	#report div.modal-body #rdate{
		width: 300px;
	}
	#report div.modal-body #rmember{
		width:690px;
		background-color:#CE3636;
	}
	#report div.modal-body #rwriter{
		width:300px;
	}
	#report div.modal-body  #ratitle{
		width:680px;
	}
	#report div.modal-body  #rcategory{
		width:680px;
		display:inline-block;
	}
	#report span.btnspan{
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
            <a href="adminMain.do" style="color:black;">REPORT <em style="color:black"></em></a>
         </li>
      </ul>
   </div>
</div>

<div id="report">
 <h3>금지어 / 신고 </h3>
 <hr class="hrst">
 <br>
 <button type="button" class="btn taboobt" data-toggle="modal" data-target="#myModal">금지어 추가</button>
 <br>
<div class="searchdiv">
  <form action="#">
    <div class="input-group">
      <select class="form-control">
		<option>카테고리</option>
		<option>ca2</option>
		<option>ca3</option>
		<option>ca4</option>
	  </select>
    </div>
  </form>
</div>
<br>
   <div class="repotable">
  <table class="table table-bordered table-hover" >
    <thead>
      <tr class="active">
        <th>카테고리</th>
		<th>신고 작성자</th>
		<th>신고 회원</th>
		<th>상세보기</th>
		<th>상태</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>Anna</td>
		<td>Anna</td>
		<td>dddddd</td>
		<td><button class="btn btn-primary" data-toggle="modal" data-target="#redetail1">상세보기</button></td>
		<td>삭제완료</td>
      </tr>
      <tr>
        <td>Debbie</td>
		<td>Anna</td>
		<td>blind</td>
		<td><button class="btn btn-primary" data-toggle="modal" data-target="#redetail2">상세보기</button></td>
		<td>blind</td>
      </tr>
      <tr>
        <td>John</td>
		<td>John</td>
		<td>Anna</td>
		<td>Anna</td>
		<td>삭제완료</td>
      </tr>
    </tbody>
  </table>
  </div>

 <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog modal-sm">
    
      <!-- Modal content-->
      <div class="modal-content mo">
         <div class="modal-header"> 
           <h5 class="modal-title">금지어</h5> 
           <button type="button" class="close" data-dismiss="modal">&times;</button> 
        </div>
        <div class="modal-body">
			<div class="form-inline">
			<div class="form-group">
				<input type="text" class="form-control fo" id="tabooin" placeholder="금지어 입력">
			</div>
				<button type="submit" class="btn bu">추가</button>
			</div>
			<br><br>
			<form>
				<ul class="list-group ull">
					<li class="list-group-item">First item</li>
					<li class="list-group-item">Second item</li>
					<li class="list-group-item">Third item</li>
					<li class="list-group-item">Third item</li>
					<li class="list-group-item">Third item</li>
					<li class="list-group-item">Third item</li>
				</ul>
			</form>
			</div>
      </div>
    </div>
  </div>
  
  <!-- 댓글 신고 Modal -->
  <div class="modal fade" id="redetail1" role="dialog">
    <div class="modal-dialog modal-lg">
    
      <!-- Modal content-->
      <div class="modal-content">
         <div class="modal-header"> 
         <h4 class="modal-title">신고 상세보기</h4> 
           <button type="button" class="close" data-dismiss="modal">&times;</button> 
        </div>
        <div class="modal-body">
			<div class="form-inline">
			<div class="form-group">
				<label for="rmember">신고회원 : &nbsp;</label>
				<input type="text" class="form-control" id="rmember" value="id" readonly >&nbsp;
			</div>
			<br><br><br>
			<div class="form-group">
				<label for="rwriter">신고 작성자 : &nbsp;</label>
				<input type="text" class="form-control" id="rwriter" value="id" readonly>
			</div>
			
			<div class="form-group">
				<label for="rdate"> 신고 날짜 : &nbsp;</label>
				<input type="date" class="form-control" id="rdate">
			</div>
			</div>
			<br>
			<div class="form-group">
				<label for="rcontent">신고 사유  </label>
				<textarea class="form-control" id="rcontent" placeholder="신고사유" cols="90" rows="10"></textarea>
			</div>
			<div class="form-group">
				<label for="rcategory">카테고리 : &nbsp;</label>
				<input type="text" class="form-control" id="rcategory" value="카테고리" readonly >
			</div>
			<div class="form-group">
				<label for="racontent">신고 댓글  </label>
				<textarea class="form-control" id="racontent" placeholder="신고댓글내용" cols="60" rows="10"></textarea>
				<br>
				<span class="btnspan"><button class="btn btn-danger" data-dismiss="modal">해당 댓글 삭제</button>&nbsp;</span>
				<br>
			</div>
			</div>
      </div>
    </div>
  </div>
  
  <!-- 글 신고 Modal -->
  <div class="modal fade" id="redetail2" role="dialog">
    <div class="modal-dialog modal-lg">
    
      <!-- Modal content-->
      <div class="modal-content">
         <div class="modal-header"> 
         <h4 class="modal-title">신고 상세보기</h4> 
           <button type="button" class="close" data-dismiss="modal">&times;</button> 
        </div>
        <div class="modal-body">
			<div class="form-inline">
			<div class="form-group">
				<label for="rmember">신고회원 : &nbsp;</label>
				<input type="text" class="form-control" id="rmember" value="id" readonly >&nbsp;
			</div>
			<br><br><br>
			<div class="form-group">
				<label for="rwriter">신고 작성자 : &nbsp;</label>
				<input type="text" class="form-control" id="rwriter" value="id" readonly>
			</div>
			<div class="form-group">
				<label for="rdate"> 신고 날짜 : &nbsp;</label>
				<input type="date" class="form-control" id="rdate">
			</div>
			</div>
			<br>
			<div class="form-group">
				<label for="rcontent">신고 사유  </label>
				<textarea class="form-control" id="rcontent" placeholder="신고사유" cols="90" rows="10"></textarea>
			</div>
			
			<div class="form-group">
				<label for="ratitle">신고 당한 글 바로가기 </label>

				<table class="table table-bordered">
					<tr class="active"><th>카테고리</th><th>제목</th></tr>
					<tr><td>프로젝트</td><td><a href="#">어쩌구저쩌구프로젝트입니당</a></td></tr>
				</table>
				<br>
			</div>
			</div>
      </div>
    </div>
  </div>

</div>

<c:import url="../footer.jsp"></c:import>
</body>
</html>