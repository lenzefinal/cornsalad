
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의글</title>

 <c:import url="myQuestionHeader.jsp"/>
 <c:import url="myQuestionSide.jsp" />
  <style>
  	
  	 div#question{
		font-family:"맑은 고딕";
		margin-top:2%;
		margin-right:10%;
		margin-bottom: 20%;
		display:inline-block;
		width: 100%;
		float:center;
		font-size: 13px;
  }
  #question div.qutable{
		margin-top: 5%;
		text-align: center;
	}
	td{
		font-size:13px;
	}
	td img{
		width:200px;
		height:200px;
	}
	th,td{
  		text-align:center;
  		border-right:0.5px solid silver;
  	}
	.limg{
		width:230px;
	}
	td:nth-child(3){
		width:180px;
		text-align:center;
	}
	
	div#container{
		height:900px;
	}
	.btn_more {
	    font-weight: 600;
	    line-height: 14px;
	    display: block;
	    overflow: hidden;
	    width: 45px;
	    height: 15px;
	    margin: 0 auto;
	    vertical-align: top;
	    text-decoration: underline;
	    letter-spacing: -1px;
	    color: #666;
	   	font-size:14px;
	   	cursor:pointer;
	}
	div.display-none{
		display:none;
	}
</style>
 </head>
 <body class="skin_main">
<div id="container" style="height:724px;">
		<div id="content" class="section_home" >
			
			<input type="hidden" name="send_member_id" value="${loginUser.member_id }"/>
			<div class="c_header">
				<h2>나의 문의</h2>
				<p class="contxt">내가 보낸 문의를 확인할 수 있어요.</p>
			</div>
		</div>
		
		<h5 style="font-weight:bold; font-family:맑은고딕">문의함</h5>
		<hr style="background-color:#F7D358; border:1.5px solid #F7D358">
			<div id="question">
			<table class="table table-bordered table-hover" cellspacing="0" border="1">
				<thead>
					<tr  class="active">
						<th style="border-right:0.5px solid silver;">제목</th>
						<th style="border-right:0.5px solid silver; width:24%;">수신자</th>
						<th style="border-right:0.5px solid silver; width:16%">문의 날짜</th>
						<th style="width:16%">답변</th>
					</tr>
				</thead>
				<tbody id="qlist">
					<c:forEach var="qlist" items="${ question }">
					<tr>
						<td style="border-right:0.5px solid silver;">
						<a href="" onclick="qbtn(${qlist.question_id})" data-toggle="modal" data-target="#myQ" style="text-decoration:underline; color:black;">
						${qlist.title }</a>
						</td>
						<c:if test="${qlist.receive_member_id eq 'admin' }">
						<td style="border-right:0.5px solid silver; width:24%;">관리자</td>
						</c:if>
						<c:if test="${qlist.receive_member_id ne 'admin' }">
						<td style="border-right:0.5px solid silver; width:24%;">${qlist.receive_member_id }</td>
						</c:if>
						<td style="border-right:0.5px solid silver; width:16%">${qlist.send_creation_date }</td>
						<c:if test="${empty qlist.re_content }">
						<td style="width:16%">답변이 아직..</td>
						</c:if>
						<c:if test="${not empty qlist.re_content }">
						<td style="width:16%"><button class="btn btn-info btn-sm" data-toggle="modal" data-target="#rqdetail" onclick="rqbtn(${qlist.question_id})">답변</button></td>
						</c:if>
					</tr>
					</c:forEach>
					
				</tbody>
			</table>
		</div>
		<div id="result" style="text-align:center;"></div>
	</div>
		
<!-- 스크립트문 -->

