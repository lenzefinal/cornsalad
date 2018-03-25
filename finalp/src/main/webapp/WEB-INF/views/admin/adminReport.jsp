<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>   
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>금지어 / 신고</title>
  <link href="/finalp/resources/css/adminPage.css" rel="stylesheet">
  
  <style>
 div#report{
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
	#report button{
		font-size: 13px;
	}
	#report div.repotable{
		margin-top: 5%;
		text-align:center;
	}
	#report div.searchdiv{
		float:right;
		font-size:14pt;
	}
	#report #myModal.modal-body{
		height: auto;
	}
	#report ul.ull{
		height: 100px;
		overflow:auto;
	}
	#report div.mo{
		background-color: #D5D5D5;
	}
	#report input.fo{
		width: 210px;
		background-color: #A6A6A6;
	}
	#report button.bu{
		background-color:#5D5D5D;
		font-size:13px;
		color: white;
	}
	#report button.taboobt{
		font-size:14px;
		background-color:#F7D358;
	}
	
	#report div.modal-body{
		height: auto;
	}
	#report div.modal-body #rdate{
		font-size: 14px;
		width: 290px;
	}
	#report div.modal-body #rmember,#rmember2{
		font-size: 14px;
		width:690px;
		background-color:#DE4F4F;
		font-weight: bold;
	}
	#report div.modal-body #rwriter,#rwriter2{
		font-size: 14px;
		width:300px;
	}
	#report div.modal-body  #ratitle{
		font-size: 14px;
		width:680px;
	}
	#report div.modal-body  #rcategory{
		font-size: 14px;
		width:680px;
		display:inline-block;
	}
	#report div.modal-body textarea{
		font-size: 14px;
	}
	#report span.btnspan{
		float:right;
  	}
  	#report span.colorspan{
  		color:#F15F5F;
  		float:right;
  	}
  	#report div.modal-body table.atable{
  		margin-top:20px;
  		width: 750px;
  	}
  	#report select#caselect{
  		font-size:14px;
  		height:30px;
  	}
  </style>
  <script type="text/javascript" src="/finalp/resources/js/jquery-3.3.1.min.js"></script>
  <script type="text/javascript">
  	$(function(){
  		//금지어 리스트 MODAL
  		$('#taboobtn').on("click",function(){
  			$.ajax({
  	  			url:"adminTaboo.do",
  	  			type: "post",
  	  			dataType: "json",
  	  			success:function(data){
  	  				console.log(data);
  	  				var jsonStr = JSON.stringify(data);
					//변환된 문자열을 json 객체로 바꿈
					var json = JSON.parse(jsonStr);
					
					$("#tamodal").empty();
					var values = $("#tamodal").html();
					values +="<ul class='list-group ull'>";
					for(var i in json.tlist){
						values +=" <li class='list-group-item'> "+ 
						decodeURIComponent(json.tlist[i].content) +
						"</li>";
					}
					values+="</ul>";
					$("#tamodal").html(values);
  	  			},
  	  			error: function(request, status, errorData){
					alert("error code : " + request.status + "\n" 
						+ "message : " + request.responseText + "\n"
						+ "error : " + errorData );	
				}
  	  		});
  		});
  	});
  		
  		//상세보기 댓글 MODAL
  		function rebtn2(reportid){
  			/* var reportid=document.getElementById("reportid").value;*/
  			console.log(reportid); 
  			$.ajax({
  	  			url:"adminReportDetail.do" ,
  	  			data: { reportid : reportid },
  	  			type: "post",
  	  			dataType:"json",
  	  			success:function(data){
  	  				
  	  				var jsonStr = JSON.stringify(data);
  	  				var json = JSON.parse(jsonStr);
					
					$('#redemo').empty();
					
					var values = $('#redemo').html();
					values += "<div class='form-inline'> <div class='form-group'> <label for='member'>신고회원 : &nbsp;</label>"+
							"<input type='text' class='form-control' id='rmember' value='"+ decodeURIComponent(json.black_name.replace(/\+/g," ")) +"' readonly >&nbsp;" +
							"</div> <br><br><br> <div class='form-group'> <label for='writer'>신고 작성자 : &nbsp;</label>" +
							"<input type='text' class='form-control' id='rwriter' value='"+ decodeURIComponent(json.member_name.replace(/\+/g," ")) +
							"' readonly> </div> <div class='form-group'>"+
							"<label for='rdate'> 신고 날짜 : &nbsp;</label> <input type='date' class='form-control' id='rdate' readonly value='"+
							json.report_date+"'> </div> </div> <br> <div class='form-group'> <label for='content'>신고 사유  </label>"+
							" <textarea class='form-control' id='rcontent' cols='90' rows='10' readonly>"+ 
							decodeURIComponent(json.report_reason.replace(/\+/g," ")) + "</textarea> </div>"+
							" <div class='form-group'> <label for='category'>카테고리 : &nbsp;</label> <input type='text' class='form-control' id='rcategory' value=' "+
							decodeURIComponent(json.report_category_name.replace(/\+/g," ")) + "' > </div> <div class='form-group'> <label for='acontent'>신고 댓글  </label>"+
							"<span class='colorspan'>해당 댓글 신고 횟수 : "+ json.report_count +"</span> <textarea class='form-control' id='racontent' cols='60' rows='10' readonly>"+
							decodeURIComponent(json.reply_content.replace(/\+/g," ")) + "</textarea> <br>";
						
						if(json.project_reply_id == null ){
							values += "<span class='btnspan'> <a href='adminReplyDelete.do?reply_id="+json.board_reply_id+"&report_category_name="+
									decodeURIComponent(json.report_category_name.replace(/\+/g," "))+"'>"+
									"<button class='btn btn-danger'>해당 댓글 삭제</button></a>&nbsp;</span><br></div> ";
						}else{
							values += "<span class='btnspan'> <a href='adminReplyDelete.do?reply_id="+json.project_reply_id+"&report_category_name="+
									decodeURIComponent(json.report_category_name.replace(/\+/g," "))+"'>"+
									"<button class='btn btn-danger'>해당 댓글 삭제</button></a>&nbsp;</span><br></div> ";
						}
					
					$("#redemo").html(values);
  	  			},
  	  			error: function(request, status, errorData){
					alert("error code : " + request.status + "\n" 
						+ "message : " + request.responseText + "\n"
						+ "error : " + errorData );	
				}
  	  		});
  		}
  		
  		//상세보기 글 MODAL
  		function rebtn1(reportid){

  			console.log(reportid); 
  			$.ajax({
  	  			url:"adminReportDetail.do" ,
  	  			data: { reportid : reportid },
  	  			type: "post",
  	  			dataType:"json",
  	  			success:function(data){
  	  				
  	  				var jsonStr = JSON.stringify(data);
  	  				var json = JSON.parse(jsonStr);
					
					$('#bodemo').empty();
					$('#bodemo').html(
							"<div class='form-inline'> <div class='form-group'> <label for='member'>신고회원 : &nbsp;</label>"+
							"<input type='text' class='form-control' id='rmember' value='"+ decodeURIComponent(json.black_name.replace(/\+/g," ")) +"' readonly >&nbsp;" +
							"</div> <br><br><br> <div class='form-group'> <label for='writer'>신고 작성자 : &nbsp;</label>" +
							"<input type='text' class='form-control' id='rwriter' value='"+ decodeURIComponent(json.member_name.replace(/\+/g," ")) +"' readonly> </div> <div class='form-group'>"+
							"<label for='rdate'> 신고 날짜 : &nbsp;</label> <input type='date' class='form-control' id='rdate' readonly value='"+
							json.report_date+"'> </div> </div> <br> <div class='form-group'> <label for='content'>신고 사유  </label>"+
							" <textarea class='form-control' id='rcontent' cols='90' rows='10' readonly>"+ 
							decodeURIComponent(json.report_reason.replace(/\+/g," ")) + "</textarea> </div>"+
							" <div class='form-group'> <label for='atitle'>신고 당한 글 바로가기 "+
							"<span class='colorspan'>해당 글 신고 횟수 : "+ json.report_count +"</span><br><table class='table table-bordered atable'> <tr class='active'><th>카테고리</th><th>제목</th></tr>"+
							"<tr><td>"+decodeURIComponent(json.report_category_name.replace(/\+/g," "))+"</td><td><a href='#'>"+ decodeURIComponent(json.report_project_name.replace(/\+/g," ")) +
							"</a></td></tr> </table> <br><span class='btnspan'>"+
							"<a href=''>"+
							"<button class='btn' data-dismiss='modal'>닫기</button></a>&nbsp;</span> <br> </div> ");
					
  	  			},
  	  			error: function(request, status, errorData){
					alert("error code : " + request.status + "\n" 
						+ "message : " + request.responseText + "\n"
						+ "error : " + errorData );	
				}
  	  		});
  		}
  		
  	//카테고리별 검색 ajax
  	function caselChange(){
  			var cate = document.getElementById("caselect");
  			var report_category_name = cate.options[cate.selectedIndex].value;
  			console.log("option : "+report_category_name);
  			$.ajax({
  				url: "searchReport.do",
  				data:{
  					report_category_name :  report_category_name
  				},
  				type: "post",
  				dataType: "json",
  				success: function(data){
					var jsonStr = JSON.stringify(data);
 					
 					var json = JSON.parse(jsonStr);
 					
 					$('#rtable').empty();
 					
 					var value = "<table class='table table-bordered table-hover' id='rtable'><thead><tr class='active'>"+
 							"<th>카테고리</th><th>신고 작성 회원</th><th>신고 당한 회원</th><th>신고 날짜</th><th>신고 횟수</th><th>상세보기</th></tr></thead>";
 							
 					if(json.srlist.length > 0 ){
 						for(var i in json.srlist){
							value +="<tr><td>"+decodeURIComponent(json.srlist[i].report_category_name.replace(/\+/g," "))+"</td><td>"
								+decodeURIComponent(json.srlist[i].member_name)+
								"</td><td>"+decodeURIComponent(json.srlist[i].black_name)+"</td><td>"+
								json.srlist[i].report_date+"</td><td>"+json.srlist[i].report_count+"</td>";

								if( json.srlist[i].project_id != null){
									value+="<td><button class='btn btn-primary' data-toggle='modal'  data-target='#redetail1' onclick='rebtn1("+
											json.srlist[i].report_id + ")'>상세보기</button></td></tr>";
								}else if(json.srlist[i].project_reply_id != 0){
									value+="<td><button class='btn btn-primary' data-toggle='modal'  data-target='#redetail2' onclick='rebtn2("+
											json.srlist[i].report_id + ")'>상세보기</button></td></tr>";
								}else if(json.srlist[i].board_id != 0){
									value+="<td><button class='btn btn-primary' data-toggle='modal'  data-target='#redetail1' onclick='rebtn1("+
											json.srlist[i].report_id + ")'>상세보기</button></td></tr>";
								}else if(json.srlist[i].board_reply_id != 0){
									value+="<td><button class='btn btn-primary' data-toggle='modal'  data-target='#redetail2' onclick='rebtn2("+
											json.srlist[i].report_id + ")'>상세보기</button></td></tr>";
								}
								
							}
					}else{
						value += "<tr><td colspan='6'>조회된 신고글 내역이 없습니다.</td></tr>"
					}
 					
 					$('#rtable').html(value);
  					
  				},
  				error: function(request, status, errorData){
					alert("error code : " + request.status + "\n" 
						+ "message : " + request.responseText + "\n"
						+ "error : " + errorData );	
				}
  			});
  			
  		};

  </script>
 </head>
  <body class="skin_main">
 <c:import url="adminMenu.jsp"/>
   <div id="lnb_area">
    <div class="lnb">
      <ul> 
         <li class="on">
            <a href="adminMain.do" style="color:black;">REPORT <em style="color:black"></em></a>
         </li>
      </ul>
   </div>
