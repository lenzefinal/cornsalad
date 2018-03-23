
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
			
			<input type="hidden" id="receive_member_id" value="${loginUser.member_id }"/>
			<div class="c_header">
				<h2>받은 문의</h2>
				<p class="contxt">내가 받은 문의를 확인할 수 있어요.</p>
			</div>
		</div>
		
		<h5 style="font-weight:bold; font-family:맑은고딕">문의함</h5>
		<hr style="background-color:#F7D358; border:1.5px solid #F7D358">
			<div id="question">
			<table class="table table-bordered table-hover" cellspacing="0" border="1">
				<thead>
					<tr  class="active">
						<th style="border-right:0.5px solid silver;">제목</th>
						<th style="border-right:0.5px solid silver; width:24%;">발신자</th>
						<th style="border-right:0.5px solid silver; width:16%">문의 날짜</th>
						<th style="width:16%">답변</th>
					</tr>
				</thead>
				<tbody id="qlist">
					<c:forEach var="list" items="${ question }">
					<tr>
						<td style="border-right:0.5px solid silver;">
						<a href="" onclick="Qdetail(${list.question_id})" data-toggle="modal" data-target="#rmyQ" style="text-decoration:underline; color:black;">
						${list.title }</a>
						</td>
						<td style="border-right:0.5px solid silver; width:24%;">${list.send_member_id }</td>
						<td style="border-right:0.5px solid silver; width:16%">${list.send_creation_date }</td>
						<c:if test="${empty list.re_content }">
						<td style="width:16%">
						<button class="btn btn-info btn-sm" data-toggle="modal" data-target="#rmQ" onclick="receiveQ(${list.question_id })">
							답변하기
						</button></td>
						</c:if>
						<c:if test="${not empty list.re_content }">
						<td style="width:16%">
						<button class="btn btn-danger btn-sm" data-toggle="modal" data-target="#rmQ" onclick="receiveQ(${list.question_id})">상세보기
						</button>
						</td>
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
var member_id=$('#receive_member_id').val();
	function Qdetail(qid){
		
		console.log(member_id)
		$.ajax({
			url:"rmyQdetail.do",
			data:{question_id:Number(qid), receive_member_id: member_id},
			dataType:"json",
			type:"post",
			success:function(e){
				var jsonStr = JSON.stringify(e);
				//변환된 문자열을 json 객체로 바꿈
				var json = JSON.parse(jsonStr);
				
				$("#mreQdetail").empty();
				
				var value = $("#mreQdetail").html();
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
						+'<h6><b> 보낸 사람 : </b></h6>'
						+'&nbsp;<input type="text"  class="form-control"  readonly value="'
						+decodeURIComponent(json.send_member_id)+'">'
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
					$('#mreQdetail').html(value);
			},
			error: function(request, status, errorData){
					alert("error code : " + request.status + "\n" 
						+ "message : " + request.responseText + "\n"
						+ "error : " + errorData );	
			}
		});
	}
	function receiveQ(qid){
		console.log(member_id);
		$.ajax({
			url:"receiveQForm.do",
			data:{question_id:Number(qid), receive_member_id: member_id},
			dataType:"json",
			type:"post",
			success:function(e){
				var jsonStr = JSON.stringify(e);
				//변환된 문자열을 json 객체로 바꿈
				var json = JSON.parse(jsonStr);
				
				$("#reQdetail").empty();
				
				var value = $("#mreQdetail").html();
				if(json.re_content==null) {
					value+='<div class="form-inline">'
						+'<div class="form-group">'
						+'<h6><b> 제목 : </b></h6>'
						+'&nbsp;<input type="text"  class="form-control"  readonly value="[RE]'
						+decodeURIComponent(json.title)+'">'
						+'</div>'
						+'</div>'
						+'<br>'
						+'<div class="form-inline">'
						+'<div class="form-group">'
						+'<h6><b> 보낸 사람 : </b></h6>'
						+'&nbsp;<input type="text"  class="form-control"  readonly value="'
						+decodeURIComponent(json.send_member_id)+'">'
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
						+decodeURIComponent(json.content)
						+'</textarea>'
						+'</div>'
						+'</div>'
						+'<br>'
						+'<div class="form-inline">'
						+'<div class="form-group">'
						+'<form action="receiveQ.do" method="post">'
						+'<textarea name="re_content" class="form-control" id="re_content" placeholder="답변 내용" cols="90" rows="10">'
						+'</textarea>'
						+'<input type="hidden" name="receive_member_id" value="'+json.receive_member_id+'">'
						+'<input type="hidden" name="question_id" value="'+json.question_id+'">'
						+'<br>'
						+'<button type="submit" class="btn btn-primary btn-sm" style="margin-left:85%">답변 보내기</button>'
						+'</form>'
						+'</div>'
						+'</div>'
						+'<br>'
				} else{
					value+='<div class="form-inline">'
						+'<div class="form-group">'
						+'<h6><b> 제목 : </b></h6>'
						+'&nbsp;<input type="text" class="form-control"  readonly value="[RE]'
						+decodeURIComponent(json.title)+'">'
						+'</div>'
						+'</div>'
						+'<br>'
						+'<div class="form-inline">'
						+'<div class="form-group">'
						+'<h6><b> 보낸 사람 : </b></h6>'
						+'&nbsp;<input type="text" class="form-control"  readonly value="'
						+decodeURIComponent(json.send_member_id)+'">'
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
						+decodeURIComponent(json.content)
						+'</textarea>'
						+'</div>'
						+'</div>'
						+'<br>'
						+'<div class="form-inline">'
						+'<div class="form-group">'
						+'<textarea name="rcontent" class="form-control" id="rcontent" placeholder="답변 내용" cols="90" rows="10" readonly>'
						+decodeURIComponent(json.re_content)
						+'</textarea>'
						+'</div>'
						+'</div>'
						+'<br>'
					}
					$('#reQdetail').html(value);
			},
			error: function(request, status, errorData){
					alert("error code : " + request.status + "\n" 
						+ "message : " + request.responseText + "\n"
						+ "error : " + errorData );	
			}
		});
		
	}

</script>
 
  <!-- 내가 받은 문의 보기 -->
  <div class="modal fade" id="rmyQ" role="dialog">
    <div class="modal-dialog modal-lg">
      <!-- Modal content-->
      <div class="modal-content" >
       <div class="modal-header">
        <h4 class="modal-title">받은 문의 상세보기</h4> 
           <button type="button" class="close" data-dismiss="modal">&times;</button> 
        </div>
        <div class="modal-body" id="mreQdetail">
       </div>
      </div>
    </div>
  </div>
  
  <!-- 답변하기 -->
  <div class="modal fade" id="rmQ" role="dialog">
    <div class="modal-dialog modal-lg">
      <!-- Modal content-->
      <div class="modal-content" >
       <div class="modal-header">
        <h4 class="modal-title">답변하기</h4> 
           <button type="button" class="close" data-dismiss="modal">&times;</button> 
        </div>
        <div class="modal-body" id="reQdetail">
       </div>
      </div>
    </div>
  </div>

  
</body>
</html>