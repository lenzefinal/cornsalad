<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html >
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
	<c:import url="/WEB-INF/views/header.jsp" />

	<div class="container" style="margin-top: 5%">
		<div>
			<div class="col-lg-2"></div>
			<div class="col-lg-10">
				<h2>게시판 상세보기</h2>
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
					<button>추 천</button>
					<button>신 고</button>
					<a href="#">[목록으로]</a>
				</div>

				<h3 style="display: inline-block;">댓 글</h3>
				<table id="dt_basic" class="table table-striped table-bordered "
					width="80%" style="background: white;">
					<c:forEach var="boardR" items="${brlist}">
						<c:if test="${boardR.board_id == board.board_id}">
							<c:if test="${boardR.board_level == 0}">
								<tr>
									<th>${boardR.member_name }</th>
									<td>${boardR.board_content}<aa style="float:right"> <c:url
											var="brwrite" value="brwrite.do">
											<c:param name="board_reply_id"
												value="${boardR.board_reply_id}" />
												<c:param name="board_id" value="${board.board_id}" />
												<c:param name="member_id" value="${loginUser.member_id}" />
											<c:param name="board_level" value="${boardR.board_level}" />
										</c:url> <a href="${brwrite }">[답글]</a> <small>${boardR.creation_date}</small>
										<a href=""#>[신고]</a> </aa>
									</td>

								</tr>
								<c:forEach var="boardRR" items="${brlist}">
									<c:if
										test="${boardR.board_reply_id == boardRR.board_reply_id_ref}">
										<tr>
											<th>└ Re${boardRR.member_name }</th>
											<td>${boardRR.board_content}<aa style="float:right">
												<c:url var="brwrite" value="brwrite.do">
													<c:param name="board_reply_id"
														value="${boardR.board_reply_id}" />
													<c:param name="board_level" value="${boardR.board_level}" />
												</c:url> <a href="${brwrite }">[답글]</a> <small>${boardRR.creation_date}</small>
												<a href=""#>[신고]</a> </aa>
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
					<input type="hidden" name="member_id" value="${loginUser.member_id}">
						<table id="dt_basic" class="table table-striped table-bordered "
					width="80%" style="background: white;">
					<tr>
						<th>댓글 달기</th>
						<td><textarea rows="5" cols="100" name="board_content"></textarea> <input type="submit"  style =" height: 125px;float:right;width: 90px;" value="등록하기"></td>
					</tr>
				</table>
				</form>
			</div>
		</div>
	</div>
</body>
</html>