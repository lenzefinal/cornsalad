<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>통계</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <link href="/finalp/resources/css/adminPage.css" rel="stylesheet">
 <style>
	div#stat{
		font-family:"맑은 고딕";
		margin-top:2%;
		margin-left:5%;
		margin-right:10%;
		display:inline-block;
		width: 60%;
		float:center;
		font-size: 13px;
 	}
@media (max-width: 320px){
	display:block;
 }
	#stat a#sta{
		text-decoration: none;
		color: #353535;
	}
	#stat a#sta:hover{
		background-color:#E4F7BA;
	}
	#stat div.stback{
		width:100%;
		height:500px;
		background-color:#A5A5A5;
	}
	#stat ul.stli{
		background-color:#F6FFCC;
	}
 </style>
 </head>
  <body class="skin_main">
 <c:import url="adminMenu.jsp"/>
   <div id="lnb_area">
    <div class="lnb">
      <ul> 
         <li class="on">
            <a href="adminMain.do" style="color:black;">STATISTICS <em style="color:black"></em></a>
         </li>
      </ul>
   </div>
</div>
 
<div id="stat">
  <h2>통계</h2>
  <ul class="nav nav-tabs stli">
    <li class="active"><a href="#home" id="sta">PROJECT</a></li>
    <li><a href="#menu1" id="sta">PRODUCT</a></li>
    <li><a href="#menu2" id="sta">SPONSOR</a></li>
  </ul>
  <div class="tab-content">
    <div id="home" class="tab-pane fade in active">
    <br>
      <h4><strong>프로젝트</strong> 매출 TOP 10</h4>
	  <hr>
      <div class="stback"></div>
    </div>
    <div id="menu1" class="tab-pane fade">
    <br>
      <h4><strong>공동구매</strong> 매출 TOP 10</h4>
      <hr>
	  <div class="stback"></div>
    </div>
    <div id="menu2" class="tab-pane fade">
    <br>
      <h4><strong>후원자</strong> TOP 3</h4>
      <hr>
	  <div class="stback"></div>
    </div>
  </div>
</div>

<script>
$(document).ready(function(){
    $(".nav-tabs a").click(function(){
        $(this).tab('show');
    });
});
</script>

<c:import url="../footer.jsp"></c:import>

</body>
</html>