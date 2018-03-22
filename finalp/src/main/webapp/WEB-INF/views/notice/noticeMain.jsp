<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>공지사항</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>

div#noticediv{
	font-family:"맑은 고딕";
	margin-left:15%;
	margin-right:15%;
	margin-bottom:20%;
	display:inline-block;
	width: 70%;
	float:center;
	font-size: 13px;
}
img.iconi{
	width:5%;
}

.section {
    margin-bottom: 60px;
}
.section {
    margin-bottom: 40px;
}
.hero {
    background-color: #F3F781;
    background-position: center;
    background-size: cover;
    height: 300px;
    padding: 0 20px;
    text-align: center;
    width: 100%;
}

.hero-inner {
    color: #ffffff;
    position: relative;
    top: 50%;
    transform: translateY(-50%);
    max-width: 610px;
    margin: 0 auto;
}
* {
    box-sizing: border-box;
}

div {
    display: block;
}

.search {
    position: relative;
}

h1{
	font-family:"맑은 고딕";
	color: black;
}

form {
    display: block;
    margin-top: 0em;
}
result-votes::before, .search-result-meta-count::before {
    font-family: "copenhagen-icons";
    font-style: normal;
    font-weight: normal;
    speak: none;
    line-height: 1em;
    vertical-align: middle;
    -webkit-font-smoothing: antialiased;
}
.search::before {
    position: relative;
    top: 50%;
    transform: translateY(-50%);
    background-color: #fff;
    color: #ddd;
    content: "\1F50D";
    font-size: 18px;
    position: absolute;
    left: 15px;
}
.search-full input[type="search"] {
    border: 1px solid #fff;
}
.search input[type="search"] {
    border: 1px solid #ddd;
    box-sizing: border-box;
    color: #999;
    height: 40px;
    padding-left: 40px;
    padding-right: 20px;
    -webkit-appearance: none;
    width: 100%;
}
input[type="search"] {
    -webkit-appearance: textfield;
    box-sizing: content-box;
}
input {
    font-weight: 400;
    max-width: 100%;
    box-sizing: border-box;
    outline: none;
    transition: border .12s ease-in-out;
}
input, textarea {
    color: #000;
    font-size: 14px;
}
input {
    line-height: normal;
}
button, input, optgroup, select, textarea {
    color: inherit;
    font: inherit;
    margin: 0;
}
input {
    -webkit-appearance: textfield;
    background-color: white;
    -webkit-rtl-ordering: logical;
    cursor: text;
    padding: 1px;
    border-width: 2px;
    border-style: inset;
    border-color: initial;
    border-image: initial;
}

input, textarea, select, button {
    text-rendering: auto;
    color: initial;
    letter-spacing: normal;
    word-spacing: normal;
    text-transform: none;
    text-indent: 0px;
    text-shadow: none;
    display: inline-block;
    text-align: start;
    margin: 0em;
    font: 400 13.3333px Arial;
}

input, textarea, select, button, meter, progress {
    -webkit-writing-mode: horizontal-tb;
}
span#cdate{
	font-size:13px;
	color:#5D5D5D;
}


