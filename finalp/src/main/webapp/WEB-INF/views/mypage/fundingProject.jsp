<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>펀딩한 프로젝트</title>
<style>
	td{
		font-size:13px;
	}
	td img{
		width:200px;
		height:200px;
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
<c:import url="mypageStatusHeader.jsp"/>
<c:import url="mypageStatusSide.jsp"/>
<div id="container">
		<div id="content" class="section_home" >
			<input type="hidden" id="memberId" value="${loginUser.member_id }"/>
			
			<div class="c_header">
				<h2>펀딩한 프로젝트</h2>
				<p class="contxt">내가 펀딩한 프로젝트를 확인할 수 있어요.</p>
			</div>
		</div>
		<div id="list">
			<input type="text" style="margin-left:2%" id="project_name" name="project_name" placeholder="제목으로 검색"/>
			<table class="tbl_type" cellspacing="0" border="1">
			</table>
		</div>
		<div id="result" style="text-align:center;"></div>
	</div>
	
	<script type="text/javascript">
var size=4;

$(window).ready(function(){
	var member_id=$('#memberId').val();
	$.ajax({
		url:"fundingProjectList.do",
		data:{"size":Number(size), "member_id": member_id},
		dataType:"json",
		type:"post",
		success:function(e){
			var jsonStr=JSON.stringify(e);
			var json=JSON.parse(jsonStr); 
			var tag="";
			console.log("1");
			if(json.fproject[0]!=null){
				console.log("1");
				for(var i=0;i<json.fproject.length;i++){
					console.log("3");
					if(json.fproject[i].image_rename==null){
						console.log("4");
					tag+='<tr class="list" name="tt">'
						+'<td class="limg">'
						+'<img name="img_rename" src="resources/images/logo.png"/>'
						+'</td>'
						+'<td><b><small>[프로젝트]</small><br><a href="projectDetailView.do?member_id=${loginUser.member_id}&project_id='+json.fproject[i].project_id+'" style="color:black;">'
						+decodeURIComponent(json.fproject[i].project_name)+'</b></a><br><br>'
						+'<a href="" onclick="fModal('+json.fproject[i].payment_id+')"'
						+'data-toggle="modal" data-target="#fppaymentModal" style="color:black; font-size:11px; text-decoration:underline;">'
						+'결제 내역 보기</a></td>'
						+'</td>'
						+'<td><b>마감일<br>'+json.fproject[i].end_date+'</b></td>'
						+'</tr>';
					} else{
						tag+='<tr class="list" name="tt">'
							+'<td class="limg">'
							+'<img name="img_rename" src="resources/uploadProPreImages/'+decodeURIComponent(json.fproject[i].image_rename)+'"/>'
							+'</td>'
							+'<td><b><small>[프로젝트]</small><br><a href="projectDetailView.do?member_id=${loginUser.member_id}&project_id='+json.fproject[i].project_id+'" style="color:black;">'
							+decodeURIComponent(json.fproject[i].project_name)+'</b></a><br><br>'
							+'<a href="" onclick="fModal('+json.fproject[i].payment_id+')"'
							+'data-toggle="modal" data-target="#fppaymentModal" style="color:black; font-size:11px; text-decoration:underline;">'
							+'결제 내역 보기</a></td>'
							+'</td>'
							+'<td><b>마감일<br>'+json.fproject[i].end_date+'</b></td>'
							+'</tr>';
					}
				}
			$('.tbl_type').html(tag);
			} else{
				$('#result').html("결과가 없습니다.");
				$('#container').css("height","600px");
			}
		},
		error: function(request, status, errorData) {
			alert("에러코드: " + request.status + "\n" + "메세지: "
					+ request.responseText + "\n" + "에러: "
					+ errorData);
		}
	});
	$('#project_name').keyup(function(){
		 var member_id=$('#memberId').val();
		 var project_name=$('#project_name').val();
		$.ajax({
			url:"searchfundingproject.do",
			dataType:"json",
			data:{"size":size, "member_id":member_id,"project_name":project_name},
			type:"post",
			success:function(e){
				var jsonStr=JSON.stringify(e);
				var json=JSON.parse(jsonStr); 
				var tag="";
				for(var i=0;i<json.sfproject.length;i++){
					if(json.sfproject[i].image_rename==null){
					tag+='<tr class="list" name="tt">'
						+'<td class="limg">'
						+'<img name="img_rename" src="resources/images/logo.png"/>'
						+'</td>'
						+'<td><b><small>[프로젝트]</small><br><a href="projectDetailView.do?member_id=${loginUser.member_id}&project_id='+json.sfproject[i].project_id+'" style="color:black;">'
						+decodeURIComponent(json.sfproject[i].project_name)+'</b></a><br><br>'
						+'<a href="" onclick="fModal('+json.sfproject[i].payment_id+')"'
						+'data-toggle="modal" data-target="#fppaymentModal" style="color:black; font-size:11px; text-decoration:underline;">'
						+'결제 내역 보기</a></td>'
						+'</td>'
						+'<td><b>마감일<br>'+json.sfproject[i].end_date+'</b></td>'
						+'</tr>';
					} else{
						tag+='<tr class="list" name="tt">'
							+'<td class="limg">'
							+'<img name="img_rename" src="resources/uploadProPreImages/'+decodeURIComponent(json.sfproject[i].image_rename)+'"/>'
							+'</td>'
							+'<td><b><small>[프로젝트]</small><br><a href="projectDetailView.do?member_id=${loginUser.member_id}&project_id='+json.sfproject[i].project_id+'" style="color:black;">'
							+decodeURIComponent(json.sfproject[i].project_name)+'</b></a><br><br>'
							+'<a href="" onclick="fModal('+json.sfproject[i].payment_id+')"'
							+'data-toggle="modal" data-target="#fppaymentModal" style="color:black; font-size:11px; text-decoration:underline;">'
							+'결제 내역 보기</a></td>'
							+'</td>'
							+'<td><b>마감일<br>'+json.sfproject[i].end_date+'</b></td>'
							+'</tr>';
					}
					size++;
				}
				$('.tbl_type').html(tag);
			},
			error: function(request, status, errorData) {
				alert("에러코드: " + request.status + "\n" + "메세지: "
						+ request.responseText + "\n" + "에러: "
						+ errorData);
			}
		});
	});
});

$(window).scroll(function() {
	 var member_id=$('#memberId').val();
	 var project_name=$('#project_name').val();
	 console.log("구분자");
	 console.log($(window).scrollTop());
	 console.log($(document).height()-$(window).height());
	 	if($(window).scrollTop()>=$(document).height()-$(window).height()-2 ){
	 	if(project_name==null){
	 		$.ajax({
	 			url:"fundingProjectList.do",
	 			data:{"size":Number(size), "member_id": member_id},
	 			dataType:"json",
	 			type:"post",
	 			success:function(e){
	 				var jsonStr=JSON.stringify(e);
	 				var json=JSON.parse(jsonStr); 
	 				var tag="";
	 				console.log("1");
	 				if(json.fproject[0]!=null){
	 					console.log("1");
	 					for(var i=0;i<json.fproject.length;i++){
	 						console.log("3");
	 						if(json.fproject[i].image_rename==null){
	 							console.log("4");
	 						tag+='<tr class="list" name="tt">'
	 							+'<td class="limg">'
	 							+'<img name="img_rename" src="resources/images/logo.png"/>'
	 							+'</td>'
	 							+'<td><b><small>[프로젝트]</small><br><a href="projectDetailView.do?member_id=${loginUser.member_id}&project_id='+json.fproject[i].project_id+'" style="color:black;">'
	 							+decodeURIComponent(json.fproject[i].project_name)+'</b></a><br><br>'
	 							+'<a href="" onclick="fModal('+json.fproject[i].payment_id+')"'
	 							+'data-toggle="modal" data-target="#fppaymentModal" style="color:black; font-size:11px; text-decoration:underline;">'
	 							+'결제 내역 보기</a></td>'
	 							+'</td>'
	 							+'<td><b>마감일<br>'+json.fproject[i].end_date+'</b></td>'
	 							+'</tr>';
	 						} else{
	 							tag+='<tr class="list" name="tt">'
	 								+'<td class="limg">'
	 								+'<img name="img_rename" src="resources/uploadProPreImages/'+decodeURIComponent(json.pproduct[i].image_rename)+'"/>'
	 								+'</td>'
	 								+'<td><b><small>[프로젝트]</small><br><a href="projectDetailView.do?member_id=${loginUser.member_id}&project_id='+json.fproject[i].project_id+'" style="color:black;">'
	 								+decodeURIComponent(json.fproject[i].project_name)+'</b></a><br><br>'
	 								+'<a href="" onclick="fModal('+json.fproject[i].payment_id+')"'
	 								+'data-toggle="modal" data-target="#fppaymentModal" style="color:black; font-size:11px; text-decoration:underline;">'
	 								+'결제 내역 보기</a></td>'
	 								+'</td>'
	 								+'<td><b>마감일<br>'+json.fproject[i].end_date+'</b></td>'
	 								+'</tr>';
	 						}
	 					}
	 				$('.tbl_type').html(tag);
	 				} else{
	 					$('#result').html("결과가 없습니다.");
	 					$('#container').css("height","600px");
	 				}
	 			},
	 			error: function(request, status, errorData) {
	 				alert("에러코드: " + request.status + "\n" + "메세지: "
	 						+ request.responseText + "\n" + "에러: "
	 						+ errorData);
	 			}
	 		});
	 		$('#project_name').keyup(function(){
	 			 var member_id=$('#memberId').val();
	 			 var project_name=$('#project_name').val();
	 			$.ajax({
	 				url:"searchfundingproject.do",
	 				dataType:"json",
	 				data:{"size":size, "member_id":member_id,"project_name":project_name},
	 				type:"post",
	 				success:function(e){
	 					var jsonStr=JSON.stringify(e);
	 					var json=JSON.parse(jsonStr); 
	 					var tag="";
	 					for(var i=0;i<json.sfproject.length;i++){
	 						if(json.sfproject[i].image_rename==null){
	 						tag+='<tr class="list" name="tt">'
	 							+'<td class="limg">'
	 							+'<img name="img_rename" src="resources/images/logo.png"/>'
	 							+'</td>'
	 							+'<td><b><small>[프로젝트]</small><br><a href="projectDetailView.do?member_id=${loginUser.member_id}&project_id='+json.sfproject[i].project_id+'" style="color:black;">'
	 							+decodeURIComponent(json.sfproject[i].project_name)+'</b></a><br><br>'
	 							+'<a href="" onclick="fModal('+json.sfproject[i].payment_id+')"'
	 							+'data-toggle="modal" data-target="#fppaymentModal" style="color:black; font-size:11px; text-decoration:underline;">'
	 							+'결제 내역 보기</a></td>'
	 							+'</td>'
	 							+'<td><b>마감일<br>'+json.sfproject[i].end_date+'</b></td>'
	 							+'</tr>';
	 						} else{
	 							tag+='<tr class="list" name="tt">'
	 								+'<td class="limg">'
	 								+'<img name="img_rename" src="resources/uploadProPreImages/'+decodeURIComponent(json.sfproject[i].image_rename)+'"/>'
	 								+'</td>'
	 								+'<td><b><small>[프로젝트]</small><br><a href="projectDetailView.do?member_id=${loginUser.member_id}&project_id='+json.sfproject[i].project_id+'" style="color:black;">'
	 								+decodeURIComponent(json.sfproject[i].project_name)+'</b></a><br><br>'
	 								+'<a href="" onclick="fModal('+json.sfproject[i].payment_id+')"'
	 								+'data-toggle="modal" data-target="#fppaymentModal" style="color:black; font-size:11px; text-decoration:underline;">'
	 								+'결제 내역 보기</a></td>'
	 								+'</td>'
	 								+'<td><b>마감일<br>'+json.sfproject[i].end_date+'</b></td>'
	 								+'</tr>';
	 						}
	 						size++;
	 					}
	 					$('.tbl_type').html(tag);
	 				},
	 				error: function(request, status, errorData) {
	 					alert("에러코드: " + request.status + "\n" + "메세지: "
	 							+ request.responseText + "\n" + "에러: "
	 							+ errorData);
	 				}
	 			});
	 		});
	 	}
	 }
});
function fModal(fmid){
	var member_id=$('#memberId').val();
	console.log("payment_id" +fmid);
	console.log("typeof"+typeof fmid)
	console.log(member_id);
	$.ajax({
		url:"fund_payment.do",
		data: {"payment_id":fmid, "member_id":member_id},
		dataType:"json",
		type:"post",
		success:function(e){
			var jsonStr = JSON.stringify(e);
			//변환된 문자열을 json 객체로 바꿈
			var json = JSON.parse(jsonStr);
			
			$("#fpmodal").empty();
			
			var value=$("#fpmodal").html();
			for(var i in json.mfproject){
			value+=	'<br><div>&nbsp; 선택하신 선물 - '
					+decodeURIComponent(json.mfproject[i].item_name)+' &nbsp;<b>총 '
					+json.mfproject[i].count+'개</b><br>'
					+'</div>'
			}
			value+='<br><div style="margin-left:75%;"><button class="btn btn-danger btn-sm"><a href="refund.do?payment_id='+json.mfproject[i].payment_id+'&pay_option='+json.mfproject[i].pay_option+'" style="color:white;">결제 취소</a></button>'
			$("#fpmodal").html(value);
		},
		error:function(request, status, errorData){
				alert("error code : " + request.status + "\n" 
					+ "message : " + request.responseText + "\n"
					+ "error : " + errorData );	
		}
	});
}

</script>
<!-- 결제내역 modal -->
<div class="modal fade" id="fppaymentModal">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">회원님의 결제내역</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>

      <!-- Modal body -->
      <div class="modal-body" id="fpmodal">
       
      </div>
    </div>
  </div>
</div>
</body>
</html>