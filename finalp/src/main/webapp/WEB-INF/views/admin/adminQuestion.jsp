<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>문의글</title>
  <link href="/finalp/resources/css/adminPage.css" rel="stylesheet">
  <style>
  div#question{
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
	#question button{
		font-size: 13px;
	}
	#question div.searchdiv{
		width: 15%;
		float:right;
	}
	#question div.qutable{
		margin-top: 5%;
		text-align: center;
	}
	#question button.anbt{
		background-color:#F3F781;
	}
	#question a{
		color: black;
	}
	#question div.modal-body{
		height: auto;
	}
	#question div.modal-body #qtitle,#qtitle2{
		font-size: 14px;
		width: 720px;
	}
	#question div.modal-body #qwriter,#qwriter2{
		font-size: 14px;
		width:300px;
	}
	#question div.modal-body #qdate,#qdate2{
		font-size: 14px;
		width:330px;
	}
	#question div.modal-body #qacontent{
		font-size: 14px;
		width: 80%;
		background-color: #FAECC5;
	}
	#question div.modal-body #qcontent,#qcontent2{
		font-size: 14px;
	}
	#question div.modal-body #qancontent{
		font-size: 14px;
		background-color: #FAECC5;
	}
	#question div.modal-body button.subt{
		width: 140px;
		height: 140px;

	}
	#question select#recont{
		height:30px;
		font-size: 14px;
	}
  </style>
  <script type="text/javascript" src="/finalp/resources/js/jquery-3.3.1.min.js"></script>
  <script type="text/javascript">
//등록 폼 값 있는지 체크!	
	function check(){
		if(qupform.re_content.value == ''){
			alert("답변을 입력해주세요!");
			qupform.re_content.focus();
			return false;
		}else {
			return true;
		}
		
	}
  
  //문의글 답변MODAL
  	function qubtn(questionid){
  		$.ajax({
  	  		url:"adminQuDetail.do",
  	  		type: "post",
  	  		data: { questionid : questionid } ,
  	  		dataType: "json",
  	  		success:function(data){ 
  	  			console.log(data);
  	  			
  	  				var jsonStr = JSON.stringify(data);
					//변환된 문자열을 json 객체로 바꿈
					var json = JSON.parse(jsonStr);
					
					$("#qudemo").empty();
					
					var values = $("#qudemo").html();
					
					values += "<div class='form-inline'> <div class='form-group'><label for='qtitle'>제목 : &nbsp; </label>"+
							"<input type='text' class='form-control' id='qtitle' value='"+ decodeURIComponent(json.title.replace(/\+/g," ")) +"' readonly> </div> <br><br><br>"+
							"<div class='form-group'> <label for='qwriter'>작성자 : &nbsp;</label> <input type='text' class='form-control' id='qwriter' value='"+
							decodeURIComponent(json.send_member_name.replace(/\+/g," ")) + "' readonly >&nbsp; </div><div class='form-group'><label for='qdate'>작성날짜 : &nbsp;</label>"+
							"<input type='date' class='form-control' id='qdate' value='"+ json.send_creation_date + "' readonly> </div></div><br>"+
							"<div class='form-group'> <label for='qcontent'>문의내용  </label> <textarea class='form-control' id='qcontent' cols='90' rows='7' readonly>"+
							decodeURIComponent(json.content.replace(/\+/g," "))+"</textarea></div>";
							if( json.re_content == null){
								values += "<div class='form-group'><label for='qacontent'>답변내용  </label>"+
								"<form name='qupform' onsubmit='return check()' action='adminQuUpdate.do' method='post' ><div class='form-inline'> "+
								"<textarea class='form-control' id='qacontent' placeholder='답변을 써주세요' name='re_content' cols='90' rows='6'></textarea>"+
								"<input type='hidden' name='question_id' value='"+json.question_id+"'>"+
								"&nbsp;<button type='submit' class='btn subt'>보내기</button></form> </div> </div>";
							}else{
								values += "<div class='form-group'><label for='qcontent2'>답변내용  </label><textarea class='form-control' id='qancontent' cols='90' rows='6' readonly>"+
										decodeURIComponent(json.re_content.replace(/\+/g," ")) + "</textarea></div>";
							}
					
					$("#qudemo").html(values);
					
  	  			},
  	  			error: function(request, status, errorData){
					alert("error code : " + request.status + "\n" 
						+ "message : " + request.responseText + "\n"
						+ "error : " + errorData );	
				}
  	  	});
  	}
  	
  	//검색 ajax
  		function recontChange(){
  			var recont = document.getElementById("recont");
  			var option = recont.options[recont.selectedIndex].value;
  			console.log("option : "+option)
  			$.ajax({
  				url: "searchQuestion.do",
  				data:{
  					option :  option
  				},
  				type: "post",
  				dataType: "json",
  				success: function(data){
					var jsonStr = JSON.stringify(data);
 					
 					var json = JSON.parse(jsonStr);
 					
 					$('#qtable').empty();
 					
 					var value = "<table class='table table-bordered table-hover' id='qtable'><thead><tr class='active'>"+
 							"<th>작성자</th><th>문의글 제목</th><th>작성날짜</th><th>답변</th></tr></thead><tbody>";
 					
 							
 					if(json.sqlist.length > 0 ){
 						for(var i in json.sqlist){
							value +="<tr><td>"+decodeURIComponent(json.sqlist[i].send_member_name)+"</td><td>"
								+decodeURIComponent(json.sqlist[i].title.replace(/\+/g," "))+
								"</td><td>"+json.sqlist[i].send_creation_date+"</td>";
								if(json.sqlist[i].re_content == null){
									value+="<td><button class='btn anbt' data-toggle='modal'data-target='#quModal' "+
										"onclick='qubtn("+json.sqlist[i].question_id+")'>답변</button></td></tr>";
								}else{
									value+="<td>완료 &nbsp;<button class='btn anbt' data-toggle='modal'data-target='#quModal' "+
										"onclick='qubtn("+json.sqlist[i].question_id+")'>상세보기</button></td></tr>";
								}
						}
					}else{
						value += "<tr><td colspan='4'>조회된 문의함 내역이 없습니다.</td></tr>"
					}
 					
 					$('#qtable').html(value);
  					
  				},
  				error: function(request, status, errorData){
					alert("error code : " + request.status + "\n" 
						+ "message : " + request.responseText + "\n"
						+ "error : " + errorData );	
				}
  			});
  			
  		};
  </script>
 </head>
 <body class="skin_main">
 <c:import url="adminMenu.jsp" />
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
<h3>문의글</h3>
<hr class="hrst">
<br>
<div class="searchdiv">
    <div class="input-group">
      <select class="form-control" name="recont" id="recont" onchange="recontChange()">
		<option value="all">----</option>
		<option value="nore">답변 미완료</option>
		<option value="okre">답변 완료</option>
	  </select>
    </div>
