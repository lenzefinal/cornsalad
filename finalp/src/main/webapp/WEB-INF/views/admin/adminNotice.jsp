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
		margin-left:5%;
		margin-right:10%;
		display:inline-block;
		width: 60%;
		float:center;
		font-size: 13px;
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
  <h2>공지사항</h2>
	<hr>
	<button class="btn btn-warning" data-toggle="modal" data-target="#nomodal">공지사항 등록</button>
	<br>
	<hr>
	<div class="panel-group" id="accordion">
    <div class="panel panel-default">
      <div class="panel-heading">
        <h4 class="panel-title">
          <a data-toggle="collapse" data-parent="#accordion" href="#collapse1">공지사항1</a>
		  <span class="btnspan"><button class="btn btn-success" data-toggle="modal" data-target="#nomodal2">수정</button>&nbsp;<button class="btn btn-danger">삭제</button></span>
        </h4>
      </div>
      <div id="collapse1" class="panel-collapse collapse in">
        <div class="panel-body">Lorem ipsum dolor sit amet, consectetur adipisicing elit,
        sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
        quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</div>
      </div>
    </div>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h4 class="panel-title">
          <a data-toggle="collapse" data-parent="#accordion" href="#collapse2">공지사항2</a>
		  <span class="btnspan"><button class="btn btn-success" >수정</button>&nbsp;<button class="btn btn-danger">삭제</button></span>
        </h4>
      </div>
      <div id="collapse2" class="panel-collapse collapse">
        <div class="panel-body">Lorem ipsum dolor sit amet, consectetur adipisicing elit,
        sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
        quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</div>
      </div>
    </div>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h4 class="panel-title">
          <a data-toggle="collapse" data-parent="#accordion" href="#collapse3">공지사항3</a>
		  <span class="btnspan"><button class="btn btn-success">수정</button>&nbsp;<button class="btn btn-danger">삭제</button></span>
        </h4>
      </div>
      <div id="collapse3" class="panel-collapse collapse">
        <div class="panel-body">Lorem ipsum dolor sit amet, consectetur adipisicing elit,
        sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
        quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</div>
      </div>
    </div>
  </div> 

  <hr>
 
<!--  <div class="page">
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
				<span class="btnspan"><button class="btn btn-defult" data-dismiss="modal">등록</button>&nbsp;<button class="btn" data-dismiss="modal">취소</button></span>
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