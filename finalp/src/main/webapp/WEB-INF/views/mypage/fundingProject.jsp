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
//jieun
//프로젝트 아이디 배열
projectIds = [];
projectNames = [];
projectIdsIndex = 0;


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
					//jieun----------------------------------------
					var projectIdFlag = true;
					for(var j=0; j<projectIds.length; ++j){
						if(projectIds[j] === json.fproject[i].project_id){
							projectIdFlag = false;
							break;
						}
					}
					
					//프로젝트 아이디 중복 안되게
					if(projectIdFlag){
						projectIds[projectIdsIndex] = json.fproject[i].project_id;
						projectNames[projectIdsIndex] = json.fproject[i].project_name;
						projectIdsIndex++;
					}
					//jieun---------------------------------------
					
					console.log("3");
					if(json.fproject[i].image_rename==null){
						console.log("4");
					tag+='<tr class="list" name="tt">'
						+'<td class="limg">'
						+'<img name="img_rename" src="resources/images/logo.png"/>'
						+'</td>'
						+'<td><b><small>[프로젝트]</small><br><a href="projectDetailView.do?member_id=${loginUser.member_id}&project_id='+json.fproject[i].project_id+'" style="color:black;">'
						+decodeURIComponent(json.fproject[i].project_name)+'</b></a><br><br>'
						+'<a href=""  onclick="fModal(this.value) value='+(json.fproject[i].payment_id).substring(4)+'"'
						+'data-toggle="modal" data-target="#fppaymentModal" style="color:black; font-size:11px; text-decoration:underline;">'
						+'결제 내역 보기</a></td>'
						+'</td>'
						+'<td><b>마감일<br>'+json.fproject[i].end_date+'</b><br><br>'
						//jieun
						//버튼추가
						+ '<button class="btn btn-primary" style="font-size: 9pt;" data-toggle="modal" '
							+ 'data-target="#'+ json.fproject[i].project_id +'">프로젝트 별점 주기</button></td>'
						+'</tr>';
					} else{
						tag+='<tr class="list" name="tt">'
							+'<td class="limg">'
							+'<img name="img_rename" src="resources/uploadProPreImages/'+decodeURIComponent(json.fproject[i].image_rename)+'"/>'
							+'</td>'
							+'<td><b><small>[프로젝트]</small><br><a href="projectDetailView.do?member_id=${loginUser.member_id}&project_id='+json.fproject[i].project_id+'" style="color:black;">'
							+decodeURIComponent(json.fproject[i].project_name)+'</b></a><br><br>'
							+'<a href="" name="payment_id" onclick="fModal('+(json.fproject[i].payment_id).substring(4)+');" data-toggle="modal" data-target="#fppaymentModal" style="color:black; font-size:11px; text-decoration:underline;">'
							+'결제 내역 보기</a></td>'
							+'</td>'
							+'<td><b>마감일<br>'+json.fproject[i].end_date+'</b><br><br>'
							+ '<button class="btn btn-primary" style="font-size: 9pt;" data-toggle="modal" '
							+ 'data-target="#'+ json.fproject[i].project_id +'">프로젝트 별점 주기</button></td>'
							+'</tr>';
						console.log(typeof json.fproject[i].payment_id);
					}
				}
			$('.tbl_type').html(tag);
			
			//jieun
			//프로젝트 아이디마다 모달창 만들기
			createStarPointModal();
		
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
						+'<a href="" onclick="fModal('+(json.sfproject[i].payment_id).substring(4)+')"'
						+'data-toggle="modal" data-target="#fppaymentModal" style="color:black; font-size:11px; text-decoration:underline;">'
						+'결제 내역 보기</a></td>'
						+'</td>'
						+'<td><b>마감일<br>'+json.sfproject[i].end_date+'</b><br><br>'
						+ '<button class="btn btn-primary" style="font-size: 9pt;" data-toggle="modal" '
						+ 'data-target="#'+ json.fproject[i].project_id +'">프로젝트 별점 주기</button></td>'
						+'</tr>';
					} else{
						tag+='<tr class="list" name="tt">'
							+'<td class="limg">'
							+'<img name="img_rename" src="resources/uploadProPreImages/'+decodeURIComponent(json.sfproject[i].image_rename)+'"/>'
							+'</td>'
							+'<td><b><small>[프로젝트]</small><br><a href="projectDetailView.do?member_id=${loginUser.member_id}&project_id='+json.sfproject[i].project_id+'" style="color:black;">'
							+decodeURIComponent(json.sfproject[i].project_name)+'</b></a><br><br>'
							+'<a href="" onclick="fModal('+(json.sfproject[i].payment_id).substring(4)+')"'
							+'data-toggle="modal" data-target="#fppaymentModal" style="color:black; font-size:11px; text-decoration:underline;">'
							+'결제 내역 보기</a></td>'
							+'</td>'
							+'<td><b>마감일<br>'+json.sfproject[i].end_date+'</b><br><br>'
							+ '<button class="btn btn-primary" style="font-size: 9pt;" data-toggle="modal" '
							+ 'data-target="#'+ json.sfproject[i].project_id +'">프로젝트 별점 주기</button></td>'
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
	 				if(json.fproject[0]!=null){
	 					console.log("1");
	 					for(var i=0;i<json.fproject.length;i++){
	 						if(json.fproject[i].image_rename==null){
	 						tag+='<tr class="list" name="tt">'
	 							+'<td class="limg">'
	 							+'<img name="img_rename" src="resources/images/logo.png"/>'
	 							+'</td>'
	 							+'<td><b><small>[프로젝트]</small><br><a href="projectDetailView.do?member_id=${loginUser.member_id}&project_id='+json.fproject[i].project_id+'" style="color:black;">'
	 							+decodeURIComponent(json.fproject[i].project_name)+'</b></a><br><br>'
	 							+'<a href="" onclick="fModal('+(json.fproject[i].payment_id).substring(4)+')"'
	 							+'data-toggle="modal" data-target="#fppaymentModal" style="color:black; font-size:11px; text-decoration:underline;">'
	 							+'결제 내역 보기</a></td>'
	 							+'</td>'
	 							+'<td><b>마감일<br>'+json.fproject[i].end_date+'</b><br><br>'
	 							+ '<button class="btn btn-primary" style="font-size: 9pt;" data-toggle="modal" '
								+ 'data-target="#'+ json.fproject[i].project_id +'">프로젝트 별점 주기</button></td>'
	 							+'</tr>';
	 						} else{
	 							tag+='<tr class="list" name="tt">'
	 								+'<td class="limg">'
	 								+'<img name="img_rename" src="resources/uploadProPreImages/'+decodeURIComponent(json.fproject[i].image_rename)+'"/>'
	 								+'</td>'
	 								+'<td><b><small>[프로젝트]</small><br><a href="projectDetailView.do?member_id=${loginUser.member_id}&project_id='+json.fproject[i].project_id+'" style="color:black;">'
	 								+decodeURIComponent(json.fproject[i].project_name)+'</b></a><br><br>'
	 								+'<a href="" onclick="fModal('+(json.fproject[i].payment_id).substring(4)+')"'
	 								+'data-toggle="modal" data-target="#fppaymentModal" style="color:black; font-size:11px; text-decoration:underline;">'
	 								+'결제 내역 보기</a></td>'
	 								+'</td>'
	 								+'<td><b>마감일<br>'+json.fproject[i].end_date+'</b><br><br>'
	 								+ '<button class="btn btn-primary" style="font-size: 9pt;" data-toggle="modal" '
	 								+ 'data-target="#'+ json.fproject[i].project_id +'">프로젝트 별점 주기</button></td>'
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
	 							+'<a href="" onclick="fModal('+(json.sfproject[i].payment_id).substring(4)+')"'
	 							+'data-toggle="modal" data-target="#fppaymentModal" style="color:black; font-size:11px; text-decoration:underline;">'
	 							+'결제 내역 보기</a></td>'
	 							+'</td>'
	 							+'<td><b>마감일<br>'+json.sfproject[i].end_date+'</b><br><br>'
	 							+ '<button class="btn btn-primary" style="font-size: 9pt;" data-toggle="modal" '
								+ 'data-target="#'+ json.fproject[i].project_id +'">프로젝트 별점 주기</button></td>'
	 							+'</tr>';
	 						} else{
	 							tag+='<tr class="list" name="tt">'
	 								+'<td class="limg">'
	 								+'<img name="img_rename" src="resources/uploadProPreImages/'+decodeURIComponent(json.sfproject[i].image_rename)+'"/>'
	 								+'</td>'
	 								+'<td><b><small>[프로젝트]</small><br><a href="projectDetailView.do?member_id=${loginUser.member_id}&project_id='+json.sfproject[i].project_id+'" style="color:black;">'
	 								+decodeURIComponent(json.sfproject[i].project_name)+'</b></a><br><br>'
	 								+'<a href="" onclick="fModal('+(json.sfproject[i].payment_id).substring(4)+')"'
	 								+'data-toggle="modal" data-target="#fppaymentModal" style="color:black; font-size:11px; text-decoration:underline;">'
	 								+'결제 내역 보기</a></td>'
	 								+'</td>'
	 								+'<td><b>마감일<br>'+json.sfproject[i].end_date+'</b><br><br>'
	 								+ '<button class="btn btn-primary" style="font-size: 9pt;" data-toggle="modal" '
	 								+ 'data-target="#'+ json.sfproject[i].project_id +'">프로젝트 별점 주기</button></td>'
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
function fModal(payment_id){
	var member_id=$('#memberId').val();
	console.log("payment_id: " +payment_id);
	console.log("typeof: "+typeof payment_id)
	console.log(member_id);
	$.ajax({
		url:"fund_payment.do",
		data: {payment_id:payment_id, member_id:member_id},
		dataType:"json",
		type:"post",
		success:function(e){
			var jsonStr = JSON.stringify(e);
			//변환된 문자열을 json 객체로 바꿈
			var json = JSON.parse(jsonStr);
			
			$("#fpmodal").empty();
			
			var value=$("#fpmodal").html();
			value='<hr style="border:0.5px solid black;">'
			for(var i in json.mfproject){
			value+=	'<div><br><div>&nbsp; 선택하신 선물 - '
					+'<b>'+decodeURIComponent(json.mfproject[i].item_name)+' &nbsp;총 '
					+json.mfproject[i].count+'개 </b></div><br>'
			}
			value+='<hr style="border:0.5px solid black"><br><b><i>&nbsp;총 결제금액 : '+json.mfproject[i].total_amount+'   원<br>&nbsp;결제하신 날 : '
			+json.mfproject[i].payment_date+'<i></b>'
			+'</div>'
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

//----------
//jieun 
//별점 모달창 생성
function createStarPointModal(){
	var values = "";
	
	for(var i=0; i<projectIds.length; ++i){
		
		values += '<div class="modal fade" id="'+ projectIds[i] +'">' +
					  '<div class="modal-dialog">' +
					    '<div class="modal-content">' +
					      '<div class="startpoint-projectName-div">'+ projectNames[i] +'</div>' +
					      '<div class="modal-body">' +
					       '<div align="center">' +
					       	'<img class="starpoint1" src="/finalp/resources/images/icon/starpoint.png" ' +
					       		'onmouseover="mouseoverStarPoint('+ projectIds[i] +', 1)" ' + 
					       		'onmouseout="mouseoutStarPoint('+ projectIds[i] +', 1)" ' +
					       		'onclick="mark('+ projectIds[i] +', 1)">' + 
					       	'<img class="starpoint2" src="/finalp/resources/images/icon/starpoint.png" ' +
						       	'onmouseover="mouseoverStarPoint('+ projectIds[i] +', 2)" ' + 
					       		'onmouseout="mouseoutStarPoint('+ projectIds[i] +', 2)"' + 
					       		'onclick="mark('+ projectIds[i] +', 2)">' + 
					       	'<img class="starpoint3" src="/finalp/resources/images/icon/starpoint.png" ' +
						       	'onmouseover="mouseoverStarPoint('+ projectIds[i] +', 3)" ' + 
					       		'onmouseout="mouseoutStarPoint('+ projectIds[i] +', 3)"' + 
					       		'onclick="mark('+ projectIds[i] +', 3)">' + 
					       	'<img class="starpoint4" src="/finalp/resources/images/icon/starpoint.png" ' +
						       	'onmouseover="mouseoverStarPoint('+ projectIds[i] +', 4)" ' + 
					       		'onmouseout="mouseoutStarPoint('+ projectIds[i] +', 4)"' + 
					       		'onclick="mark('+ projectIds[i] +', 4)">' + 
					       	'<img class="starpoint5" src="/finalp/resources/images/icon/starpoint.png" ' +
						       	'onmouseover="mouseoverStarPoint('+ projectIds[i] +', 5)" ' + 
					       		'onmouseout="mouseoutStarPoint('+ projectIds[i] +', 5)"' +
					       		'onclick="mark('+ projectIds[i] +', 5)">' + 
					       	'<div class="starlock" value="0"></div>' +
					       	'<div class="starpoint-value" value="0"></div>' +
					       '</div>' +
					      '</div>' +
					    '</div>' +
					  '</div>' +
					'</div>';
	}
	
	$("#starpoint-div").html(values);
	
	getStarPointList();
}

//locked = 0;
//별점 hover
function mouseoverStarPoint(id, star){
	
	var locked = $("#"+id + " .starlock").attr("value");
	console.log("lock]"+locked);
	if(locked == 1)
		return; 
	
	console.log("yfdfasfa");
	
	for(var i=1; i<=star; ++i){
		var seletor = "#"+id + " .starpoint"+i;
		console.log("over]"+seletor);
		$(seletor).attr("src", "/finalp/resources/images/icon/starpoint2.png");
		//$(seletor).addClass("activestar");
	}
}

//별점 no hover
function mouseoutStarPoint(id, star){
	
	var locked = $("#"+id + " .starlock").attr("value");
	
	if(locked == 1)
		return; 
	
	for(var i=1; i<=star; ++i){
		var seletor = "#"+id + " .starpoint"+i;
		console.log("out]"+seletor);
		$(seletor).attr("src", "/finalp/resources/images/icon/starpoint.png");
		//$(seletor).removeClass("activestar");
	}
}

function lock(id, star){
	mouseoverStarPoint(id, star);
	var locked = $("#"+id + " .starlock").attr("value");
	
	if(locked == 0){
		updateStarPoint(id, star);
	}
	$("#"+id + " .starlock").attr("value", 1);
	$("#"+id + " .starpoint-value").attr("value", star);
	
	
	//locked = 1;
}

function mark(id, star){
	lock(id, star);
	
}

function updateStarPoint(id, star){
	var member_id = $('#memberId').val();
	
	var memberTrust = new Object();
	memberTrust.member_id = member_id;
	memberTrust.project_id = ""+id;
	memberTrust.corn_grade = ""+star;
	
	$.ajax({
		url: "updateMemberTrust.do",
		data: JSON.stringify(memberTrust),
		type: "post",
		async: false,
		contentType: "application/json; charset=UTF-8",
		success: function(){
			console.log("별점 업데이트  성공")
		},
		error: function(request, status, errorData){
			alert("error code: " + request.status + "\n"
					+ "message : " + request.responseText + "\n"
					+ "error : " + errorData);
		}
	}); 
}

//프로젝트별 별점 가져오기
function getStarPointList(){
	var member_id = $('#memberId').val();
	
	$.ajax({
		url: "memberTrustListByMemberId.do",
		type: "post",
		data: {"member_id": member_id},
		dataType: "json",
		success: function(data){
			//리턴된 하나의 객체를 문자열로 변환
			var jsonStr = JSON.stringify(data);
			//변환된 문자열을 json 객체로 변환
			var json = JSON.parse(jsonStr);

			for(var i in json.list){
				mouseoverStarPoint(json.list[i].projectId, json.list[i].cornGrade);
			/* 	console.log("fff]"+json.list[i].projectId);
				console.log("fff44]"+json.list[i].cornGrade); */
			}
			
		},
		error: function(request, status, errorData){
			alert("error code: " + request.status + "\n"
					+ "message : " + request.responseText + "\n"
					+ "error : " + errorData);
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
      <hr>
       
      </div>
    </div>
  </div>
</div>

<style>
	#starpoint-div .modal {
        text-align: center;
	}
	 
	@media screen and (min-width: 768px) { 
	       #starpoint-div .modal:before {
	                display: inline-block;
	                vertical-align: middle;
	                content: " ";
	                height: 100%;
	        }
	}
	 
	#starpoint-div .modal-dialog {
	        display: inline-block;
	        text-align: left;
	        vertical-align: middle;
	}

	#starpoint-div .startpoint-projectName-div{
		align:center;
		padding: 20px 20px 20px 20px;
	}
	
	#starpoint-div .starpoint1,
	#starpoint-div .starpoint2,
	#starpoint-div .starpoint3,
	#starpoint-div .starpoint4,
	#starpoint-div .starpoint5{
		width: 50px;
		height:50px;
	}
</style>

<!-- 별점 모달창 만들 곳 -->
<div id="starpoint-div"></div>

</body>
</html>