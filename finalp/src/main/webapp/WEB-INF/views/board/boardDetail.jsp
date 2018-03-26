<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html >
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.rparea {
	display: none;
}
.rrparea {
	display: none;
}

</style>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script>
	function aropen(num){
		var con = document.getElementsByClassName("rparea");
		con[num].style.display = 'table-row';
		}
	function arropen(num){
		var con = document.getElementsByClassName("rrparea");
		con[num].style.display = 'table-row';
		}
	
	var detailform1 = function(num,cont){
		
		var form = document.createElement("form");
		var board_id = '<c:out value="${board.board_id}"/>';
		var member_id = '<c:out value="${loginUser.member_id}"/>';
		var rid=0;
		
		form.setAttribute("method","post");
		form.setAttribute("action","/finalp/brwrite.do");
		rid = num;
		
		var input_bid = document.createElement("input");
		var input_mid = document.createElement("input");
		var input_level = document.createElement("input");
		var input_rid = document.createElement("input");
		var input_cont = document.createElement("input");
		input_bid.setAttribute("type","hidden");
		input_bid.setAttribute("name","board_id");
		input_bid.setAttribute("value",board_id);
		input_mid.setAttribute("type","hidden");
		input_mid.setAttribute("name","member_id");
		input_mid.setAttribute("value",member_id);
		input_level.setAttribute("type","hidden");
		input_level.setAttribute("name","board_level");
		input_level.setAttribute("value",1);
		input_rid.setAttribute("type","hidden");
		input_rid.setAttribute("name","board_reply_id_ref");
		input_rid.setAttribute("value",rid);
		input_cont.setAttribute("type","hidden");
		input_cont.setAttribute("name","board_content");
		input_cont.setAttribute("value",cont);
		form.appendChild(input_bid);
		form.appendChild(input_mid);
		form.appendChild(input_level);
		form.appendChild(input_rid);
		form.appendChild(input_cont);
		document.body.appendChild(form);
		form.submit();
	}
var detailform0 = function(num,cont){
		
		var form = document.createElement("form");
		var board_id = '<c:out value="${board.board_id}"/>';
		var member_id = '<c:out value="${loginUser.member_id}"/>';
		var rid=0;
		
		form.setAttribute("method","post");
		form.setAttribute("action","/finalp/brupdate.do");
		rid = num;
		
		var input_bid = document.createElement("input");
		var input_mid = document.createElement("input");
		var input_level = document.createElement("input");
		var input_rid = document.createElement("input");
		var input_cont = document.createElement("input");
		input_bid.setAttribute("type","hidden");
		input_bid.setAttribute("name","board_id");
		input_bid.setAttribute("value",board_id);
		input_mid.setAttribute("type","hidden");
		input_mid.setAttribute("name","member_id");
		input_mid.setAttribute("value",member_id);
		input_level.setAttribute("type","hidden");
		input_level.setAttribute("name","board_level");
		input_level.setAttribute("value",1);
		input_rid.setAttribute("type","hidden");
		input_rid.setAttribute("name","board_reply_id");
		input_rid.setAttribute("value",rid);
		input_cont.setAttribute("type","hidden");
		input_cont.setAttribute("name","board_content");
		input_cont.setAttribute("value",cont);
		form.appendChild(input_bid);
		form.appendChild(input_mid);
		form.appendChild(input_level);
		form.appendChild(input_rid);
		form.appendChild(input_cont);
		document.body.appendChild(form);
		form.submit();
	}
	
	var cont = function(num){
		var conts = document.getElementsByName('board_content');
		var cont = conts[num].value; 
		return cont;
	}
	var contt = function(num){
		var conts = document.getElementsByName('board_contentt');
		var cont = conts[num].value; 
		return cont;
	}

</script>