</div>

<div id="report">
 <h3>금지어 / 신고 </h3>
 <hr class="hrst">
 <br>
 <button type="button" class="btn taboobt" id="taboobtn" data-toggle="modal" data-target="#taboomodal">금지어</button>
 <br>
<div class="searchdiv">
    <div class="input-group">
      <select class="form-control" name="caselect" id="caselect" onchange="caselChange()">
		<option value="all">전체</option>
		<option value="프로젝트 신고">프로젝트</option>
		<option value="프로젝트 댓글 신고">프로젝트 댓글</option>
		<option value="게시글 신고">게시글</option>
		<option value="게시글 댓글 신고">게시글 댓글</option>
	  </select>
    </div>
</div>
<br>
   <div class="repotable">
  <table class="table table-bordered table-hover" id="rtable" >
    <thead>
      <tr class="active">
        <th>카테고리</th>
		<th>신고 작성 회원</th>
		<th>신고 당한 회원</th>
		<th>신고날짜</th>
		<th>신고 횟수</th>
		<th>상세보기</th>
      </tr>
    </thead>
    <tbody>
    <c:choose>
    	<c:when test="${ fn:length(rlist) > 0}">
    		<c:forEach items="${ rlist }" var="rrow">
      			<tr>
        			<td>${ rrow.report_category_name }</td>
					<td>${ rrow.member_name }</td>
					<td>${ rrow.black_name }</td>
					<td>${ rrow.report_date }</td>
					<td>${ rrow.report_count }</td>
					<td>
					<c:choose>
						<c:when test="${ rrow.report_category_name eq '프로젝트 신고' }">
					 		<button class="btn btn-primary" data-toggle="modal"  data-target="#redetail1" onclick="rebtn1(${ rrow.report_id })">상세보기</button>
      					</c:when>
      					<c:when test="${ rrow.report_category_name eq '게시글 신고' }">
					 		<button class="btn btn-primary" data-toggle="modal" data-target="#redetail1" onclick="rebtn1(${ rrow.report_id })">상세보기</button>
      					</c:when>
      					<c:when test="${ rrow.report_category_name eq '프로젝트 댓글 신고' }">
      				 		<button class="btn btn-primary" data-toggle="modal" data-target="#redetail2" onclick="rebtn2(${ rrow.report_id })">상세보기</button>
      					</c:when>
      					<c:when test="${ rrow.report_category_name eq '게시글 댓글 신고' }">
      				 		<button class="btn btn-primary" data-toggle="modal" data-target="#redetail2" onclick="rebtn2(${ rrow.report_id })">상세보기</button>
      					</c:when>
      				</c:choose>
      				</td>
      			</tr>
     	 	</c:forEach>
      	</c:when>
      </c:choose>
    </tbody>
  </table>
  </div>

 <!-- Modal -->
  <div class="modal fade" id="taboomodal" role="dialog">
    <div class="modal-dialog modal-sm">
    
      <!-- Modal content-->
      <div class="modal-content mo">
         <div class="modal-header"> 
           <h5 class="modal-title">금지어</h5> 
           <button type="button" class="close" data-dismiss="modal">&times;</button> 
        </div>
        <div class="modal-body">
        <form action="adminTabooIn.do" method="post">
			<div class="form-inline">
			<div class="form-group">
				<input type="text" class="form-control fo" name="content" id="tabooin" >&nbsp;&nbsp;
			</div>
				<button type="submit" class="btn bu">추가</button>
			</div>
			</form>
			<br>
			<div id="tamodal">
				<!-- 금지어리스트ajax -->
			</div>
			</div>
      </div>
    </div>
  </div>
  
  <!-- 댓글 신고 Modal -->
  <div class="modal fade" id="redetail2" role="dialog">
    <div class="modal-dialog modal-lg">
    
      <!-- Modal content-->
      <div class="modal-content">
         <div class="modal-header"> 
         <h4 class="modal-title">신고 상세보기</h4> 
           <button type="button" class="close" data-dismiss="modal">&times;</button> 
        </div>
        <div class="modal-body" id="redemo">
			<div class="form-inline">
			<div class="form-group">
				<label for="member">신고회원 : &nbsp;</label>
				<input type="text" class="form-control" id="rmember" value="id" readonly >&nbsp;
			</div>
			<br><br><br>
			<div class="form-group">
				<label for="writer">신고 작성자 : &nbsp;</label>
				<input type="text" class="form-control" id="rwriter" value="id" readonly>
			</div>
			
			<div class="form-group">
				<label for="date"> 신고 날짜 : &nbsp;</label>
				<input type="date" class="form-control" id="rdate">
			</div>
			</div>
			<br>
			<div class="form-group">
				<label for="content">신고 사유  </label>
				<textarea class="form-control" id="rcontent" placeholder="신고사유" cols="90" rows="10"></textarea>
			</div>
			<div class="form-group">
				<label for="category">카테고리 : &nbsp;</label>
				<input type="text" class="form-control" id="rcategory" value="카테고리" readonly >
			</div>
			<div class="form-group">
				<label for="acontent">신고 댓글  </label> <span class="colorspan">해당 댓글 신고 횟수 :  </span>
				<textarea class="form-control" id="racontent" placeholder="신고댓글내용" cols="60" rows="10">아이고</textarea>
				<br>
				<span class="btnspan"><button class="btn btn-danger" data-dismiss="modal">해당 댓글 삭제</button>&nbsp;</span>
				<br>
			</div>
			</div>
      </div>
    </div>
  </div>
  
  <!-- 글 신고 Modal -->
  <div class="modal fade" id="redetail1" role="dialog">
    <div class="modal-dialog modal-lg">
    
      <!-- Modal content-->
      <div class="modal-content">
         <div class="modal-header"> 
         <h4 class="modal-title">신고 상세보기</h4> 
           <button type="button" class="close" data-dismiss="modal">&times;</button> 
        </div>
        <div class="modal-body" id="bodemo">
			<div class="form-inline">
			<div class="form-group">
				<label for="member">신고회원 : &nbsp;</label>
				<input type="text" class="form-control" id="rmember2" value="id" readonly >&nbsp;
			</div>
			<br><br><br>
			<div class="form-group">
				<label for="writer">신고 작성자 : &nbsp;</label>
				<input type="text" class="form-control" id="rwriter2" value="id" readonly>
			</div>
			<div class="form-group">
				<label for="date"> 신고 날짜 : &nbsp;</label>
				<input type="date" class="form-control" id="rdate">
			</div>
			</div>
			<br>
			<div class="form-group">
				<label for="content">신고 사유  </label>
				<textarea class="form-control" id="rcontent2" placeholder="신고사유" cols="90" rows="10"></textarea>
			</div>
			
			<div class="form-group">
				<label for="atitle">신고 당한 글 바로가기  </label><span class="colorspan">해당 글 신고 횟수 :  </span>

				<table class="table table-bordered">
					<tr class="active"><th>카테고리</th><th>제목</th></tr>
					<tr><td>프로젝트</td><td><a href="#">어쩌구저쩌구프로젝트입니당</a></td></tr>
				</table>
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