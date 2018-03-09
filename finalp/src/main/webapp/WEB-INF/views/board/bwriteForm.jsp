<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.tb{
	border-collapse:collapse;
	border:1px solid black;
}

</style>
</head>
<body>

	<form action="binsert.do" method="post" enctype="multipart/form-data">
		<table align="center" width="500">
			<tr>
				<td>작성자</td>
				<td><input type="text" name="member_id" value="${loginUser.member_id}" readonly></td>
			</tr>
			<tr>
				<td>종 류</td>
				<td><input type="radio" name="board_category_id" value="BCA-STU">지식 나눔</td>
				<td><input type="radio" name="board_category_id" value="BCA-PRO">물품 나눔</td>
			</tr>
			<tr>
				<td>제 목</td>
				<td><input type="text" name="title"></td>
			</tr>
			<tr>
				<td>첨부파일</td>
				<td><input type="file" name="uploadFile"></td>
			</tr>
			<tr>
				<td>내 용</td>
				<td><textarea rows="5" cols="50" name="content"></textarea></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="등록하기"></td>
			</tr>
		</table>
	</form>
	
</body>
</html>