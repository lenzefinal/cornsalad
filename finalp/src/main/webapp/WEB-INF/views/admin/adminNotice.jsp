<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>공지사항</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="/finalp/resources/css/adminPage.css" rel="stylesheet">
  <style>
  div#notice{
		font-family:"맑은 고딕";
		margin-top:2%;
		margin-left:25%;
		margin-right:10%;
		margin-bottom: 20%;
		display:inline-block;
		width: 60%;
		float:center;
		font-size: 13px;
  }
  hr.hrst{
		background-color:#F7D358;
		border:1.5px solid #F7D358; 
  }
  #notice div.searchdiv{
		width: 20%;
		float:right;
		margin-bottom: 5%;
  }
  #notice button#bid{
		border:1px solid #ced4da;
  }
  #notice img.iconi{
		width:15px;
  }
  #notice span.btnspan{
		float:right;
  }
  #notice a{
  		color:black;
  }
  #notice button{
		font-size:13px;
		margin-top:-8px;
  }
  #notice textarea#ncont{
  		height:auto;
  		font-size:14px;
  }
  #notice input#ntit{
  		width:800px;
  		font-size:14px;
  		height: 30px;
  }
  #notice #nomodal div.modal-body , #notice #nomodal2 div.modal-body{
		height: auto;
		background-color: #FFE08C;
		color:black;
  }
  #notice #nomodal div.modal-body #ntitle , #notice #nomodal2 div.modal-body #ntitle{
		font-size: 14px;
		width: 720px;
  }
  #notice #nomodal div.modal-body #nwriter , #notice #nomodal2 div.modal-body #nwriter{
		font-size: 14px;
		width:700px;
  }
  #notice #nomodal div.modal-body #ndate , #notice #nomodal2 div.modal-body #ndate{
		font-size: 14px;
		width:330px;
  }
  #notice div.modal-body textarea{
  		font-size:14px;
  }
  #notice button.inbt{
		font-size:16px;
		background-color:#F7D358;
  }
  #notice button.mobt{
  		background-color:#654693;
  		font-size: 12px;
  		color:white;
  }
  #notice button.debt{
  		background-color:#1D004B;
  		font-size: 12px;
  		color:white;
  }
  #notice span#cdate{
  		color:#5D5D5D;
  }
  #notice input#query{
  		font-size:14px;
  }
  </style>
  <script type="text/javascript" src="/finalp/resources/js/jquery-3.3.1.min.js"></script>
  <script type="text/javascript">
  //등록 폼 값 있는지 체크!	
  	function check(){
  		if(noinform.title.value == ''){
  			alert("제목을 입력해주세요!");
  			noinform.title.focus();
  			return false;
  		}else if(noinform.content.value == ''){
  			alert("내용을 입력해주세요!");
  			noinform.content.focus();
  			return false;
  		}else {
  			return true;
  		}
  		
  	}
  
  //공지사항 수정 ajax
  	function noupbtn(noticeid){
  		$.ajax({
  	  		url:"adminNoticeDet.do",
  	  		type: "post",
  	  		data: { noticeid : noticeid } ,
  	  		dataType: "json",
  	  		success:function(data){ 
  	  			console.log(data);
  	  				
  	  				var jsonStr = JSON.stringify(data);
					//변환된 문자열을 json 객체로 바꿈
					var json = JSON.parse(jsonStr);
					
					$("#noupform").empty(); 
					
					var values = $("#noupform").html();
					
					values += "<form action='adminNoticeUp.do' method='post'><div class='panel-heading'><h4 class='panel-title'>"+
					"<input type='hidden' name='notice_id' value='"+json.notice_id+"'>"+
					"<input type='text' id='ntit' class='form-control' name='title' value='"+
					decodeURIComponent(json.title.replace(/\+/g," "))+"'></h4></div><div id='notice"+json.notice_id+
					"' class='panel-collapse collapse in'>"+
					"<div class='panel-body'><textarea id='ncont' class='form-control' name='content'>"+
					decodeURIComponent(json.content.replace(/\+/g," ")) +"</textarea>"+
					"<br><span class='btnspan'><button type='submit' class='btn btn-defult'>수정</button>&nbsp;"+
					"<a href='adminNotice.do'><button class='btn'>취소</button></a></span></div></div></div></form>"

					$("#noupform").html(values);
  	  			},
  	  			error: function(request, status, errorData){
					alert("error code : " + request.status + "\n" 
						+ "message : " + request.responseText + "\n"
						+ "error : " + errorData );	
				}
  	  	});
  	}
  
  
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
  										"</a><span class='btnspan'><button class='btn mobt' onclick='noupbtn("+ json.snlist[i].notice_id + ")'>수정</button>&nbsp;"+
  										"<a href='adminNoticeDe.do?notice_id="+ json.snlist[i].notice_id + "'><button class='btn debt'>삭제</button></a>"+
  										"</span></h4></div><div id='notice"+
  										json.snlist[i].notice_id + "' class='panel-collapse collapse '><div class='panel-body'><span id='cdate'>" +
  										json.snlist[i].creation_date + "작성 </span> <br><hr>"+ 
  										decodeURIComponent(json.snlist[i].content.replace(/\+/g," ")) + "</div></div></div>";
  							}
  						}else{
  							value += "<div class='panel panel-default'><div class='panel-heading'><h4 class='panel-title'>조회된 결과가 없습니다.</h4></div></div>";
  						}
  						
  						$('#pagediv').empty();
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
 <body class="skin_main">
 <c:import url="adminMenu.jsp"/>
   <div id="lnb_area">
    <div class="lnb">
      <ul> 
         <li class="on">
            <a href="adminMain.do" style="color:black;">NOTICE <em style="color:black"></em></a>
         </li>
      </ul>
   </div>
