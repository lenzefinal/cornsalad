<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>문의글</title>

 <c:import url="myQuestionHeader.jsp"/>
  <style>
  	
  	 div#question{
		font-family:"맑은 고딕";
		margin-top:2%;
		margin-right:10%;
		margin-bottom: 20%;
		display:inline-block;
		width: 100%;
		float:center;
		font-size: 13px;
  }
  #question div.qutable{
		margin-top: 5%;
		text-align: center;
	}
	td{
		font-size:13px;
	}
	td img{
		width:200px;
		height:200px;
	}
	th,td{
  		text-align:center;
  		border-right:0.5px solid silver;
  	}
	.limg{
		width:230px;
	}
	td:nth-child(3){
		width:180px;
		text-align:center;
	}
	
	div#container{
		height:900px;
	}
	.btn_more {
	    font-weight: 600;
	    line-height: 14px;
	    display: block;
	    overflow: hidden;
	    width: 45px;
	    height: 15px;
	    margin: 0 auto;
	    vertical-align: top;
	    text-decoration: underline;
	    letter-spacing: -1px;
	    color: #666;
	   	font-size:14px;
	   	cursor:pointer;
	}
	div.display-none{
		display:none;
	}
</style>
 </head>
 <body class="skin_main">
<div id="container" style="height:724px;">
		<div id="content" class="section_home" >
			
			<input type="hidden" id="memberId" value="${loginUser.member_id }"/>
			<div class="c_header">
				<h2>나의 문의</h2>
				<p class="contxt">내가 보낸 문의를 확인할 수 있어요.</p>
			</div>
		</div>
		
		<h5 style="font-weight:bold; font-family:맑은고딕">문의함</h5>
		<hr style="background-color:#F7D358; border:1.5px solid #F7D358">
			<div id="question">
			<table class="table table-bordered table-hover" cellspacing="0" border="1">
				<thead>
					<tr  class="active">
						<th style="border-right:0.5px solid silver;">제목</th>
						<th style="border-right:0.5px solid silver; width:24%;">수신자</th>
						<th style="border-right:0.5px solid silver; width:16%">문의 날짜</th>
						<th style="width:16%">답변</th>
					</tr>
				</thead>
				<tbody id="qlist">
					
				</tbody>
			</table>
		</div>
		<div id="result" style="text-align:center;"></div>
		
<!-- 스크 -->
 <script type="text/javascript">
  	$(window).ready(function(){
  		var send_member_id=$('#memberId').val();
  		$.ajax({
  			url:"myQuestionlist.do",
  			data:{"send_member_id":send_member_id},
  			dataType:"json",
  			type:"post",
  			success:function(e){
  				var jsonStr=JSON.stringify(e);
  				var json=JSON.parse(jsonStr); 
  				var tr="";
  				for(var i in json.qlist){
  					if(json.qlist[i].re_content!=null){
  						if(json.qlist[i].receive_member_id=="admin"){
	  						tr+='<tr><td style="border-right:0.5px solid silver;">'
		  						+'<a href="#" data-toggle="modal" data-target="qdetail" style="color:black; text-decoration:underline;">'
		  						+decodeURIComponent(json.qlist[i].title)+'</a></td>'
		  						+'<td style="border-right:0.5px solid silver; width:24%;">관리자</td>'
		  						+'<td style="border-right:0.5px solid silver; width:16%;">'+json.qlist[i].send_creation_date+'</td>'
		  						+'<td style="width:16%;">'
		  						+'<button data-toggle="modal" data-target="rqdetail">답변 보기</button></td>'
		  						+'</tr>'
  						} else{
  							tr+='<tr><td style="border-right:0.5px solid silver;">'
  		  						+'<a href="#" data-toggle="modal" data-target="qdetail" style="color:black; text-decoration:underline;">'
  		  						+decodeURIComponent(json.qlist[i].title)+'</a></td>'
  		  						+'<td style="border-right:0.5px solid silver; width:24%;">'
  		  						+decodeURIComponent(json.qlist[i].receive_member_id)
  		  						+'</td>'
  		  						+'<td style="border-right:0.5px solid silver; width:16%;">'+json.qlist[i].send_creation_date+'</td>'
  		  						+'<td style="width:16%;">'
	  							+'<button data-toggle="modal" data-target="rqdetail">답변 보기</button></td>'
  		  						+'</tr>'
  						}
  					} else{
  						if(json.qlist[i].receive_member_id=="admin"){
  							tr+='<tr><td style="border-right:0.5px solid silver;">'
  		  						+'<a href="#" data-toggle="modal" data-target="qdetail" style="color:black; text-decoration:underline;">'
  		  						+decodeURIComponent(json.qlist[i].title)+'</a></td>'
  		  						+'<td style="border-right:0.5px solid silver; width:24%;">관리자</td>'
  		  						+'<td style="border-right:0.5px solid silver; width:16%;">'+json.qlist[i].send_creation_date+'</td>'
  		  						+'<td style="width:16%;">답변이 아직...</td>'
  		  						+'</tr>'
  						} else{
  							tr+='<tr><td style="border-right:0.5px solid silver;">'
  		  						+'<a href="#" data-toggle="modal" data-target="qdetail" style="color:black; text-decoration:underline;">'
  		  						+decodeURIComponent(json.qlist[i].title)+'</a></td>'
  		  						+'<td style="border-right:0.5px solid silver; width:24%;">'
  		  						+decodeURIComponent(json.qlist[i].receive_member_id)
  		  						+'</td>'
  		  						+'<td style="border-right:0.5px solid silver; width:16%;">'+json.qlist[i].send_creation_date+'</td>'
  		  						+'<td style="width:16%;">답변이 아직...</td>'
  		  						+'</tr>'
  						}
  					}
  				}
  				$('#qlist').html(tr);
  			},
  			error: function(request, status, errorData) {
  				alert("에러코드: " + request.status + "\n\n" + "메세지: "
  						+ request.responseText + "\n\n" + "에러: "
  						+ errorData);
  			}
  		});
  	});
  </script>
  
  
</body>
</html>