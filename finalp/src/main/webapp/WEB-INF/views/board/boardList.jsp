<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html >
<html>
<head>

	<link href="/finalp/resources/css/projectListView.css" rel="stylesheet">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
	table{
		font-size : 1.5em;
	}
	th{
		color : #F7D358;
	}
	.left-side>a:link { color: red; text-decoration: none;}
 	.left-side>a:visited { color: black; text-decoration: none;}
 	.left-side>a:hover { color: blue; text-decoration: underline;}
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
 		background: #FCFCEF;
 	}
 	.con_menu_wrap ul.tour_menu li {
    width: 33%;
    float: left;
    height: 53px;
    border: 1px solid #e6e6e6;
    line-height: 53px;
    border-right: 0;
    text-align: center;
    background: #fff;
    box-sizing: border-box;
}
	.con_menu_wrap ul li.on {
    color: #F7D358;
    border-bottom: 3px solid #F7D358;
}
</style>
<meta charset="UTF-8">
<title>board</title>
</head>
<body style="background:#f6f5f5;">
	<c:import url="/WEB-INF/views/header.jsp" />

	<div class="container" style="margin-top: 5%;">
		
		<div class="col-lg-10">
			<div class="row">
				<div class="col-lg-12">
					 <div class="col-lg-4" ><img src="/finalp/resources/images/best5.png" height = "100%"></div>
					
					<div class="col-lg-4" >
					<table class="table table-bordered table-hover">
						
						<tr style="background : #FCFCEF ">
							<th>
							</th>
							<th >
								조회수
							</th>
						</tr>
						<c:forEach var="view" items="${bestViewList }" varStatus="index">
						<tr>
							<td>
							${index.count}
							</td>
							<td>
								<c:if test="${loginUser !=null }">
								<c:url var ="bdetail" value="bdetail.do">
									<c:param name="board_id" value="${view.board_id}"/>
								</c:url>
								<a href="${bdetail}" class="pointer noticeClick">${view.title}</a>
								</c:if>
								<c:if test="${loginUser ==null }">
									${view.title}
								</c:if>
							</td>
						</tr>
						</c:forEach>
					</table>
					</div>
					<div class="col-lg-4" >
					<table class="table  table-bordered table-hover">
						
						<tr style="background : #FCFCEF ">
							<th>
							</th>
							<th>
								추천수
							</th>
						</tr>
						<c:forEach var="Rec" items="${bestRecList }" varStatus="index">
						<tr>
							<td>
							${index.count}
							</td>
							<td>
								<c:if test="${loginUser !=null }">
								<c:url var ="bdetail" value="bdetail.do">
									<c:param name="board_id" value="${Rec.board_id}"/>
								</c:url>
								<a href="${bdetail}" class="pointer noticeClick">${Rec.title}</a>
								</c:if>
								<c:if test="${loginUser ==null }">
									${Rec.title}
								</c:if>
							</td>
						</tr>
						</c:forEach>
					</table>
					</div>
				</div>
			</div>
			<div class="con_menu_wrap">
			<ul class="tour_menu">
				<c:if test="${pagectr.c_id ==null}">
				<li class="on">
				</c:if>
				<c:if test="${pagectr.c_id !=null}">
				<li>
				</c:if>
					<a href="blist.do?page=1">전체 게시판</a>
				</li>
				<c:if test="${pagectr.c_id == 'pro'}">
				<li class="on">
				</c:if>
				<c:if test="${pagectr.c_id != 'pro'}">
				<li >
				</c:if>
				
					<a href="blist.do?c_id=pro&page=1">물품 나눔 게시판</a>
				</li>
				<c:if test="${pagectr.c_id == 'stu'}">
				<li class="on">
				</c:if>
				<c:if test="${pagectr.c_id != 'stu'}">
				<li >
				</c:if>
					<a href="blist.do?c_id=stu&page=1">지식 나눔 게시판</a>
				</li>		
			</ul>
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
								<td>
								<c:if test="${loginUser !=null}">
								<a href="${bdetail}" class="pointer noticeClick">${board.title}	</a>
								</c:if>
								<c:if test="${loginUser ==null}">
								${board.title}
								</c:if>
								</td>
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
						<c:if test="${pagectr.currentpage > 1}">
						<li><a href="blist.do?page=${pagectr.currentpage-1}&c_id=${pagectr.c_id}">[이전]</a></li>
						</c:if>
						<c:if test="${pagectr.currentpage <= 1}">
						<li><a href="#" onclik="return false">[이전]</a></li>
						</c:if>
						<c:forEach var ="i" begin="${pagectr.startpage }" end="${pagectr.endpage}">
						<c:if test="${pagectr.currentpage == i}">
						<li ><a href="blist.do?page=${i}&c_id=${pagectr.c_id}" style="background : #FCFCEF">${i}</a></li>
						</c:if>
						<c:if test="${pagectr.currentpage != i}">
						<li><a href="blist.do?page=${i}&c_id=${pagectr.c_id}">${i}</a></li>
						</c:if>
						</c:forEach>
						<c:if test="${pagectr.currentpage < pagectr.maxpage}">
						<li><a href="blist.do?page=${pagectr.currentpage+1 }&c_id=${pagectr.c_id}">[다음]</a></li>
						</c:if>
						<c:if test="${pagectr.currentpage >= pagectr.maxpage}">
						<li><a href="#" onclick="return false">[다음]</a></li>
						</c:if>
					</ol>
				</div>
			</div>
		</div>
	
	</div>
	
</body>
</html>