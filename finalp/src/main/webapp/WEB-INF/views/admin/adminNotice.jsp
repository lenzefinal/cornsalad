<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>공지사항</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <link href="/finalp/resources/css/adminPage.css" rel="stylesheet">
  <style>
  div#notice{
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
  #notice span.btnspan{
		float:right;
  }
  #notice button{
		margin-top:-8px;
  }
  #notice #nomodal div.modal-body , #notice #nomodal2 div.modal-body{
		height: auto;
  }
  #notice #nomodal div.modal-body #ntitle , #notice #nomodal2 div.modal-body #ntitle{
		width: 720px;
  }
  #notice #nomodal div.modal-body #nwriter , #notice #nomodal2 div.modal-body #nwriter{
		width:300px;
  }
  #notice #nomodal div.modal-body #ndate , #notice #nomodal2 div.modal-body #ndate{
		width:330px;
  }
  #notice button.inbt{
		font-size:14px;
		background-color:#F7D358;
  }
  #notice button.mobt{
  		background-color:#654693;
  		font-size: 11px;
  		color:white;
  }
  #notice button.debt{
  		background-color:#1D004B;
  		font-size: 11px;
  		color:white;
  }
  </style>
 </head>
 <body class="skin_main">
 <c:import url="adminMenu.jsp"/>
   <div id="lnb_area">
    <div class="lnb">
      <ul> 
         <li class="on">
            <a href="adminMain.do" style="color:black;">NOTICE <em style="color:black"></em></a>
         </li>
      </ul>
   </div>
</div>

<div id="notice">
  <h3>공지사항</h3>
	<hr class="hrst">
	<br>
	<button type="button" class="btn inbt" data-toggle="modal" data-target="#nomodal">공지사항 등록</button>
	<br><br>
	
	<div class="panel-group" id="accordion">
    <div class="panel panel-default">
      <div class="panel-heading">
        <h4 class="panel-title">
          <a data-toggle="collapse" data-parent="#accordion" href="#notice1">공지사항1</a>
		  <span class="btnspan"><button class="btn mobt" data-toggle="modal" data-target="#nomodal2">수정</button>&nbsp;<button class="btn debt">삭제</button></span>
        </h4>
      </div>
      <div id="notice1" class="panel-collapse collapse in">
        <div class="panel-body">
        	<table class="table">
        		<tr>
        		<th>안녕</th>
        		</tr>
        		<tr>
        		<td>안녕</td>
        		</tr>
        	</table>
        </div>
      </div>
    </div>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h4 class="panel-title">
          <a data-toggle="collapse" data-parent="#accordion" href="#notice2">공지사항2</a>
		  <span class="btnspan"><button class="btn mobt" >수정</button>&nbsp;<button class="btn debt">삭제</button></span>
        </h4>
      </div>
      <div id="notice2" class="panel-collapse collapse">
        <div class="panel-body">
        	공지사항2
        </div>
      </div>
    </div>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h4 class="panel-title">
          <a data-toggle="collapse" data-parent="#accordion" href="#notice3">공지사항3</a>
		  <span class="btnspan"><button class="btn mobt">수정</button>&nbsp;<button class="btn debt">삭제</button></span>
        </h4>
      </div>
      <div id="notice3" class="panel-collapse collapse">
        <div class="panel-body">
        	공지사항3
        </div>
      </div>
    </div>
  </div> 

  <hr>
 
<!--  <div class="pagediv">
  <ul class="pagination">
    <li><a href="#">1</a></li>
    <li><a href="#">2</a></li>
    <li><a href="#">3</a></li>
    <li><a href="#">4</a></li>
    <li><a href="#">5</a></li>
  </ul>
 </div> -->


<!-- Modal -->
  <div class="modal fade" id="nomodal" role="dialog">
    <div class="modal-dialog modal-lg">
    
      <!-- Modal content-->
      <div class="modal-content">
         <div class="modal-header"> 
           <h4 class="modal-title">공지사항 등록</h4> 
           <button type="button" class="close" data-dismiss="modal">&times;</button> 
        </div>
        <div class="modal-body">
			<div class="form-inline">
			<div class="form-group">
				<label for="ntitle"> 제목 : &nbsp;</label>
				<input type="text" class="form-control" id="ntitle" placeholder="제목 입력">
			</div>
			<br><br>
			<div class="form-group">
				<label for="nwriter">작성자 : &nbsp;</label>
				<input type="text" class="form-control" id="nwriter" value="id" readonly >
			</div>
			<div class="form-group">
				<label for="ndate">작성날짜 : &nbsp;</label>
				<input type="date" class="form-control" id="ndate">
			</div>
			<br><br><br>
			<div class="form-group">
				<label for="ntitle"> 첨부파일 </label>
				<input type="file" id="nfile">
			</div>
			</div>
			<br>
			<div class="form-group">
				<label for="qcontent">내용 : </label>
				<textarea class="form-control" id="qcontent" placeholder="문의내용" cols="90" rows="10"></textarea>
				<br>
				<span class="btnspan"><button class="btn btn-defult" data-dismiss="modal">등록</button>&nbsp;
				<button class="btn" data-dismiss="modal">취소</button></span>
				<br>
			</div>
			
      </div>
    </div>
  </div>
</div>

<!-- Modal -->
  <div class="modal fade" id="nomodal2" role="dialog">
    <div class="modal-dialog modal-lg">
    
      <!-- Modal content-->
      <div class="modal-content">
         <div class="modal-header"> 
           <h4 class="modal-title">공지사항 수정</h4> 
           <button type="button" class="close" data-dismiss="modal">&times;</button> 
        </div>
        <div class="modal-body">
			<div class="form-inline">
			<div class="form-group">
				<label for="ntitle"> 제목 : &nbsp;</label>
				<input type="text" class="form-control" id="ntitle" placeholder="제목 입력">
			</div>
			<br><br>
			<div class="form-group">
				<label for="nwriter">작성자 : &nbsp;</label>
				<input type="text" class="form-control" id="nwriter" value="id" readonly >
			</div>
			<div class="form-group">
				<label for="ndate">작성날짜 : &nbsp;</label>
				<input type="date" class="form-control" id="ndate" readonly>
			</div>
			<br><br><br>
			<div class="form-group">
				<label for="ntitle"> 첨부파일 </label>
				<input type="file" id="nfile">
			</div>
			</div>
			<br>
			<div class="form-group">
				<label for="qcontent">내용 : </label>
				<textarea class="form-control" id="qcontent" placeholder="문의내용" cols="90" rows="10"></textarea>
				<br>
				<span class="btnspan"><button class="btn btn-defult" data-dismiss="modal">수정</button>&nbsp;<button class="btn" data-dismiss="modal">취소</button></span>
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