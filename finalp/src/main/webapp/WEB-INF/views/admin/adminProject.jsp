<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>프로젝트</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <link href="/finalp/resources/css/adminPage.css" rel="stylesheet">
  <style>
	div#projec{
		font-family:"맑은 고딕";
		margin-top:2%;
		margin-left:25%;
		margin-right:10%;
		margin-bottom: 20%;
		display:inline-block;
		width: 60%;
		float:center;
		font-size: 14px;
	}
	div#projec table{
		font-size: 15px;
		font-family:"맑은 고딕";
	}
	hr.hrst{
		background-color:#F7D358;
		border:1.5px solid #F7D358; 
	}
	#projec div.okptable{
		background-color:#FAF4C0;
		text-align:center;
	}
	#projec button.btn{
		font-size:10pt;
	}
	#projec img.iconi{
		width:18px;
	}
	#projec button#bid{
		border:1px solid #ced4da;
	}
	#projec div.pagediv{
		margin-left: 40%;
	}
	#projec ul.pagination > li > a{
		color:black;
	}
	#projec ul.pagination > li > a:hover{
		color:gray;
	}
	#projec div.allptable{
		text-align:center;
	}
	#projec div.searchdiv{
		float: right;
		text-align: right;
		width: 100%;
		margin-bottom:20px;
	}
	#projec select.searchse{
		margin-top:5px;
		font-size:14px;
		width: 200px;
		height: 30px;
		float: right;
	}
	#projec input.searchinput{
		width: 200px;
		font-size:14px;
		float: right;
		margin-top:5px;
	}
	#projec button.btn-primary{
		width: 200px;
		font-size:14px;
		margin-top:5px;
	}
	#projec a#sta{
		text-decoration: none;
		color: #353535;
	}
	#projec a#sta:hover{
		background-color:#F6FFCC;
	}
	#projec ul.stli{
		background-color:#F6FFCC;
	}
	#projec ul.tab {
		float:center;
	}
	#projec .tab{
		list-style: none;
		margin: 0;
		padding: 0;
		overflow: hidden;
		border-top:2px solid #FAF4C0;
		border-bottom:2px solid #FAF4C0;
	}
	#projec .tab li{
		float: right;
	}
	#projec .tab li a {
		display: inline-block;
		color: #000;
		text-align: center;
		text-decoration: none;
		padding: 8px 8px;
		font-size: 14px;
		transition:0.3s;
	}
	#projec .tabcontent {
		display: none;
		padding: 6px 12px;
		height:60px;
		color:black;
	}
	#projec ul.tab li.current{
		background-color:#FAF4C0;
		float: center;
		color: black;
	}
	#projec .tabcontent.current {
		display: block;
		background-color: #FAF4C0;
	}
	#projec span.fontspan{
		color: #355400;
		font-size: 15px;
		font-weight: bold;
	}
	#projec p#pfont{
		margin-top: 6px;
		font-size: 15px;
		font-family : '맑은 고딕';
		font-weight: bold;
	}
	#projec td.fonttd{
		font-size: 15px;
		font-weight: bold;
		background-color: #FAF4C0;
		color: #002266;
	}
  </style>
  <script type="text/javascript" src="/finalp/resources/js/jquery-3.3.1.min.js"></script>
  <script type="text/javascript">
  $(function() {
		$('ul.tab li').click(function() {
			var activeTab = $(this).attr('data-tab');
			$('ul.tab li').removeClass('current');
			$('.tabcontent').removeClass('current');
			$(this).addClass('current');
			$('#' + activeTab).addClass('current');
		})
	});
  
  //카테고리별 검색
  	function pcateChange(){
  		var pcate = document.getElementById("pcate");
		var cname = pcate.options[pcate.selectedIndex].value;
			console.log("cname : "+ cname)
			if(cname == 'all'){
				location.reload();
				return false;
			}
			$.ajax({
				url: "searchCProject.do",
				data:{
					cname :  cname
				},
				type: "post",
				dataType: "json",
				success: function(data){
				var jsonStr = JSON.stringify(data);
					
					var json = JSON.parse(jsonStr);
					
					$('#aptable').empty();
					
					var value = "<table class='table table-bordered table-condensed' id='aptable' ><thead>"+
						"<tr class='active'><th>카테고리</th><th>소카테고리</th><th>제목</th><th>작성자</th>"+
						"<th>후원현황</th><th>종료일</th><th>목표 달성</th><th>활성화 / 비활성화</th></tr></thead>";
					
					if(json.cplist.length > 0){
						for(var i in json.cplist){
							value += "<tr><td>"+ decodeURIComponent(json.cplist[i].project_category_name.replace(/\+/g," ")) + "</td><td>" + 
									decodeURIComponent(json.cplist[i].category_sub_name.replace(/\+/g," ")) +"</td>";
									
								if(cname == '펀딩'){
									value += "<td><a href='projectDetailView.do?member_id=${ loginUser.member_id }&project_id=" + json.cplist[i].project_id +
											"'>" + decodeURIComponent(json.cplist[i].project_name.replace(/\+/g," ")) + "</a></td>";
								}else if(cname == '공동구매'){
									value += "<td><a href='projectDetailGPView.do?member_id=${ loginUser.member_id }&project_id=" + json.cplist[i].project_id +
											"'>" + decodeURIComponent(json.cplist[i].project_name.replace(/\+/g," ")) + "</a></td>";
								}
									
									
								value += "<td>" + decodeURIComponent(json.cplist[i].member_name.replace(/\+/g," ")) + 
										"</td><td>" + json.cplist[i].spon + "% </td><td>" + json.cplist[i].end_date +"</td>";
										
							if(json.cplist[i].ing_flag == 'Y'){
								value += "<td class='fonttd'>진행중</td>";
							}else if( (json.cplist[i].ing_flag == 'N') && ( json.cplist[i].spon < 100 ) ){
								if( json.cplist[i].refund_flag == 'Y' ){
									value += "<td class='fonttd'>실패 / 환불완료 </td>";
								}else{
									value += "<td class='fonttd'>실패 <button class='btn btn-danger'>환불</button></td>";
								}
								
							}else if( (json.cplist[i].ing_flag == 'N') && ( json.cplist[i].spon >= 100 ) ){
								value += "<td class='fonttd'>성공</td>";
							}else if( (json.cplist[i].project_request_flag == 'Y') ){
								value += "<td class='fonttd' colspan='2'>승인 요청중</td>";
							}else if( (json.cplist[i].project_request_flag == 'W') || ((json.cplist[i].project_request_flag == 'N') && 
									(json.cplist[i].start_date == null )) ){
								value += "<td class='fonttd' colspan='2'>창작자 수정중</td>";
							}
							
							if(json.cplist[i].project_request_flag == 'N'){
								if( json.cplist[i].project_onoff_flag == 'Y' ){
									value += "<td><a href='adminProjectOff.do?project_id="+ json.cplist[i].project_id +"'>"+
										"<button class='btn btn-danger'>비활성화</button></a></td></tr>";
								}else if(json.cplist[i].project_onoff_flag == 'N'){
									value += "<td><a href='adminProjectOn.do?project_id="+ json.cplist[i].project_id +"'>"+
										"<button class='btn btn-success'>활성화</button></a></td></tr>";
								}
							}
						}
					}else {
						value += "<tr><td colspan='8'>조회된 프로젝트가 없습니다.</td></tr>"
					}
					$('#pagediv').empty();
					$('#aptable').html(value);
					
				},
				error: function(request, status, errorData){
				alert("error code : " + request.status + "\n" 
					+ "message : " + request.responseText + "\n"
					+ "error : " + errorData );	
			}
			});
  	};
  	
  //환불 프로젝트만 
  	function refundsbtn(){
  		$.ajax({
			url: "searchRProject.do",
			type: "post",
			dataType: "json",
			success: function(data){
			var jsonStr = JSON.stringify(data);
				
				var json = JSON.parse(jsonStr);
				
				$('#aptable').empty();
				
				var value = "<table class='table table-bordered table-condensed' id='aptable' ><thead>"+
					"<tr class='active'><th>카테고리</th><th>소카테고리</th><th>제목</th><th>작성자</th>"+
					"<th>후원현황</th><th>종료일</th><th>목표 달성</th><th>활성화 / 비활성화</th></tr></thead>";
				
				if(json.rplist.length > 0){
					for(var i in json.rplist){
						value += "<tr><td>"+ decodeURIComponent(json.rplist[i].project_category_name.replace(/\+/g," ")) + "</td><td>" + 
								decodeURIComponent(json.rplist[i].category_sub_name.replace(/\+/g," ")) +"</td>"; 
								
						if( decodeURIComponent(json.rplist[i].project_category_name.replace(/\+/g," ")) == '펀딩'){
							value += "<td><a href='projectDetailView.do?member_id=${ loginUser.member_id }&project_id=" + json.rplist[i].project_id +
									"'>" + decodeURIComponent(json.rplist[i].project_name.replace(/\+/g," ")) + "</a></td>";
						}else if(decodeURIComponent(json.rplist[i].project_category_name.replace(/\+/g," ")) == '공동구매'){
							value += "<td><a href='projectDetailGPView.do?member_id=${ loginUser.member_id }&project_id=" + json.rplist[i].project_id +
									"'>" + decodeURIComponent(json.rplist[i].project_name.replace(/\+/g," ")) + "</a></td>";
						}	
							
						value += "<td>" + decodeURIComponent(json.rplist[i].member_name.replace(/\+/g," ")) + 
								"</td><td>" + json.rplist[i].spon + "% </td><td>"+ json.rplist[i].end_date +"</td>";

						if(json.rplist[i].ing_flag == 'Y'){
							value += "<td class='fonttd'>진행중</td>";
						}else if( (json.rplist[i].ing_flag == 'N') && ( json.rplist[i].spon < 100 ) ){
							if( json.rplist[i].refund_flag == 'Y' ){
								value += "<td class='fonttd'>실패 / 환불완료 </td>";
							}else{
								value += "<td class='fonttd'>실패 <button class='btn btn-danger'>환불</button></td>";
							}
							
						}else if( (json.rplist[i].ing_flag == 'N') && ( json.rplist[i].spon >= 100 ) ){
							value += "<td class='fonttd'>성공</td>";
						}else if( (json.rplist[i].project_request_flag == 'Y') ){
							value += "<td class='fonttd' colspan='2'>승인 요청중</td>";
						}else if( (json.rplist[i].project_request_flag == 'W') || ((json.rplist[i].project_request_flag == 'N') && 
								(json.rplist[i].start_date == null )) ){
							value += "<td class='fonttd' colspan='2'>창작자 수정중</td>";
						}
						
						if(json.rplist[i].project_request_flag == 'N'){
							if( json.rplist[i].project_onoff_flag == 'Y' ){
								value += "<td><a href='adminProjectOff.do?project_id="+ json.rplist[i].project_id +"'>"+
									"<button class='btn btn-danger'>비활성화</button></a></td></tr>";
							}else if(json.rplist[i].project_onoff_flag == 'N'){
								value += "<td><a href='adminProjectOn.do?project_id="+ json.rplist[i].project_id +"'>"+
									"<button class='btn btn-success'>활성화</button></a></td></tr>";
							}
						}
					}
				}else {
					value += "<tr><td colspan='8'>조회된 프로젝트가 없습니다.</td></tr>"
				}
				$('#pagediv').empty();
				$('#aptable').html(value);
				
			},
			error: function(request, status, errorData){
			alert("error code : " + request.status + "\n" 
				+ "message : " + request.responseText + "\n"
				+ "error : " + errorData );	
		}
		});
  		
  	}
  
  //제목으로 검색
  $(function(){
	 $('#title').keypress(function(e){
	  if ((e.which && e.which == 13) || (e.keyCode && e.keyCode == 13)){
	     var title=document.getElementById("title").value;
	     console.log(title);
	     $.ajax({
				url: "searchTProject.do",
				data:{
					title :  title
				},
				type: "post",
				dataType: "json",
				success: function(data){
				var jsonStr = JSON.stringify(data);
					
					var json = JSON.parse(jsonStr);
					
					$('#aptable').empty();
					
					var value = "<table class='table table-bordered table-condensed' id='aptable' ><thead>"+
						"<tr class='active'><th>카테고리</th><th>소카테고리</th><th>제목</th><th>작성자</th>"+
						"<th>후원현황</th><th>종료일</th><th>목표 달성</th><th>활성화 / 비활성화</th></tr></thead>";
					
					if(json.tplist.length > 0){
						for(var i in json.tplist){
							value += "<tr><td>"+ decodeURIComponent(json.tplist[i].project_category_name.replace(/\+/g," ")) + "</td><td>" + 
									decodeURIComponent(json.tplist[i].category_sub_name.replace(/\+/g," ")) + "</td>";
									
							if( decodeURIComponent(json.tplist[i].project_category_name.replace(/\+/g," ")) == '펀딩'){
								value += "<td><a href='projectDetailView.do?member_id=${ loginUser.member_id }&project_id=" + json.tplist[i].project_id +
										"'>" + decodeURIComponent(json.tplist[i].project_name.replace(/\+/g," ")) + "</a></td>";
							}else if(decodeURIComponent(json.tplist[i].project_category_name.replace(/\+/g," ")) == '공동구매'){
								value += "<td><a href='projectDetailGPView.do?member_id=${ loginUser.member_id }&project_id=" + json.tplist[i].project_id +
										"'>" + decodeURIComponent(json.tplist[i].project_name.replace(/\+/g," ")) + "</a></td>";
							}	
								
							value += "<td>" + decodeURIComponent(json.tplist[i].member_name.replace(/\+/g," ")) + 
									"</td><td>" + json.tplist[i].spon + "% </td><td>" + json.tplist[i].end_date +"</td>";

							if(json.tplist[i].ing_flag == 'Y'){
								value += "<td class='fonttd'>진행중</td>";
							}else if( (json.tplist[i].ing_flag == 'N') && ( json.tplist[i].spon < 100 ) ){
								if( json.tplist[i].refund_flag == 'Y' ){
									value += "<td class='fonttd'>실패 / 환불완료 </td>";
								}else{
									value += "<td class='fonttd'>실패 <button class='btn btn-danger'>환불</button></td>";
								}
								
							}else if( (json.tplist[i].ing_flag == 'N') && ( json.tplist[i].spon >= 100 ) ){
								value += "<td class='fonttd'>성공</td>";
							}else if( (json.tplist[i].project_request_flag == 'Y') ){
								value += "<td class='fonttd' colspan='2'>승인 요청중</td>";
							}else if( (json.tplist[i].project_request_flag == 'W') || ((json.tplist[i].project_request_flag == 'N') && 
									(json.tplist[i].start_date == null )) ){
								value += "<td class='fonttd' colspan='2'>창작자 수정중</td>";
							}
							
							if(json.tplist[i].project_request_flag == 'N'){
								if( json.tplist[i].project_onoff_flag == 'Y' ){
									value += "<td><a href='adminProjectOff.do?project_id="+ json.tplist[i].project_id +"'>"+
										"<button class='btn btn-danger'>비활성화</button></a></td></tr>";
								}else if(json.tplist[i].project_onoff_flag == 'N'){
									value += "<td><a href='adminProjectOn.do?project_id="+ json.tplist[i].project_id +"'>"+
										"<button class='btn btn-success'>활성화</button></a></td></tr>";
								}
							}
						}
					}else {
						value += "<tr><td colspan='8'>조회된 프로젝트가 없습니다.</td></tr>"
					}
					$('#pagediv').empty();
					$('#aptable').html(value);
					
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
            <a href="adminMain.do" style="color:black;">PROJECT <em style="color:black"></em></a>
         </li>
      </ul>
   </div>
</div>

<div id="projec">
  <h3>승인 요청 PROJECT</h3>
  <hr class="hrst">
	  <div class="okptable">
  <table class="table table-bordered table-condensed" >
    <thead>
      <tr class="active">
        <th>카테고리</th>
        <th>소카테고리</th>
        <th>제목</th>
        <th>종료일</th>
		<th>작성자</th>
		<th>검토하기</th>
		<th>승인</th>
      </tr>
    </thead>
    <tbody>
    	<c:choose>
    		<c:when test="${ fn:length(oplist) > 0 }">
    			<c:forEach items="${ oplist }" var="oprow">
    				<tr>
       					<td>${ oprow.project_category_name }</td>
       					<td>${ oprow.category_sub_name }</td>
        				<td>${ oprow.project_name }</td>
        				<td>${ oprow.end_date }</td>
						<td>${ oprow.member_name }</td>
						<td>
						<c:choose>
							<c:when test="${ oprow.project_category_name eq '펀딩' }">
								<a href="projectDetailView.do?member_id=${ loginUser.member_id }&project_id=${ oprow.project_id }">
								<button class="btn btn-default">검토하기</button></a>
							</c:when>
							<c:when test="${ oprow.project_category_name eq '공동구매' }">
								<a href="projectDetailGPView.do?member_id=${ loginUser.member_id }&project_id=${ oprow.project_id }">
								<button class="btn btn-default">검토하기</button></a>
							</c:when>
						</c:choose>
						</td>
						<td>
						<c:choose>
							<c:when test="${ oprow.project_request_flag eq 'Y' }">
								<a href="adminProjectOn.do?project_id=${ oprow.project_id }">
								<button class="btn btn-success">승인</button></a>	&nbsp;
								<a href="adminProjectWait.do?project_id=${ oprow.project_id }">
								<button class="btn btn-danger">거부</button></a>
							</c:when>
							<c:when test="${ oprow.project_request_flag eq 'W' }">
								<p id="pfont">대기중</p>
							</c:when>
						</c:choose>
						</td>
      				</tr>
      			</c:forEach>
      		</c:when>
      		<c:when test = "${ fn:length(oplist) <= 0 }">
      			<tr><td colspan = "6">승인요청된 프로젝트가 없습니다.</td></tr>
      		</c:when>
      	</c:choose>
    </tbody>
  </table>
  </div>
 
 
 <br>
  <h3>모든 PROJECT</h3>
  <hr class="hrst">
  
  <ul class="tab">
    <li data-tab="tab1"><a href="#" id="sta"><span class="fontspan">카테고리별</span> 검색</a></li>
    <li data-tab="tab2"><a href="#" id="sta"><span class="fontspan">제목</span> 검색</a></li>
    <li data-tab="tab3"><a href="#" id="sta"><span class="fontspan">환불</span> PROJECT</a></li>
  </ul>  
  
<div class="searchdiv">
    <div id="tab1" class="tabcontent">
      <select class="form-control searchse" name="pcate" id="pcate" onchange="pcateChange()">
		<option value="all">전체</option>
		<option value="펀딩">프로젝트</option>
		<option value="공동구매">공동구매</option>
	  </select>&nbsp;
	</div> 
	
	<div id="tab2" class="tabcontent">
      <input type="text" class="form-control searchinput" id="title" placeholder="제목검색" />
    </div>
    
    <div id="tab3" class="tabcontent">
    	<button class="btn btn-primary" onclick="refundsbtn()">환불 프로젝트만 조회</button>
    </div>
    
</div>

<br><br><br>

<div class="allptable">
  <table class="table table-bordered table-condensed" id="aptable" >
    <thead>
      <tr class="active">
        <th>카테고리</th>
        <th>소카테고리</th>
        <th>제목</th>
		<th>작성자</th>
		<th>후원현황</th>
		<th>종료일</th>
		<th>목표 달성</th>
		<th>활성화 / 비활성화</th>
      </tr>
    </thead>
    <tbody>
      <c:choose>
    		<c:when test="${ fn:length(aplist) > 0 }">
    			<c:forEach items="${ aplist }" var="aprow">
    				<tr>
       					<td>${ aprow.project_category_name }</td>
       					<td>${ aprow.category_sub_name }</td>
        				<td>
        				<c:choose>
							<c:when test="${ aprow.project_category_name eq '펀딩' }">
								<a href="projectDetailView.do?member_id=${ loginUser.member_id }&project_id=${ aprow.project_id }">
								${ aprow.project_name }</a>
							</c:when>
							<c:when test="${ aprow.project_category_name eq '공동구매' }">
								<a href="projectDetailGPView.do?member_id=${ loginUser.member_id }&project_id=${ aprow.project_id }">
								${ aprow.project_name }</a>
							</c:when>
						</c:choose>
        				</td>
						<td>${ aprow.member_name }</td>
						<td>${ aprow.spon } % </td>
						<td>${ aprow.end_date }</td>
						
						<c:choose>
							<c:when test="${ aprow.ing_flag eq 'Y' }">
								<td class='fonttd'>진행중</td>
							</c:when>
							<c:when test="${ (aprow.ing_flag eq 'N') and ( aprow.spon < 100 ) }">
								<c:if test="${ aprow.refund_flag eq 'Y' }">
									<td class='fonttd'>실패 / 환불완료</td>
								</c:if>
								<c:if test="${ aprow.refund_flag eq 'N' }">
									<td class='fonttd'>실패 
									<a href="refundAll.do?project_id=${ aprow.project_id }">
									<button class="btn btn-danger">전체 환불</button></a></td>
								</c:if>
							</c:when>
							<c:when test="${ (aprow.ing_flag eq 'N') and (aprow.spon >= 100) }">
								<td class='fonttd'>성공</td>
							</c:when>
							<c:when test="${ aprow.project_request_flag eq 'Y' }">
								<td class='fonttd' colspan="2">승인 요청중</td>
							</c:when>
							<c:when test="${ (aprow.project_request_flag eq 'W') or ((aprow.project_request_flag eq 'N') and (aprow.start_date eq '')) }">
								<td class='fonttd' colspan="2">창작자 수정중</td>
							</c:when>
						</c:choose>
						
						
						<c:choose>
						<c:when test="${ aprow.project_request_flag eq 'N' }">
							
							<c:if test="${ aprow.project_onoff_flag eq 'Y' }">
								<td><a href="adminProjectOff.do?project_id=${ aprow.project_id }"><button class="btn btn-danger">비활성화</button></a></td>
							</c:if>
							<c:if test="${ aprow.project_onoff_flag eq 'N' }">
								<td><a href="adminProjectOn.do?project_id=${ aprow.project_id }"><button class="btn btn-success">활성화</button></a></td>
							</c:if>
						</c:when>
						</c:choose>
						
      				</tr>
      			</c:forEach>
      		</c:when>
      	</c:choose>
    </tbody>
  </table>
  
  </div>
  
   <!-- 페이지 번호 처리 -->
	<div id="pagediv" style="text-align:center;">
	<c:forEach var="p" begin="${startPage }" end="${endPage }" step="1">
	<c:url var="page" value="adminProject.do">
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

</div>

<c:import url="../footer.jsp"></c:import>
</body>
</html>