</div>

<div id="notice">
  <h3>공지사항</h3>
	<hr class="hrst">
	<br>
	<button type="button" class="btn inbt" data-toggle="modal" data-target="#nomodal">공지사항 등록</button>
	<br><br>

<div class="searchdiv">
    <div class="input-group">
        <input type="search" class="form-control" name="query" id="query" placeholder="검색" autocomplete="off" aria-label="검색">
     </div>
</div>
<br><br>
<hr>
<br><br>
<div class="panel-group" id="accordion">
    <c:forEach items="${ anlist }" var="nrow" >
    <div class="panel panel-default" id="noupform">
      <div class="panel-heading">
        <h4 class="panel-title">
          <a data-toggle="collapse" data-parent="#accordion" href="#notice${ nrow.notice_id }">${ nrow.title }</a>
		  <span class="btnspan"><button class="btn mobt" onclick="noupbtn(${ nrow.notice_id})">수정</button>&nbsp;
		  <a href="adminNoticeDe.do?notice_id=${ nrow.notice_id }"><button class="btn debt">삭제</button></a></span>
        </h4>
      </div>
      <div id="notice${ nrow.notice_id }" class="panel-collapse collapse ">
        <div class="panel-body">
        	<span id="cdate"> ${ nrow.creation_date } 작성 </span> <br>
        	<hr>
        	${ nrow.content }
        </div>
      </div>
    </div>
    </c:forEach>
  </div> 
 
   <!-- 페이지 번호 처리 -->
	<div id="pagediv" style="text-align:center;">
	<c:forEach var="p" begin="${startPage }" end="${endPage }" step="1">
	<c:url var="page" value="adminNotice.do">
		<c:param name="currentPage" value="${p }" />
	</c:url>
	<ul class="pagination" style="display:inline-block;">
	<c:if test="${p ne currentPage }">
		<li><a href="${page }">${p }</a></li>
		<%-- <a href="${page }">	| ${p } |&nbsp; </a>  --%>
	</c:if>
	<c:if test="${p eq currentPage }">	
		<li class="active"><a href="${page }">${p }</a></li>
	<%-- <a href="${page }">	| <b>${p }</b> |&nbsp; </a> --%>
	</c:if>
	</ul>
	</c:forEach>
	</div> 


<!-- Modal -->
  <div class="modal fade" id="nomodal" role="dialog">
    <div class="modal-dialog modal-lg">
    
      <!-- Modal content-->
      <div class="modal-content">
         <div class="modal-header"> 
           <h4 class="modal-title">공지사항 등록</h4> 
           <button type="button" class="close" data-dismiss="modal">&times;</button> 
        </div>
        <div class="modal-body">
        <form name="noinform" action="adminNoticeIn.do" onsubmit="return check()" method="post">
			<div class="form-inline">
			<div class="form-group">
				<label for="ntitle"> 제목 : &nbsp;</label>
				<input type="text" class="form-control" id="ntitle" name="title" placeholder="제목 입력">
			</div>
			<br><br><br>
			<div class="form-group">
				<label for="nwriter">작성자 : &nbsp;</label>
				<input type="text" class="form-control" id="nwriter" name="writer" value="admin" readonly >
			</div>
			</div>
			<br>
			<div class="form-group">
				<label for="ncontent">내용 : </label>
				<textarea class="form-control" id="ncontent" placeholder="내용" name="content" cols="90" rows="10"></textarea>
				<br>
				<span class="btnspan">
				<button class="btn btn-defult" type="submit">등록</button>&nbsp;
				<button class="btn" data-dismiss="modal">취소</button></span>
				<br>
			</div>
		</form>
      </div>
    </div>
  </div>
</div>

<!-- Modal -->
  <div class="modal fade" id="nomodal2" role="dialog">
    <div class="modal-dialog modal-lg">
    
      <!-- Modal content-->
      <div class="modal-content">
         <div class="modal-header"> 
           <h4 class="modal-title">공지사항 수정</h4> 
           <button type="button" class="close" data-dismiss="modal">&times;</button> 
        </div>
        <div class="modal-body">
			<div class="form-inline">
			<div class="form-group">
				<label for="ntitle"> 제목 : &nbsp;</label>
				<input type="text" class="form-control" id="ntitlee" placeholder="제목 입력">
			</div>
			<br><br>
			<div class="form-group">
				<label for="nwriter">작성자 : &nbsp;</label>
				<input type="text" class="form-control" id="nwriterr" value="admin" readonly >
			</div>
			<div class="form-group">
				<label for="ndate">작성날짜 : &nbsp;</label>
				<input type="date" class="form-control" id="ndatee" readonly>
			</div>
			</div>
			<br>
			<div class="form-group">
				<label for="qcontent">내용 : </label>
				<textarea class="form-control" id="ncontentt" placeholder="문의내용" cols="90" rows="10"></textarea>
				<br>
				<span class="btnspan"><button class="btn btn-defult" data-dismiss="modal">수정</button>&nbsp;<button class="btn" data-dismiss="modal">취소</button></span>
				<br>
			</div>
			
      </div>
    </div>
  </div>
</div>

</div>

<c:import url="../footer.jsp"></c:import>
</body>
</html>