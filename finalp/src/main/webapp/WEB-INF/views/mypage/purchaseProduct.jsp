<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구매한 공동구매</title>
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
				<h2>구매한 공동구매 상품</h2>
				<p class="contxt">내가 구매한 공동구매 상품을 확인할 수 있어요.</p>
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
//시작하자마자 리스트 출력
$(window).ready(function(){
	var member_id=$('#memberId').val();
	$.ajax({
		url:"purchaseProductList.do",
		data:{"size":Number(size), "member_id": member_id},
		dataType:"json",
		type:"post",
		success:function(e){
			var jsonStr=JSON.stringify(e);
			var json=JSON.parse(jsonStr); 
			var tag="";
			console.log("1");
			if(json.pproduct[0]!=null){
				console.log("1");
				for(var i=0;i<json.pproduct.length;i++){
					console.log("3");
					if(json.pproduct[i].image_rename==null){
						console.log("4");
					tag+='<tr class="list" name="tt">'
						+'<td class="limg">'
						+'<img name="img_rename" src="resources/images/logo.png"/>'
						+'</td>'
						+'<c:url var="projectDetail" value="projectDetailView.do">'
						+'<c:param name="member_id" value="${loginUser.member_id }"/>'
						+'<c:param name="project_id" value=""/>'
						+'</c:url>'
						+'<td><b><small>[공동구매]</small><br><a href="${projectDetail}" style="color:black;">'
						+decodeURIComponent(json.pproduct[i].project_name)+'</b></a><br><br>'
						+'<a href="" onclick="pModal('+json.pproduct[i].payment_id+')"'
						+'data-toggle="modal" data-target="#pppaymentModal" style="color:black; font-size:11px; text-decoration:underline;">'
						+'결제 내역 보기</a></td>'
						+'</td>'
						+'<td><b>마감일<br>'+json.pproduct[i].end_date+'</b></td>'
						+'</tr>';
					} else{
						tag+='<tr class="list" name="tt">'
							+'<td class="limg">'
							+'<img name="img_rename" src="resources/uploadProPreImages/'+decodeURIComponent(json.pproduct[i].image_rename)+'"/>'
							+'</td>'
							+'<c:url var="projectDetail" value="projectDetailView.do">'
							+'<c:param name="member_id" value="${loginUser.member_id }"/>'
							+'<c:param name="project_id" value=""/>'
							+'</c:url>'
							+'<td><b><small>[공동구매]</small><br><a href="${projectDetail}" style="color:black;">'
							+decodeURIComponent(json.pproduct[i].project_name)+'</b></a><br><br>'
							+'<a href="" onclick="pModal('+json.pproduct[i].payment_id+')"'
							+'data-toggle="modal" data-target="#pppaymentModal" style="color:black; font-size:11px; text-decoration:underline;">'
							+'결제 내역 보기</a></td>'
							+'</td>'
							+'<td><b>마감일<br>'+json.pproduct[i].end_date+'</b></td>'
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
			url:"searchpurchaseproduct.do",
			dataType:"json",
			data:{"size":size, "member_id":member_id,"project_name":project_name},
			type:"post",
			success:function(e){
				var jsonStr=JSON.stringify(e);
				var json=JSON.parse(jsonStr); 
				var tag="";
				for(var i=0;i<json.spproduct.length;i++){
					if(json.spproduct[i].image_rename==null){
					tag+='<tr class="list" name="tt">'
						+'<td class="limg">'
						+'<img name="img_rename" src="resources/images/logo.png"/>'
						+'</td>'
						+'<c:url var="projectDetail" value="projectDetailView.do">'
						+'<c:param name="member_id" value="${loginUser.member_id }"/>'
						+'<c:param name="project_id" value=""/>'
						+'</c:url>'
						+'<td><b><small>[공동구매]</small><br><a href="${projectDetail}" style="color:black;">'
						+decodeURIComponent(json.spproduct[i].project_name)+'</b></a><br><br>'
						+'<a href="" onclick="pModal('+json.spproduct[i].payment_id+')"'
						+'data-toggle="modal" data-target="#pppaymentModal" style="color:black; font-size:11px; text-decoration:underline;">'
						+'결제 내역 보기</a></td>'
						+'</td>'
						+'<td><b>마감일<br>'+json.spproduct[i].end_date+'</b></td>'
						+'</tr>';
					} else{
						tag+='<tr class="list" name="tt">'
							+'<td class="limg">'
							+'<img name="img_rename" src="resources/uploadProPreImages/'+decodeURIComponent(json.spproduct[i].image_rename)+'"/>'
							+'</td>'
							+'<c:url var="projectDetail" value="projectDetailView.do">'
							+'<c:param name="member_id" value="${loginUser.member_id }"/>'
							+'<c:param name="project_id" value=""/>'
							+'</c:url>'
							+'<td><b><small>[공동구매]</small><br><a href="${projectDetail}" style="color:black;">'
							+decodeURIComponent(json.spproduct[i].project_name)+'</b></a><br><br>'
							+'<a href="" onclick="pModal('+json.spproduct[i].payment_id+')"'
							+'data-toggle="modal" data-target="#pppaymentModal" style="color:black; font-size:11px; text-decoration:underline;">'
							+'결제 내역 보기</a></td>'
							+'</td>'
							+'<td><b>마감일<br>'+json.spproduct[i].end_date+'</b></td>'
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
//스크롤 페이징
$(window).scroll(function() {
	 var member_id=$('#memberId').val();
	 var project_name=$('#project_name').val();
	 console.log("구분자");
	 console.log($(window).scrollTop());
	 console.log($(document).height()-$(window).height());
	 	if($(window).scrollTop()>=$(document).height()-$(window).height()-2 ){
	 	if(project_name==null){
	 		$.ajax({
	 			url:"purchaseProductList.do",
	 			data:{"size":Number(size), "member_id": member_id},
	 			dataType:"json",
	 			type:"post",
	 			success:function(e){
	 				var jsonStr=JSON.stringify(e);
	 				var json=JSON.parse(jsonStr); 
	 				var tag="";
	 				console.log("1");
	 				if(json.pproduct[0]!=null){
	 					console.log("1");
	 					for(var i=0;i<json.pproduct.length;i++){
	 						console.log("3");
	 						if(json.pproduct[i].image_rename==null){
	 							console.log("4");
	 						tag+='<tr class="list" name="tt">'
	 							+'<td class="limg">'
	 							+'<img name="img_rename" src="resources/images/logo.png"/>'
	 							+'</td>'
	 							+'<c:url var="projectDetail" value="projectDetailView.do">'
	 							+'<c:param name="member_id" value="${loginUser.member_id }"/>'
	 							+'<c:param name="project_id" value=""/>'
	 							+'</c:url>'
	 							+'<td><b><small>[공동구매]</small><br><a href="${projectDetail}" style="color:black;">'
	 							+decodeURIComponent(json.pproduct[i].project_name)+'</b></a><br><br>'
	 							+'<a href="" onclick="pModal('+json.pproduct[i].payment_id+')"'
	 							+'data-toggle="modal" data-target="#pppaymentModal" style="color:black; font-size:11px; text-decoration:underline;">'
	 							+'결제 내역 보기</a></td>'
	 							+'</td>'
	 							+'<td><b>마감일<br>'+json.pproduct[i].end_date+'</b></td>'
	 							+'</tr>';
	 						} else{
	 							tag+='<tr class="list" name="tt">'
	 								+'<td class="limg">'
	 								+'<img name="img_rename" src="resources/uploadProPreImages/'+decodeURIComponent(json.pproduct[i].image_rename)+'"/>'
	 								+'</td>'
	 								+'<c:url var="projectDetail" value="projectDetailView.do">'
	 								+'<c:param name="member_id" value="${loginUser.member_id }"/>'
	 								+'<c:param name="project_id" value=""/>'
	 								+'</c:url>'
	 								+'<td><b><small>[공동구매]</small><br><a href="${projectDetail}" style="color:black;">'
	 								+decodeURIComponent(json.pproduct[i].project_name)+'</b></a><br><br>'
	 								+'<a href="" onclick="pModal('+json.pproduct[i].payment_id+')"'
	 								+'data-toggle="modal" data-target="#pppaymentModal" style="color:black; font-size:11px; text-decoration:underline;">'
	 								+'결제 내역 보기</a></td>'
	 								+'</td>'
	 								+'<td><b>마감일<br>'+json.pproduct[i].end_date+'</b></td>'
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
	 				url:"searchpurchaseproduct.do",
	 				dataType:"json",
	 				data:{"size":size, "member_id":member_id,"project_name":project_name},
	 				type:"post",
	 				success:function(e){
	 					var jsonStr=JSON.stringify(e);
	 					var json=JSON.parse(jsonStr); 
	 					var tag="";
	 					for(var i=0;i<json.spproduct.length;i++){
	 						if(json.spproduct[i].image_rename==null){
	 						tag+='<tr class="list" name="tt">'
	 							+'<td class="limg">'
	 							+'<img name="img_rename" src="resources/images/logo.png"/>'
	 							+'</td>'
	 							+'<c:url var="projectDetail" value="projectDetailView.do">'
	 							+'<c:param name="member_id" value="${loginUser.member_id }"/>'
	 							+'<c:param name="project_id" value=""/>'
	 							+'</c:url>'
	 							+'<td><b><small>[공동구매]</small><br><a href="${projectDetail}" style="color:black;">'
	 							+decodeURIComponent(json.spproduct[i].project_name)+'</b></a><br><br>'
	 							+'<a href="" onclick="pModal('+json.spproduct[i].payment_id+')"'
	 							+'data-toggle="modal" data-target="#pppaymentModal" style="color:black; font-size:11px; text-decoration:underline;">'
	 							+'결제 내역 보기</a></td>'
	 							+'</td>'
	 							+'<td><b>마감일<br>'+json.spproduct[i].end_date+'</b></td>'
	 							+'</tr>';
	 						} else{
	 							tag+='<tr class="list" name="tt">'
	 								+'<td class="limg">'
	 								+'<img name="img_rename" src="resources/uploadProPreImages/'+decodeURIComponent(json.spproduct[i].image_rename)+'"/>'
	 								+'</td>'
	 								+'<c:url var="projectDetail" value="projectDetailView.do">'
	 								+'<c:param name="member_id" value="${loginUser.member_id }"/>'
	 								+'<c:param name="project_id" value=""/>'
	 								+'</c:url>'
	 								+'<td><b><small>[공동구매]</small><br><a href="${projectDetail}" style="color:black;">'
	 								+decodeURIComponent(json.spproduct[i].project_name)+'</b></a><br><br>'
	 								+'<a href="" onclick="pModal('+json.spproduct[i].payment_id+')"'
	 								+'data-toggle="modal" data-target="#pppaymentModal" style="color:black; font-size:11px; text-decoration:underline;">'
	 								+'결제 내역 보기</a></td>'
	 								+'</td>'
	 								+'<td><b>마감일<br>'+json.spproduct[i].end_date+'</b></td>'
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
	function pModal(pmid){
		var member_id=$('#memberId').val();
		console.log("payment_id" +pmid);
		console.log("typeof"+typeof pmid)
		console.log(member_id);
		$.ajax({
			url:"prod_payment.do",
			data: {"payment_id":"1.52149977576E12", "member_id":member_id},
			dataType:"json",
			type:"post",
			success:function(e){
				var jsonStr = JSON.stringify(e);
				//변환된 문자열을 json 객체로 바꿈
				var json = JSON.parse(jsonStr);
				
				$("#ppmodal").empty();
				
				var value=$("#ppmodal").html();
				for(var i in json.mpproduct){
				value+=	'<br><div>&nbsp; 상품 ID - '
						+decodeURIComponent(json.mpproduct[i].product_id)+'<br> &nbsp; 상품명 - '
						+decodeURIComponent(json.mpproduct[i].product_name)+'&nbsp; <b>총 '
						+json.mpproduct[i].count+'개</b><br>'
						+'</div>'
				}
				value+='<br><div style="margin-left:75%;"><button class="btn btn-danger btn-sm"><a href="#" style="color:white;">결제 취소</a></button>'
				$("#ppmodal").html(value);
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
<div class="modal fade" id="pppaymentModal">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">회원님의 결제내역</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>

      <!-- Modal body -->
      <div class="modal-body" id="ppmodal">
       
      </div>
    </div>
  </div>
</div>
</body>
</html>