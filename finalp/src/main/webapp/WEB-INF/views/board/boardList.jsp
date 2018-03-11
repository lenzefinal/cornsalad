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
	a:link { color: red; text-decoration: none;}
 	a:visited { color: black; text-decoration: none;}
 	a:hover { color: blue; text-decoration: underline;}
 	.pageCenter{
 		position: relative;
 		margin: auto;
 		display: table;
 	}
 	.pageCenter>ol>li>a{
 		font-size: 1.5em;
 	}
 	a{
 		text-decoration: none !important;
 	}
 	.left-side{
 		border: 1px solid #999;
 		border-radius: 5px;
 		padding:5px 10px;
 	}
 	.left-side a{
 		color: #444;
 		font-size: 1.7em;
 	}
 	.active{
 		background: pink;
 	}
	
</style>
<meta charset="UTF-8">
<title>board</title>
</head>
<body>
	<c:import url="/WEB-INF/views/header.jsp" />

	<div class="container" style="margin-top: 5%">
		<div class="col-lg-2">
			<div class="left-side">
				<a href="#">
					전체 게시판
				</a>
			</div>
			<div class="left-side" style="margin: 5px 0;">
				<a href="#">
					물품 나눔 게시판
				</a>
			</div>
			<div class="left-side active">
				<a href="#">
					지식 나눔  게시판
				</a>
			</div>
		</div>
		<div class="col-lg-10">
			<div class="row">
				<div class="col-lg-12">
					<div class="col-lg-4" style="background: green">리스트</div>
					<div class="col-lg-4" style="background: yellow">리스트</div>
					<div class="col-lg-4" style="background: green">리스트</div>
				</div>
			</div>
			
			<div style="margin-top: 10px;">
				<table id="dt_basic" class="table table-striped table-bordered table-hover" width="80%" style="background: white;">
					<thead>
						<tr>
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
								<c:url var ="bdetail" value="bdetail.do">
									<c:param name="board_id" value="${board.board_id}"/>
								</c:url>
								<td><a href="${bdetail}" class="pointer noticeClick">${board.title}
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
					<a href="${writeform}" class="btn pull-right" style="background: #efefef; border: 1px solid #999; font-size : 1.5em">글쓰기</a>
					</c:if>
				</div>
				<div class="pageCenter" style="clear: both;">
					<ol class="text-center pagination" >
						<li><a href="#">1</a></li>
						<li><a href="#">1</a></li>
						<li><a href="#">1</a></li>
						<li><a href="#">1</a></li>
						<li><a href="#">1</a></li>
						<li><a href="#">1</a></li>
						<li><a href="#">1</a></li>
						<li><a href="#">1</a></li>
						<li><a href="#">1</a></li>
					</ol>
				</div>
			</div>
		</div>
	
	</div>

</body>
</html>