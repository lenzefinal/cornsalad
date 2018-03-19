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
		margin-left:25%;
		margin-right:10%;
		display:inline-block;
		width: 60%;
		float:center;
		font-size: 13px;
 	}
 	hr.hrst{
		background-color:#F7D358;
		border:1.5px solid #F7D358; 
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
	#stat .tab{
		list-style: none;
		margin: 0;
		padding: 0;
		overflow: hidden;
		}
	#stat .tab li{
		float: left;
	}
	#stat .tab li a {
		display: inline-block;
		color: #000;
		text-align: center;
		text-decoration: none;
		padding: 14px 16px;
		font-size: 15px;
		transition:0.3s;
	}
	#stat .tabcontent {
		display: none;
		background-color:#F6FFCC;
		padding: 6px 12px;
		color:black;
	}
	#stat ul.tab li.current{
		background-color: #F6FFCC;
		color: black;
	}
	#stat .tabcontent.current {
		display: block;
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
  <h3>통계</h3>
  <hr class="hrst">
  <ul class="tab">
    <li class="current" data-tab="tab1"><a href="#" id="sta">CATEGORY COUNT</a></li>
    <li data-tab="tab2"><a href="#" id="sta">PROJECT TOP 10</a></li>
    <li data-tab="tab3"><a href="#" id="sta">SPONSOR TOP 3</a></li>
  </ul>

    <div id="tab1" class="tabcontent current">
    <br>
      <h4><strong>카테고리 </strong>별 프로젝트 현황</h4>
	  <hr>
      <div class="stback"></div>
    </div>
    <div id="tab2" class="tabcontent">
    <br>
      <h4><strong>매출</strong> TOP 10</h4>
      <hr>
	  <div class="stback"></div>
    </div>
    <div id="tab3" class="tabcontent">
    <br>
      <h4><strong>후원자</strong> TOP 3</h4>
      <hr>
	  <div class="stback"></div>
    </div>
  </div>


<script>
$(function() {
	$('ul.tab li').click(function() {
		var activeTab = $(this).attr('data-tab');
		$('ul.tab li').removeClass('current');
		$('.tabcontent').removeClass('current');
		$(this).addClass('current');
		$('#' + activeTab).addClass('current');
	})
});
</script>

<c:import url="../footer.jsp"></c:import>

</body>
</html>