<script type="text/javascript">
	var member_id=$('#send_member_id').val();
	function qbtn(qid){
		$.ajax({
			url:"myQdetail.do",
			data:{question_id:Number(qid), send_member_id: member_id},
			dataType:"json",
			type:"post",
			success:function(e){
				var jsonStr = JSON.stringify(e);
				//변환된 문자열을 json 객체로 바꿈
				var json = JSON.parse(jsonStr);
				
				$("#myQdetail").empty();
				
				var value = $("#myQdetail").html();
				value+='<div class="form-inline">'
						+'<div class="form-group">'
						+'<h6><b> 제목 : </b></h6>'
						+'&nbsp;<input type="text"  class="form-control"  readonly value="'
						+decodeURIComponent(json.title)+'">'
						+'</div>'
						+'</div>'
						+'<br>'
						+'<div class="form-inline">'
						+'<div class="form-group">'
						+'<h6><b> 문의 날짜 : </b></h6>'
						+'&nbsp;<input type="text"  class="form-control"  readonly value="'
						+json.send_creation_date+'">'
						+'</div>'
						+'</div>'
						+'<br>'
						+'<div class="form-inline">'
						+'<div class="form-group">'
						+'<textarea name="content" class="form-control" id="qcontent" placeholder="문의내용" cols="90" rows="10" readonly>'
						+decodeURIComponent(json.content);
						+'</textarea>'
						+'</div>'
						+'</div>'
						+'<br>'
					$('#myQdetail').html(value);
			},
			error: function(request, status, errorData){
					alert("error code : " + request.status + "\n" 
						+ "message : " + request.responseText + "\n"
						+ "error : " + errorData );	
			}
		});
	}
	function rqbtn(qid){
		$.ajax({
			url:"rQdetail.do",
			data:{question_id:Number(qid), send_member_id: member_id},
			dataType:"json",
			type:"post",
			success:function(e){
				var jsonStr = JSON.stringify(e);
				//변환된 문자열을 json 객체로 바꿈
				var json = JSON.parse(jsonStr);
				
				$("#receiveQdetail").empty();
				
				var value = $("#receiveQdetail").html();
				if(json.receive_member_id=='admin'){
				value+= '<div class="modal-header">'
		         		+'<h4 class="modal-title"> 관리자 님의 답변 </h4> '
		         		+'<button type="button" class="close" data-dismiss="modal">&times;</button>'
		         		+'</div>'
		         		+'<div class="modal-body">'
		         		+'<div class="form-inline">'
		         		+'<div class="form-group">'
		         		+'<h6><b> 제목 : </b></h6>'
						+'&nbsp;<input type="text" class="form-control" readonly value="[RE]'
						+decodeURIComponent(json.title)+'">'
						+'</div>'
						+'</div>'
						+'<br>'
						+'<div class="form-inline">'
						+'<div class="form-group">'
						+'<h6><b> 답변 날짜 : </b></h6>'
						+'&nbsp;<input type="text"  class="form-control"  readonly value="'
						+json.receive_creation_date+'">'
						+'</div>'
						+'</div>'
						+'<br>'
						+'<div class="form-inline">'
						+'<div class="form-group">'
						+'<textarea name="content" class="form-control" id="rcontent" placeholder="문의내용" cols="90" rows="10" readonly>'
						+decodeURIComponent(json.re_content)
						+'</textarea>'
						+'</div>'
						+'</div>'
						+'<br>'
		        		+'</div>'
				} else {
				value+='<div class="modal-header">'
		         		+'<h4 class="modal-title">'
						+decodeURIComponent(json.receive_member_id)+'님의 답변 </h4> '
		         		+'<button type="button" class="close" data-dismiss="modal">&times;</button> '
		         		+'</div>'
		         		+'<div class="modal-body" id="myQdetail">'
		         		+'<div class="form-inline">'
		         		+'<div class="form-group">'
		         		+'<h6><b> 제목 : </b></h6>'
						+'&nbsp;<input type="text" class="form-control" readonly value="[RE]'
						+decodeURIComponent(json.title)+'">'
						+'</div>'
						+'</div>'
						+'<br>'
						+'<div class="form-inline">'
						+'<div class="form-group">'
						+'<h6><b> 답변 날짜 : </b></h6>'
						+'&nbsp;<input type="text" class="form-control" readonly value="'
						+json.receive_creation_date+'">'
						+'</div>'
						+'</div>'
						+'<br>'
						+'<div class="form-inline">'
						+'<div class="form-group">'
						+'<textarea name="content" class="form-control" id="rcontent" placeholder="문의내용" cols="90" rows="10" readonly>'
						+decodeURIComponent(json.re_content)
						+'</textarea>'
						+'</div>'
						+'</div>'
						+'<br>'
		        		+'</div>'
				}
					$('#receiveQdetail').html(value);
			},
			error: function(request, status, errorData){
					alert("error code : " + request.status + "\n" 
						+ "message : " + request.responseText + "\n"
						+ "error : " + errorData );	
			}
		});
	}
</script>
 
  <!-- 내가 보낸 문의 보기 -->
  <div class="modal fade" id="myQ" role="dialog">
    <div class="modal-dialog modal-lg">
      <!-- Modal content-->
      <div class="modal-content" >
       <div class="modal-header">
        <h4 class="modal-title">나의 문의 상세보기</h4> 
           <button type="button" class="close" data-dismiss="modal">&times;</button> 
        </div>
        <div class="modal-body" id="myQdetail">
       </div>
      </div>
    </div>
  </div>
  
  <!-- 답변 -->
 <div class="modal fade" id="rqdetail" role="dialog">
    <div class="modal-dialog modal-lg">
      <!-- Modal content-->
      <div class="modal-content"  id="receiveQdetail">
         <div class="modal-header"> 
       
		</div>
      </div>
    </div>
  </div>
  
</body>
</html>