</style>
<script type="text/javascript" src="/finalp/resources/js/jquery-3.3.1.min.js"></script>
  <script type="text/javascript">
 $(function(){
  //공지사항 검색
	 $('#query').keypress(function(e){
	  if ((e.which && e.which == 13) || (e.keyCode && e.keyCode == 13)){
	     var searchN=document.getElementById("query").value;
	     console.log(searchN);
	     $.ajax({
	    	url:"searchNotice.do",
	    	data: {
	    		searchN : searchN
	    	},
	    	type:"post",
	    	dataType: "json",
	    	success : function(data){
	    		var jsonStr = JSON.stringify(data);
					
				var json = JSON.parse(jsonStr);
				
				$('#accordion').empty();
				
				var value="<div class='panel-group' id='accordion' style='font-size:16px;'>";
				
				if(json.snlist.length > 0){
					for(var i in json.snlist){
						value+="<div class='panel panel-default'><div class='panel-heading'><h4 class='panel-title'><a data-toggle='collapse' data-parent='#accordion'"+
								" href='#notice"+ json.snlist[i].notice_id +"'>"+ decodeURIComponent(json.snlist[i].title.replace(/\+/g," ")) + 
								"</a></span></h4></div><div id='notice"+
								json.snlist[i].notice_id + "' class='panel-collapse collapse '><div class='panel-body'><span id='cdate'>" +
								json.snlist[i].creation_date + "작성 </span> <br><hr>"+ 
								decodeURIComponent(json.snlist[i].content.replace(/\+/g," ")) + "</div></div></div>";
					}
				}else{
					value += "<div class='panel panel-default'><div class='panel-heading'><h4 class='panel-title'>조회된 결과가 없습니다.</h4></div></div>";
				}
				
				$('#accordion').html(value);
					
			},
				error: function(request, status, errorData){
				alert("error code : " + request.status + "\n" 
					+ "message : " + request.responseText + "\n"
					+ "error : " + errorData );	
			}
	     });
	        
	  }
	});
 });
  </script>
</head>
<body style="background-color:#f5f6f8; font-size:17px;">
 <c:import url="../header.jsp"/>
 
<section class="section hero" style="margin-top:3%;">
  <div class="hero-inner">
    <h1 style="color:black;">무엇을 도와드릴까요?</h1>
    <div role="search" class="search search-full" data-instant="true" autocomplete="off">
    <input name="utf8" type="hidden" value="✓">
    <input type="search" name="query" id="query" placeholder="검색" autocomplete="off" aria-label="검색">
    </div>
    <br>
  </div>
</section>
<div id="noticediv" >
<h3>NOTICE</h3>
<hr>

<div class="panel-group" id="accordion" style="font-size:16px;">
    <c:forEach items="${ nlist }" var="nrow" >
    <div class="panel panel-default" id="noupform">
      <div class="panel-heading">
        <h4 class="panel-title">
          <a data-toggle="collapse" data-parent="#accordion" href="#notice${ nrow.notice_id }">${ nrow.title }</a></span>
        </h4>
      </div>
      <div id="notice${ nrow.notice_id }" class="panel-collapse collapse ">
        <div class="panel-body">
        	<span id="cdate" style="font-size:13px;"> ${ nrow.creation_date } 작성 </span> <br>
        	<hr>
        	${ nrow.content }
        </div>
      </div>
    </div>
    </c:forEach>
  </div> 
  
<%--   <!-- 페이지 번호 처리 -->
	<div style="text-align:center;">
	<c:url var="first" value="noticeMain.do">
		<c:param name="currentPage" value="1" />
	</c:url>
	<a href="${first }">[<<]</a>
	<c:url var="prev" value="noticeMain.do">
		<c:param name="currentPage" value="${startPage - limit }" />
	</c:url>
	<a href="${prev }">	[<]</a>
	<c:forEach var="p" begin="${startPage }" end="${endPage }" step="1">
	<c:url var="page" value="noticeMain.do">
		<c:param name="currentPage" value="${p }" />
	</c:url>
	<c:if test="${p ne currentPage }">
		<a href="${page }">	| ${p } |&nbsp; </a> 
	</c:if>
	<c:if test="${p eq currentPage }">	
	<a href="${page }">	| <b>${p }</b> |&nbsp; </a>
	</c:if>
	</c:forEach>
	<c:url var="next" value="noticeMain.do">
		<c:param name="currentPage" value="${endPage + limit }" />
	</c:url>
	<a href="${next }">	[>]</a>
	<c:url var="last" value="noticeMain.do">
		<c:param name="currentPage" value="${maxPage }" />
	</c:url>
	<a href="${last }">[>>]</a>
	</div> --%>

</div>
 

 <c:import url="../footer.jsp"></c:import>
</body>
</html>