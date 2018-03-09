<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html >
<html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<style>
	table{
		font-size : 1.5em;
	}
	.left-side{
		margin-top : 5%;
		text-align : center;
		width : 100%;
		height : 2em;
		border : 1px solid black;
		font-size : 2em;
		border-radius: 4px;
	}
	a:link { color: red; text-decoration: none;}
 	a:visited { color: black; text-decoration: none;}
 	a:hover { color: blue; text-decoration: underline;}
	
</style>
<meta charset="UTF-8">
<title>board</title>
</head>
<body>
	<c:import url="/WEB-INF/views/header.jsp" />

	<div class="container" style="margin-top: 5%">
	<div>
	<div class="col-lg-2"></div>
			<div class="col-lg-10"><h2>게시판</h2></div>
	<div>
		<div>
			<div class="col-lg-2">
						<div class="left-side">
							<a href="#" style="color : black; background : white">
								전체 게시판
							</a>
						</div>
						<div class="left-side">
							<a href="#" style="color : black; background : white">
								물품 나눔 게시판
							</a>
						</div>
						<div class="left-side" style="color : white; background : gray; border-radius: 4px;">
							<a href="#">
								지식 나눔  게시판
							</a>
						</div>
			</div>
			<div class="col-lg-10">
				<table id="dt_basic"
					class="table table-striped table-bordered table-hover" width="80%"
					style="background: white;">
					<thead>
						<tr>
							<th>No.</th>
							<th>제목</th>
							<th>작성자</th>
							<th>작성일</th>
							<th>조회수</th>
							<th>추천수</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="board" items="${blist}">
							<tr>
								<td>${board.board_id}</td>
								<td><a href="bDetail.jsp" class="pointer noticeClick">${board.title}
								</a></td>
								<td>${board.member_name}</td>
								<td>${board.creation_date}</td>
								<td>${board.readcount}</td>
								<td>${board.recommend_count}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<hr />
				<div>
					<c:url var="writeform" value="writeForm.do">
						<c:param name="member_id" value="${loginUser.member_id}"/>
						<c:param name=""/>
					</c:url>
					<c:if test="${loginUser != null}">
					<a href="${writeform}" class="btn pull-right" style="background: gray; font-size : 1.5em">글쓰기</a>
					</c:if>
				</div>
				<div>
					<ol class="text-center pagination" >
						<li><a href="#">1</a></li>
						<li><a href="#">1</a></li>
					</ol>
				</div>
			</div>
		</div>
	</div>

</body>
</html>