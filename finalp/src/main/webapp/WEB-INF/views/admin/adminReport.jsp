<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>신고/문의글</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <link href="/finalp/resources/css/adminPage.css" rel="stylesheet">
  <style>
 div#report{
		font-family:"맑은 고딕";
		margin-top:2%;
		margin-left:5%;
		margin-right:10%;
		display:inline-block;
		width: 60%;
		float:center;
		font-size: 13px;
 }
	#report div.repotable{
		margin-top: 5%;
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
		background-color: #A6A6A6;
	}
	#report button.bu{
		background-color:#5D5D5D;
		color: white;
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
 <h4>금지어</h4>
 <button type="button" class="btn" data-toggle="modal" data-target="#myModal">금지어 추가</button>
 <hr>
 <h4>신고당한 글</h4>
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
  <table class="table table-hover" >
    <thead>
      <tr class="active">
        <th>카테고리</th>
        <th>제목</th>
		<th>작성자</th>
		<th>신고사유</th>
		<th>삭제</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>1</td>
        <td>Anna</td>
		<td>Anna</td>
		<td>Anna</td>
		<td><button class="btn">삭제</button></td>
      </tr>
      <tr>
        <td>2</td>
        <td>Debbie</td>
		<td>Anna</td>
		<td>Debbie</td>
		<td>Anna</td>
      </tr>
      <tr>
        <td>3</td>
        <td>John</td>
		<td>John</td>
		<td>Anna</td>
		<td>Anna</td>
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
           <button type="button" class="close" data-dismiss="modal">&times;</button> 
           <h5 class="modal-title">금지어</h5> 
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

</div>

<c:import url="../footer.jsp"></c:import>
</body>
</html>