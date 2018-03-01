<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>loginModal.jsp</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<style>
	#loginBtn, #logoutBtn{
		font-weight: bold;
		text-decoration: none;
		align: right;
		font-family: 8pt bold black;
		margin-right: 10%;
	}
</style>

<script>
	function login(){
		console.log("로그인");
		$("#loginForm").submit();
	}
</script>

</head>
<body>
<div>
<c:if test="${ empty loginUser }">
	<a id="loginBtn" data-toggle="modal" data-target="#loginModal">로그인</a>
	
	<div class="modal fade" id="loginModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Log-in</h4>
        </div>       
        <div class="modal-body">
         <form id="loginForm" action="login.do" method="post">
          ID : <input type="text" name="member_id" autofocus/> <br>
          password : <input type="password" name="member_pwd"/> <br>
          <input type="submit" class="btn btn-default" data-dismiss="modal"
          onclick="login()" value="LOGIN"/>
         </form>
        </div>
      </div>
      
    </div>
  </div>
</c:if>
<c:if test="${ !empty loginUser }">
	${ loginUser.member_name }&nbsp;님 환영합니다.&nbsp;
	<a id="logoutBtn" href="logout.do">로그아웃</a>
</c:if>
</div>
</body>
</html>