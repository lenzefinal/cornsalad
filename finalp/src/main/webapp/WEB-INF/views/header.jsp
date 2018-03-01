<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>header.jsp</title>
</head>

<style>
	header #header-in{
		background-color: ivory;
	}
</style>

<body>
<header>

<c:import url="/WEB-INF/views/member/loginModal.jsp"/>

<div id="header-in">
<hr>
<h1>header</h1>
<hr>
</div>

</header>
</body>
</html>