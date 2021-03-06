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
	
	/* jieun */
	.btn-primary{
		border: 1px solid #3e4b53;
		background-color: white;
		color: #3e4b53;
		
	}
	.btn-primary:hover{
		border: 1px solid #3e4b53;
		background-color: #3e4b53;
		color: white;
	}
</style>

</head>
 <body class="skin_main" id = "body1">
<c:import url="mypageStatusHeader.jsp"/>
<c:import url="mypageStatusSide.jsp"/>
<div id="container">
		<div id="content" class="section_home" >
			<input type="hidden" id="memberId" value="${loginUser.member_id }"/>
			
			<div class="c_header">
				<h2>구매한 공동구매</h2>
				<p class="contxt">내가 구매한 공동구매를 확인할 수 있어요.</p>
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



function pmodal(payment_id){
	var member_id=$('#memberId').val();
	console.log("payment_id: " +payment_id);
	/* console.log("typeof: "+typeof payment_id) */
	console.log(member_id);
	$.ajax({
		url:"prod_payment.do",
		data: {payment_id:payment_id, member_id:member_id},
		dataType:"json",
		type:"post",
		success:function(e){
			var jsonStr = JSON.stringify(e);
			//변환된 문자열을 json 객체로 바꿈
			var json = JSON.parse(jsonStr);
			
			$("#ppmodal").empty();
			
			var value=$("#ppmodal").html();
			value='<hr style="border:0.5px solid black;">'
			for(var i in json.mpproduct){
			value+=	'<div><br><div>&nbsp; 선택하신 선물 - '
					+'<b>'+decodeURIComponent(json.mpproduct[i].item_name)+' &nbsp;총 '
					+json.mpproduct[i].count+'개 </b></div><br>'
			}
			value+='<hr style="border:0.5px solid black"><br><b><i>&nbsp;총 결제금액 : '+json.mpproduct[i].total_amount+'  원<br>&nbsp;결제하신 날 : '
			+json.mpproduct[i].payment_date+'<i></b>'
			+'</div>'
			value+='<br><div style="margin-left:75%;"><button class="btn btn-danger btn-sm"><a href="refund.do?payment_id='+json.mpproduct[i].payment_id+'&pay_option='+json.mpproduct[i].pay_option+'" style="color:white;">결제 취소</a></button>'
			$("#ppmodal").html(value);
		},
		error:function(request, status, errorData){
				alert("error code : " + request.status + "\n" 
					+ "message : " + request.responseText + "\n"
					+ "error : " + errorData );	
		}
	});
}
//jieun
//프로젝트 아이디 배열
projectIds = [];
projectIdsIndex = 0;

