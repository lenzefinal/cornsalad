<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html >
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
th {
	background: #999;
	width: 20%;
}
</style>
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
				<form action="binsert.do" method="post"
					enctype="multipart/form-data">
					<table id="dt_basic" class="table table-bordered ">
						<tr>
							<th>제목</th>
							<td><input type="text" name="title"></td>
						</tr>
						<tr>
							<th>작성자</th>
							<td><input type="text" name="member_id"
								value="${loginUser.member_id}" readonly></td>
						</tr>
						<tr>
							<th>종 류</th>
							<td><input type="radio" name="board_category_id"
								value="BCA-STU">지식 나눔
							<input type="radio" name="board_category_id"
								value="BCA-PRO">물품 나눔</td>
						</tr>
						<tr>
							<th>첨부 파일</th>
							<td><input type="file" name="uploadFile"></td>
						</tr>
						<tr>
							<th>내 용</th>
							<td><textarea rows="5" cols="50" name="content"></textarea></td>
						</tr>
						<tr>
							<td colspan="2"><input type="submit" value="등록하기"></td>
						</tr>

					</table>
				</form>
				<hr />
				<div id="buttoncontrill">
					<a href="#">[이전으로]</a>
				</div>
			</div>
		</div>
	</div>
</body>
</html>