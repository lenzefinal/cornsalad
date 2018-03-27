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
			<div class="con_menu_wrap">
			<ul class="tour_menu">
				<c:if test="${pagectr.c_id ==null}">
				<li class="on">
				</c:if>
				<c:if test="${pagectr.c_id !=null}">
				<li>
				</c:if>
					<a href="wcList.do?page=1">자유 채팅방</a>
				</li>
				<c:if test="${pagectr.c_id == 'pj'}">
				<li class="on">
				</c:if>
				<c:if test="${pagectr.c_id != 'pj'}">
				<li >
				</c:if>
				
					<a href="wcList.do?c_id=pj&page=1">프로젝트</a>
				</li>
				<c:if test="${pagectr.c_id == 'pr'}">
				<li class="on">
				</c:if>
				<c:if test="${pagectr.c_id != 'pr'}">
				<li >
				</c:if>
					<a href="wcList.do?c_id=pr&page=1">공동구매 </a>
				</li>		
			</ul>
		</div>
			
			<div style="margin-top: 10px;">
				<table id="dt_basic" class="table table-striped table-bordered table-hover" width="80%" style="background: white;">
					<thead>
						<tr >
							<th width = "50%">방이름</th>
							<th width = "50%">만든이</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="wc" items="${wcList}">
							<c:if test="${wc.room_reply_id == wc.room_id }">
							<tr>
								<c:url var ="inchat" value="inchat.do">
									<c:param name="room_reply_id" value="${wc.room_id}"/>
									<c:param name="room_name" value="${wc.room_name}"/>
									<c:param name="member_id" value="${loginUser.member_id}"/>
								</c:url>
								<td>
								<c:if test="${loginUser !=null}">
								<a href="#" onclick="window.open('${inchat}','채팅창','width=500,height=600, left=1500, resizable=0'); return false" class="pointer noticeClick">${wc.room_name}	</a>
								</c:if>
								<c:if test="${loginUser ==null}">
								${wc.room_name}
								</c:if>
								</td>
								<td>
								${wc.member_id}
								</td>
							</tr>
							</c:if>
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
						<c:if test="${pagectr.c_id == null}">
							<button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">채팅방 만들기</button>
						</c:if>
					</c:if>
				</div>
				<div class="pageCenter" style="clear: both;">
					<ol class="text-center pagination" >
						<c:if test="${pagectr.currentpage > 1}">
						<li><a href="wcList.do?page=${pagectr.currentpage-1}&c_id=${pagectr.c_id}">[이전]</a></li>
						</c:if>
						<c:if test="${pagectr.currentpage <= 1}">
						<li><a href="#" onclik="return false">[이전]</a></li>
						</c:if>
						<c:forEach var ="i" begin="${pagectr.startpage }" end="${pagectr.endpage}">
						<c:if test="${pagectr.currentpage == i}">
						<li ><a href="wcList.do?page=${i}&c_id=${pagectr.c_id}" style="background : #FCFCEF">${i}</a></li>
						</c:if>
						<c:if test="${pagectr.currentpage != i}">
						<li><a href="wcList.do?page=${i}&c_id=${pagectr.c_id}">${i}</a></li>
						</c:if>
						</c:forEach>
						<c:if test="${pagectr.currentpage < pagectr.maxpage}">
						<li><a href="wcList.do?page=${pagectr.currentpage+1 }&c_id=${pagectr.c_id}">[다음]</a></li>
						</c:if>
						<c:if test="${pagectr.currentpage >= pagectr.maxpage}">
						<li><a href="#" onclick="return false">[다음]</a></li>
						</c:if>
					</ol>
				</div>
			</div>
		</div>
	
	</div>
	
	
	 <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
      <form action="chat.do" method = "post" target="채팅방">
      	<input type = "hidden" name="member_id" value="${loginUser.member_id }" readonly>
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">채팅방 만들기</h4>
        </div>
        <div class="modal-body">
        	 <table class ="table table-striped table-bordered" >
                  	<tr>
                   		<th>채팅방 이름</th> 
                   		<td><input type = "text" name="room_name"></td>
                   	</tr>
              </table>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
          <button type="submit" onclick="chat(this.form)"class="btn btn-default">만들기</button>
        </div>
        </form>
      </div>
      
    </div>
  </div>
	
	<script>
	var chat=function(form){
		var url = "chat.do";
		var title="채팅방";
		var status="width=500,height=600, left=1500, resizable=0";
		window.open('',title,status);
		form.target = title;
		form.action=url;
		form.method = 'post';
		form.submit();
	}
	</script>
</body>
</html>