var size=4;

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
					//jieun
				 	var projectIdFlag = true;
					for(var j=0; j<projectIds.length; ++j){
						if(projectIds[j] === json.pproduct[i].project_id){
							projectIdFlag = false;
							break;
						}
					}
					
					//프로젝트 아이디 중복 안되게
					if(projectIdFlag){
						projectIds[projectIdsIndex] = json.pproduct[i].project_id;
						projectIdsIndex++;
					} 
					//jieun
					
					console.log("3");
					if(json.pproduct[i].image_rename==null){
						console.log("4");
					tag+='<tr class="list" name="tt">'
						+'<td class="limg">'
						+'<img name="img_rename" src="resources/images/logo.png"/>'
						+'</td>'
						+'<td><b><small>[프로젝트]</small><br><a href="projectDetailGPView.do?member_id=${loginUser.member_id}&project_id='+json.pproduct[i].project_id+'" style="color:black;">'
						+decodeURIComponent(json.pproduct[i].project_name)+'</b></a><br><br>'
						+'<a href=""  onclick="pmodal(this.value)" value='+(json.pproduct[i].payment_id).substring(4)+'"'
						+'data-toggle="modal" data-target="#pppaymentModal" style="color:black; font-size:11px; text-decoration:underline;">'
						+'결제 내역 보기</a></td>'
						+'</td>'
						+'<td><b>마감일<br>'+json.pproduct[i].end_date+'</b><br><br>'
						//jieun
						//버튼추가
						+ '<button class="btn btn-primary" style="font-size: 9pt;" onclick="showStarPoint('+ json.pproduct[i].project_id +')">프로젝트 별점 주기</button></td>'
						+'</tr>';
					} else{
						
						tag+='<tr class="list" name="tt">'
							+'<td class="limg">'
							+'<img name="img_rename" src="resources/uploadProPreImages/'+decodeURIComponent(json.pproduct[i].image_rename)+'"/>'
							+'</td>'
							+'<td><b><small>[프로젝트]</small><br><a href="projectDetailGPView.do?member_id=${loginUser.member_id}&project_id='+json.pproduct[i].project_id+'" style="color:black;">'
							+decodeURIComponent(json.pproduct[i].project_name)+'</b></a><br><br>'
							+'<a href="" name="payment_id" onclick="pmodal('+(json.pproduct[i].payment_id).substring(4)+')" data-toggle="modal" data-target="#pppaymentModal" style="color:black; font-size:11px; text-decoration:underline;">'
							+'결제 내역 보기</a></td>'
							+'</td>'
							+'<td><b>마감일<br>'+json.pproduct[i].end_date+'</b><br><br>'
							+ '<button class="btn btn-primary" style="font-size: 9pt;" onclick="showStarPoint('+ json.pproduct[i].project_id +')">프로젝트 별점 주기</button></td>'
							+'</tr>';
						console.log("리스트 추력:"+typeof json.pproduct[i].payment_id);
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
						+'<td><b><small>[프로젝트]</small><br><a href="projectDetailGPView.do?member_id=${loginUser.member_id}&project_id='+json.spproduct[i].project_id+'" style="color:black;">'
						+decodeURIComponent(json.spproduct[i].project_name)+'</b></a><br><br>'
						+'<a href="" onclick="pmodal("'+(json.spproduct[i].payment_id).substring(4)+'")"'
						+'data-toggle="modal" data-target="#pppaymentModals" style="color:black; font-size:11px; text-decoration:underline;">'
						+'결제 내역 보기</a></td>'
						+'</td>'
						+'<td><b>마감일<br>'+json.spproduct[i].end_date+'</b><br><br>'
						+ '<button class="btn btn-primary" style="font-size: 9pt;" onclick="showStarPoint('+ json.spproduct[i].project_id +')">프로젝트 별점 주기</button></td>'
						+'</tr>';
					} else{
						tag+='<tr class="list" name="tt">'
							+'<td class="limg">'
							+'<img name="img_rename" src="resources/uploadProPreImages/'+decodeURIComponent(json.spproduct[i].image_rename)+'"/>'
							+'</td>'
							+'<td><b><small>[프로젝트]</small><br><a href="projectDetailGPView.do?member_id=${loginUser.member_id}&project_id='+json.spproduct[i].project_id+'" style="color:black;">'
							+decodeURIComponent(json.spproduct[i].project_name)+'</b></a><br><br>'
							+'<a href="" onclick="pmodal("'+(json.spproduct[i].payment_id).substring(4)+'")"'
							+'data-toggle="modal" data-target="#pppaymentModal" style="color:black; font-size:11px; text-decoration:underline;">'
							+'결제 내역 보기</a></td>'
							+'</td>'
							+'<td><b>마감일<br>'+json.spproduct[i].end_date+'</b><br><br>'
							+ '<button class="btn btn-primary" style="font-size: 9pt;" onclick="showStarPoint('+ json.spproduct[i].project_id +')">프로젝트 별점 주기</button></td>'
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
	
	
	//jieun
	//프로젝트 아이디마다 모달창 만들기
	
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
	 			url:"purchaseProductList.do",
	 			data:{"size":Number(size), "member_id": member_id},
	 			dataType:"json",
	 			type:"post",
	 			success:function(e){
	 				var jsonStr=JSON.stringify(e);
	 				var json=JSON.parse(jsonStr); 
	 				var tag="";
	 				if(json.pproduct[0]!=null){
	 					console.log("1");
	 					for(var i=0;i<json.pproduct.length;i++){
	 						if(json.pproduct[i].image_rename==null){
	 						tag+='<tr class="list" name="tt">'
	 							+'<td class="limg">'
	 							+'<img name="img_rename" src="resources/images/logo.png"/>'
	 							+'</td>'
	 							+'<td><b><small>[프로젝트]</small><br><a href="projectDetailGPView.do?member_id=${loginUser.member_id}&project_id='+json.pproduct[i].project_id+'" style="color:black;">'
	 							+decodeURIComponent(json.pproduct[i].project_name)+'</b></a><br><br>'
	 							+'<a href="" onclick="pmodal('+(json.pproduct[i].payment_id).substring(4)+')"'
	 							+'data-toggle="modal" data-target="#pppyamentModal" style="color:black; font-size:11px; text-decoration:underline;">'
	 							+'결제 내역 보기</a></td>'
	 							+'</td>'
	 							+'<td><b>마감일<br>'+json.pproduct[i].end_date+'</b><br><br>'
								+ '<button class="btn btn-primary" style="font-size: 9pt;" onclick="showStarPoint('+ json.pproduct[i].project_id +')">프로젝트 별점 주기</button></td>'
	 							+'</tr>';
	 						} else{
	 							tag+='<tr class="list" name="tt">'
	 								+'<td class="limg">'
	 								+'<img name="img_rename" src="resources/uploadProPreImages/'+decodeURIComponent(json.pproduct[i].image_rename)+'"/>'
	 								+'</td>'
	 								+'<td><b><small>[프로젝트]</small><br><a href="projectDetailGPView.do?member_id=${loginUser.member_id}&project_id='+json.pproduct[i].project_id+'" style="color:black;">'
	 								+decodeURIComponent(json.pproduct[i].project_name)+'</b></a><br><br>'
	 								+'<a href="" onclick="pmodal('+(json.pproduct[i].payment_id).substring(4)+')"'
	 								+'data-toggle="modal" data-target="#pppyamentModal" style="color:black; font-size:11px; text-decoration:underline;">'
	 								+'결제 내역 보기</a></td>'
	 								+'</td>'
	 								+'<td><b>마감일<br>'+json.pproduct[i].end_date+'</b><br><br>'
	 								+ '<button class="btn btn-primary" style="font-size: 9pt;" onclick="showStarPoint('+ json.pproduct[i].project_id +')">프로젝트 별점 주기</button></td>'
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
	 							+'<td><b><small>[프로젝트]</small><br><a href="projectDetailGPView.do?member_id=${loginUser.member_id}&project_id='+json.spproduct[i].project_id+'" style="color:black;">'
	 							+decodeURIComponent(json.spproduct[i].project_name)+'</b></a><br><br>'
	 							+'<a href="" onclick="pmodal('+(json.spproduct[i].payment_id).substring(4)+')"'
	 							+'data-toggle="modal" data-target="#pppaymentModal" style="color:black; font-size:11px; text-decoration:underline;">'
	 							+'결제 내역 보기</a></td>'
	 							+'</td>'
	 							+'<td><b>마감일<br>'+json.spproduct[i].end_date+'</b><br><br>'
								+ '<button class="btn btn-primary" style="font-size: 9pt;" onclick="showStarPoint('+ json.spproduct[i].project_id +')">프로젝트 별점 주기</button></td>'
	 							+'</tr>';
	 						} else{
	 							tag+='<tr class="list" name="tt">'
	 								+'<td class="limg">'
	 								+'<img name="img_rename" src="resources/uploadProPreImages/'+decodeURIComponent(json.spproduct[i].image_rename)+'"/>'
	 								+'</td>'
	 								+'<td><b><small>[프로젝트]</small><br><a href="projectDetailGPView.do?member_id=${loginUser.member_id}&project_id='+json.spproduct[i].project_id+'" style="color:black;">'
	 								+decodeURIComponent(json.spproduct[i].project_name)+'</b></a><br><br>'
	 								+'<a href="" onclick="pmodal('+(json.spproduct[i].payment_id).substring(4)+')"'
	 								+'data-toggle="modal" data-target="#pppaymentModal" style="color:black; font-size:11px; text-decoration:underline;">'
	 								+'결제 내역 보기</a></td>'
	 								+'</td>'
	 								+'<td><b>마감일<br>'+json.spproduct[i].end_date+'</b><br><br>'
	 								+ '<button class="btn btn-primary" style="font-size: 9pt;" onclick="showStarPoint('+ json.spproduct[i].project_id +')">프로젝트 별점 주기</button></td>'
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
      <hr>
       
      </div>
    </div>
  </div>
</div>

<!-- 별점 모달창 만들 곳 -->
<div id="starpoint-div"></div>

</body>
</html>