</head>
<body>
	<c:import url="/WEB-INF/views/header.jsp" />

	<div class="container" style="margin-top: 5%; font-size : 1.5em">
		<div>
			<div class="col-lg-2"></div>
			<div class="col-lg-10">
			</div>
			<div class="col-lg-10">
				<table id="dt_basic" class="table table-striped table-bordered "
					width="80%" style="background: white;">

					<tr>
						<th>제목</th>
						<td>${board.title}</td>
					</tr>
					<tr>
						<th>작성자</th>
						<td>${board.member_name}</td>
					</tr>
					<tr>
						<th>작성일</th>
						<td>${board.creation_date}</td>
					</tr>
					<tr>
						<th>첨부 파일</th>
						<td><c:if test="${board.re_filename != 'null'}">
								<c:url var="fdown" value="bdownfile.do">
									<c:param name="rfile" value="${board.re_filename }" />
									<c:param name="ofile" value="${board.ori_filename }" />
								</c:url>
								<a href="${fdown}">${board.ori_filename}</a>
							</c:if> <c:if test="${board.re_filename == 'null'}">
								${board.ori_filename}
								</c:if></td>
					</tr>
					<tr>
						<th>내 용</th>
						<td>${board.content}</td>
					</tr>


				</table>
				<hr />
				<div id="buttoncontroll" style="float: right">
					<c:if test="${board.member_id == loginUser.member_id}">
						<c:url var="bmodify" value="bmodifyView.do">
							<c:param name="board_id" value="${board.board_id}" />
						</c:url>
						<button>
							<a href="${bmodify}">수 정</a>
						</button>
						<c:url var="bdelete" value="bdelete.do">
							<c:param name="board_id" value="${board.board_id}" />
						</c:url>
						<button>
							<a href="${bdelete}">삭 제</a>
						</button>
					</c:if>
					<c:if test="${board.member_id != loginUser.member_id}">
						
						<button>
							<a href="#" data-toggle="modal" data-target="#myRec">추 천</a>
						</button>
						<button>
							<a href="#" data-toggle="modal" data-target="#myModal">신 고</a>
						</button>
					</c:if>

					<a href="javascript:history.back()">[목록으로]</a>
				</div>

				<h3 style="display: inline-block;">댓 글</h3>

				<table id="dt_basic" class="table table-striped table-bordered "
					width="80%" style="background: white;">

					<c:set var="num" value="0" />
					<c:set var="num1" value="0" />
					<c:forEach var="boardR" items="${brlist}" varStatus="loop">
						<c:if test="${boardR.board_id == board.board_id}">
							<c:if test="${boardR.board_level == 0}">
								<tr>
									<th>${boardR.member_name }</th>
									<td>
									<c:if test="${boardR.report_count > 5 }">
										[신고된 댓글입니다.]
									</c:if>
									<c:if test="${boardR.report_count <= 5 }">
										${boardR.board_content}
									</c:if>
									
									<aa style="float:right"> <c:if
											test="${boardR.member_id == loginUser.member_id}">
											<c:url var="brdelete" value="brdelete.do">
												<c:param name = "board_id" value="${board.board_id}"/>
												<c:param name = "board_reply_id" value="${boardR.board_reply_id}"/>
											</c:url>
											<a href="${brdelete}">[삭제]</a>
											<small> ${boardR.creation_date}</small>
											<a href="#" onclick="aropen(${num}); return false"> [수정]</a>
										</c:if> <c:if test="${boardR.member_id != loginUser.member_id}">
											<a href="#" onclick="aropen(${num}); return false"> [답글]</a>
										 <small> ${boardR.creation_date}</small> 
										<a href="#" data-toggle="modal" data-target="#brReport">[신고]</a>
										</c:if>
										</aa>
									</td>
								</tr>
								<tr></tr>

								<tr class="rparea">
									<c:if test="${boardR.member_id == loginUser.member_id}">
										<th>수정하기</th>
									</c:if>
									<c:if test="${boardR.member_id != loginUser.member_id}">
										<th>└ Re 답글</th>
									</c:if>

									<td><textarea rows="4" cols="90" name="board_content"></textarea> 
										<c:if test="${boardR.member_id == loginUser.member_id}">
											<button
												onclick="detailform0(${boardR.board_reply_id},cont(${num}))"
												style="height: 100px; float: right; width: 90px;">수정하기</button>
										</c:if> 
										<c:if test="${boardR.member_id != loginUser.member_id}">
											<button
												onclick="detailform1(${boardR.board_reply_id},cont(${num}))"
												style="height: 100px; float: right; width: 90px;">등록하기</button>
										</c:if>
										<c:set var="num" value="${num+1}" />
									    </td>
								</tr>
								<tr></tr>
								<c:forEach var="boardRR" items="${brlist}">
									<c:if
										test="${boardR.board_reply_id == boardRR.board_reply_id_ref}">
										<tr>
											<th>└ Re${boardRR.member_name }</th>
											<td>
											<c:if test="${boardRR.report_count > 5 }">
												[신고된 댓글입니다.]
											</c:if>
											<c:if test="${boardRR.report_count <= 5 }">
												${boardRR.board_content}
											</c:if>
											<aa style="float:right">
												<c:if test="${boardRR.member_id != loginUser.member_id}">
													<small> ${boardRR.creation_date}</small>
													<a href="#" data-toggle="modal" data-target="#brrReport">[신고]</a> 
												</c:if> <c:if test="${boardRR.member_id == loginUser.member_id}">
												<c:url var="brdelete" value="brdelete.do">
												<c:param name = "board_id" value="${board.board_id}"/>
												<c:param name = "board_reply_id" value="${boardRR.board_reply_id}"/>
												</c:url>
													<a href="${brdelete}">[삭제]</a><small> ${boardRR.creation_date}</small> <a href="#" onclick="arropen(${num1}); return false">[수정]</a>
												</c:if> 
												</aa>
											</td>
										</tr>
										<tr class="rrparea">
											
											<th>수정하기</th>
										<td><textarea rows="4" cols="90" name="board_contentt"></textarea> 
											<button	onclick="detailform0(${boardRR.board_reply_id},contt(${num1}))"
												style="height: 100px; float: right; width: 90px;">수정하기</button>
												
										<c:set var="num1" value="${num1+1}" />
									    </td>
								</tr>
									</c:if>
									
									
									
									
									
									
									
									
									
									
								</c:forEach>
							</c:if>
						</c:if>
						
					</c:forEach>
				</table>


				<form action="brwrite.do" method="post">
					<input type="hidden" name="board_id" value="${board.board_id}">
					<input type="hidden" name="member_id"
						value="${loginUser.member_id}">
					<table id="dt_basic" class="table table-striped table-bordered "
						width="80%" style="background: white;">
						<tr>
							<th>댓글</th>
							<td><textarea rows="5" cols="90" name="board_content"></textarea>
								<input type="submit"
								style="height: 125px; float: right; width: 90px;" value="등록하기"></td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</div>
	 <!-- 신고 Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <form action="breport.do" method="post">
      <input type="hidden" name = "board_id" value="${board.board_id}">
      <div class="modal-content" style="font-size : 1.5em" >
        <div class="modal-header">
          <h4 class="modal-title">신고하기</h4>
        </div>
        <div class="modal-body">
                   
                      <table class ="table table-striped table-bordered" >
                      	<tr>
                      		<th>신고자</th> 
                      		<td><input type = "text" name="member_id" value="${loginUser.member_id }" readonly></td>
                      	</tr>
                      	<tr>
                      		<th>신고 내용</th>
                      		<td><textarea name ="report_reason" style="width : 100%" rows='5'></textarea></td>
                      	</tr>
                      </table>
                    
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
          <button type="submit" class="btn btn-default">신고하기</button>
        </div>
      </div>
      </form>
      
    </div>
  </div>
  
   <!-- 댓글 Modal -->
  <div class="modal fade" id="brReport" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <form action="brReport.do" method="post">
      <input type="hidden" name = "board_id" value="${board.board_id}">
      <div class="modal-content" style="font-size : 1.5em" >
        <div class="modal-header">
          <h4 class="modal-title">신고하기</h4>
        </div>
        <div class="modal-body">
                   
                      <table class ="table table-striped table-bordered" >
                      	<tr>
                      		<th>신고자</th> 
                      		<td><input type = "text" name="member_id" value="${loginUser.member_id }" readonly></td>
                      	</tr>
                      	<tr>
                      		<th>신고 내용</th>
                      		<td><textarea name ="report_reason" style="width : 100%" rows='5'></textarea></td>
                      	</tr>
                      </table>
                    
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
          <button type="submit" class="btn btn-default">신고하기</button>
        </div>
      </div>
      </form>
      
    </div>
  </div>
  
  
  
  	 <!-- 추천 Modal -->
  <div class="modal fade" id="myRec" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <form action="brecom.do" method="post">
      <input type="hidden" name = "member_id" value="${board.member_id}">
      <input type="hidden" name = "board_id" value="${board.board_id}">
      <input type="hidden" name = "board_id" value="${board.recommend_count}">
      <div class="modal-content" style="font-size : 1.5em" >
        <div class="modal-header">
          <h4 class="modal-titl">추천하기</h4>
        </div>
        <div class="modal-body">
					'${board.title}' 이 게시글을 추천하시겠습니까 ?
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
          <button type="submit" class="btn btn-default">추천하기</button>
        </div>
      </div>
      </form>
      
    </div>
  </div>
	
	
</body>
</html>