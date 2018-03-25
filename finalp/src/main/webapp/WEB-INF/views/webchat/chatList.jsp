<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  
</head>
<body>
<table id="dt_basic" class="table table-striped table-bordered table-hover" width="80%" style="background: white;">
					<thead>
						<tr>
							<th>방이름</th>
							<th>만든이</th>
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
</body>
</html>