</div>
<br>

  <div class="qutable">
  <table class="table table-bordered table-hover" id="qtable" >
    <thead>
      <tr class="active">
        <th>작성자</th>
        <th>문의글 제목</th>
		<th>작성날짜</th>
		<th>답변</th>
      </tr>
    </thead>
		<tbody>
			<c:choose>
				<c:when test="${ fn:length(qlist) > 0}">
					<c:forEach items="${ qlist }" var="qrow" >
						<tr>
							<td>${ qrow.send_member_name }</td>
							<td>${ qrow.title }</td>
							<td>${ qrow.send_creation_date }</td>
							<td><c:choose>
							<c:when test="${ qrow.re_content eq null }">
								<button class="btn anbt" data-toggle="modal"data-target="#quModal" onclick="qubtn(${ qrow.question_id })">답변</button>
							</c:when>
								<c:when test="${ qrow.re_content ne null }"> 완료 &nbsp; 
								<button class="btn anbt" data-toggle="modal"data-target="#quModal" onclick="qubtn(${ qrow.question_id })">상세보기</button> </c:when>
							</c:choose></td>
						</tr>
					</c:forEach>
				</c:when>
			</c:choose> 
		</tbody>
	</table>
  </div>


<!-- Modal -->
  <div class="modal fade" id="quModal" role="dialog">
    <div class="modal-dialog modal-lg">
    
      <!-- Modal content-->
      <div class="modal-content">
         <div class="modal-header"> 
         <h4 class="modal-title">문의글</h4> 
           <button type="button" class="close" data-dismiss="modal">&times;</button> 
        </div>
        <div class="modal-body" id="qudemo">
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
			<form action="adminQuUpdate.do" method="post">
				<textarea class="form-control" id="qacontent" placeholder='답변을 써주세요' name='re_content' cols="90" rows="10"></textarea>
				
				&nbsp;<button type="submit" class="btn subt" data-dismiss="modal">보내기</button>
			</form>
			</div>
			</div>
		</div>
      </div>
    </div>
  </div>
  
  <!-- Modal -->
  <div class="modal fade" id="quModal" role="dialog">
    <div class="modal-dialog modal-lg">
    
      <!-- Modal content-->
      <div class="modal-content">
         <div class="modal-header"> 
         <h4 class="modal-title">문의글 상세보기</h4> 
           <button type="button" class="close" data-dismiss="modal">&times;</button> 
        </div>
        <div class="modal-body" id="qudemoo">
			<div class="form-inline">
			<div class="form-group">
				<label for="qtitle2"> 제목 : &nbsp;</label>
				<input type="text" class="form-control" id="qtitle2" placeholder="제목 입력">
			</div>
			<br><br><br>
			<div class="form-group">
				<label for="qwriter2">작성자 : &nbsp;</label>
				<input type="text" class="form-control" id="qwriter2" value="id" readonly >&nbsp;
			</div>
			<div class="form-group">
				<label for="qdate2">작성날짜 : &nbsp;</label>
				<input type="date" class="form-control" id="qdate2">
			</div>
			</div>
			<br>
			<div class="form-group">
				<label for="qcontent2">문의내용  </label>
				<textarea class="form-control" id="qcontent2" placeholder="문의내용" cols="90" rows="10"></textarea>
			</div>
			
			<div class='form-group'>
				<label for='qcontent2'>답변내용  </label>
				<textarea class='form-control' id='qancontent' cols='90' rows='10'></textarea>
			</div>
			</div>
      </div>
    </div>
  </div>

</div>

<c:import url="../footer.jsp"></c:import>
</body>
</html>