<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>loginModal.jsp</title>
<!-- 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- <style>
	#loginBtn, #logoutBtn{
		font-weight: bold;
		text-decoration: none;
		align: right;
		font-family: 8pt bold black;
		margin-right: 10%;
	}
</style> -->

<style>
	#login-jsp{
		margin: 0;
    	padding: 0;
	}
	.modal-open .modal {
	    overflow-x: hidden;
	    overflow-y: auto;
	}
	.fade.in {
	    opacity: 1;
	}
	.modal {
	    position: fixed;
	    top: 0;
	    right: 0;
	    bottom: 0;
	    left: 0;
	    z-index: 1050;
	    display: none;
	    overflow: hidden;
	    -webkit-overflow-scrolling: touch;
	    outline: 0;
	    box-sizing: border-box;
	}
	.fade {
	    opacity: 0;
	    -webkit-transition: opacity .15s linear;
	    -o-transition: opacity .15s linear;
	    transition: opacity .15s linear;
	}
	.modal.fade .modal-dialog {
	    -webkit-transition: -webkit-transform .3s ease-out;
	    -o-transition: -o-transform .3s ease-out;
	    transition: transform .3s ease-out;
	    -webkit-transform: translate(0,-25%);
	    -ms-transform: translate(0,-25%);
	    -o-transform: translate(0,-25%);
	    transform: translate(0,-25%);
	}
	.modal.in .modal-dialog {
	    -webkit-transform: translate(0,0);
	    -ms-transform: translate(0,0);
	    -o-transform: translate(0,0);
	    transform: translate(0,0);
	}
	
	.modal-dialog {
	    position: relative;
	    width: auto;
	    margin: 10px;
	}
	@media (min-width: 768px){
		.modal-dialog {
		    width: 500px;
		    margin: 30px auto;
		}
	}
	
	.modal-content {
	    position: relative;
	    background-color: #fff;
	    -webkit-background-clip: padding-box;
	    background-clip: padding-box;
	    border: 1px solid #999;
	    border: 1px solid rgba(0,0,0,.2);
	    border-radius: 6px;
	    outline: 0;
	    -webkit-box-shadow: 0 3px 9px rgba(0,0,0,.5);
	    box-shadow: 0 3px 9px rgba(0,0,0,.5);
	}
	@media (min-width: 768px){
		.modal-content {
		    -webkit-box-shadow: 0 5px 15px rgba(0,0,0,.5);
		    box-shadow: 0 5px 15px rgba(0,0,0,.5);
		}
	}
	
	.modal-header {
	    padding: 15px;
	    border-bottom: 1px solid #e5e5e5;
	}
	.modal-header .close {
	    margin-top: -2px;
	}
	button.close {
	    -webkit-appearance: none;
	    padding: 0;
	    cursor: pointer;
	    background: 0 0;
	    border: 0;
	}
	.close {
	    float: right;
	    font-size: 21px;
	    font-weight: 700;
	    line-height: 1;
	    color: #000;
	    text-shadow: 0 1px 0 #fff;
	    filter: alpha(opacity=20);
	    opacity: .2;
	}
	
	
	.modal-body {
	    position: relative;
	    padding: 15px;
	}
	
	#login-title-je {
		text-align: center;
		margin-top: 20px;
		margin-bottom: 20px;
		color: rgba(70,70,70,1.0);
	}
	#login-body-div-je {
		border: 1px solid rgba(70,70,70,0.6);
		border-radius: 5px;
		align: center;
		text-align: center;
	}
	
	#login-body-div-je input{
		border-radius: 2px;
		size: 10;
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
<c:if test="${ empty loginUser }">
<!-- 	<a id="loginBtn" data-toggle="modal" data-target="#loginModal">로그인</a> -->
	
	<div class="modal fade" id="loginModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-body">
         <h3 id="login-title-je" class="modal-title">LOG-IN</h3>
         <div id="login-body-div-je">
	         <form id="loginForm" action="login.do" method="post">
	         	<table>
	         		<tr>
	         			<td>ID</td>
	         			<td><input type="text" name="member_id" autofocus/></td>
	         		</tr>
	         		<tr>
	         			<td>password</td>
	         			<td><input type="password" name="member_pwd"/></td>
	         		</tr>
	         		<tr>
	         			<td colspan="2"><input type="submit" class="btn btn-default" data-dismiss="modal"
	          							onclick="login()" value="LOGIN"/></td>
	         		</tr>
	         	</table>
	         </form>
         </div>
        </div>
      </div>
      
    </div>
  </div>
</c:if>
<%-- <c:if test="${ !empty loginUser }">
	${ loginUser.member_name }&nbsp;님 환영합니다.&nbsp;
	<a id="logoutBtn" href="logout.do">로그아웃</a>
</c:if> --%>
</body>
</html>