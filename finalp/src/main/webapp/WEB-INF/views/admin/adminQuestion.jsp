<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>문의글</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <link href="/finalp/resources/css/adminPage.css" rel="stylesheet">
  <style>
  div#question{
		font-family:"맑은 고딕";
		margin-top:2%;
		margin-left:5%;
		margin-right:10%;
		display:inline-block;
		width: 60%;
		float:center;
		font-size: 13px;
  }
	#question div.searchdiv{
		width: 20%;
		float:right;
	}
	#question div.qutable{
		margin-top: 5%;
	}
/* 	h4.modal-title{
		float:left;
	} */
	#question #quModal div.modal-body{
		height: auto;
	}
	#question #quModal div.modal-body #qtitle{
		width: 720px;
	}
	#question #quModal div.modal-body #qwriter{
		width:300px;
	}
	#question #quModal div.modal-body #qdate{
		width:330px;
	}
	#question #quModal div.modal-body #qacontent{
		width: 80%
	}
	#question #quModal div.modal-body button.subt{
		margin-top:10px;
		width: 140px;
		height: 140px;

	}
  </style>
 </head>
 <body class="skin_main">
 <c:import url="adminMenu.jsp"/>
   <div id="lnb_area">
    <div class="lnb">
      <ul> 
         <li class="on">
            <a href="adminMain.do" style="color:black;">QUESTION <em style="color:black"></em></a>
         </li>
      </ul>
   </div>
</div>

<div id="question">
<h2>문의글</h2>

<div class="searchdiv">
  <form action="#">
    <div class="input-group">
      <select class="form-control">
		<option>답변 미완료</option>
		<option>답변 완료</option>
		<option>ca3</option>
		<option>ca4</option>
		</select>
    </div>
  </form>
</div>
<br>

  <div class="qutable">
  <table class="table table-hover" >
    <thead>
      <tr class="active">
        <th>작성자</th>
        <th>문의글 제목</th>
		<th>작성날짜</th>
		<th>답변</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>aaa</td>
        <td>Anna</td>
		<td>Anna</td>
		<td><button class="btn" data-toggle="modal" data-target="#quModal">답변</button></td>
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


<!-- Modal -->
  <div class="modal fade" id="quModal" role="dialog">
    <div class="modal-dialog modal-lg">
    
      <!-- Modal content-->
      <div class="modal-content">
         <div class="modal-header"> 
         <h4 class="modal-title">문의글 답변하기</h4> 
           <button type="button" class="close" data-dismiss="modal">&times;</button> 
        </div>
        <div class="modal-body">
			<div class="form-inline">
			<div class="form-group">
				<label for="qtitle"> 제목 : &nbsp;</label>
				<input type="text" class="form-control" id="qtitle" placeholder="제목 입력">
			</div>
			<br><br><br>
			<div class="form-group">
				<label for="qwriter">작성자 : &nbsp;</label>
				<input type="text" class="form-control" id="qwriter" value="id" readonly >&nbsp;
			</div>
			<div class="form-group">
				<label for="qdate">작성날짜 : &nbsp;</label>
				<input type="date" class="form-control" id="qdate">
			</div>
			</div>
			<br>
			<div class="form-group">
				<label for="qcontent">문의내용  </label>
				<textarea class="form-control" id="qcontent" placeholder="문의내용" cols="90" rows="10"></textarea>
			</div>
			
			<div class="form-group">
				<label for="qacontent">답변내용  </label>
			<div class="form-inline">
				<textarea class="form-control" id="qacontent" placeholder="답변내용" cols="90" rows="10"></textarea>
				&nbsp;<button type="submit" class="btn subt" data-dismiss="modal">보내기</button>
			</div>
			</div>
			</div>
      </div>
    </div>
  </div>

</div>

<c:import url="../footer.jsp"></c:import>
</body>
</html>