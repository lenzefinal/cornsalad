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
<c:import url="../header.jsp"/>
<c:import url="mypageStatusHeader.jsp"/>
<c:import url="mypageStatusSide.jsp"/>
<script type="text/javascript">
var size=4;

	$(window).ready(function(){
		var member_id=$('#memberId').val();
		var project_name=$('#project_name').val();
		$.ajax({
			url:"purchaseProductList.do",
			data:{"size":size, "member_id": member_id},
			dataType:"json",
			type:"post",
			success:function(e){
				var jsonStr=JSON.stringify(e);
				var json=JSON.parse(jsonStr); 
				var tag="";
				if(json.pproduct[0]!=null){
				for(var i=0;i<json.pproduct.length;i++){
					if(json.pproduct[i].image_rename==null){
					tag+='<tr class="list" name="tt">'
						+'<td class="limg">'
						+'<img name="img_rename" src="resources/images/logo.png"/>'
						+'</td>'
						+'<c:url var="projectDetail" value="projectDetailView.do">'
						+'<c:param name="member_id" value="${loginUser.member_id }"/>'
						+'<c:param name="project_id" value="${project.project_id }"/>'
						+'</c:url>'
						+'<td><b><small>[공동구매]</small><br><a href="${projectDetail}" style="color:black;">'
						+decodeURIComponent(json.pproduct[i].project_name)
						+'</a><br><small>결제 상품: '+decodeURIComponent(json.pproduct[i].product_name)+'</small><br>'
						+'<small>결제 금액: '+json.pproduct[i].total_amount+'</small></b></td>'
						+'<td><b><small>결제일</small><br>'+json.pproduct[i].payment_date
						+'<br><br><small>마감일</small><br>'+json.pproduct[i].end_date+'</b></td>'
						+'</tr>';
					} else{
						tag+='<tr class="list" name="tt">'
							+'<td class="limg">'
							+'<img name="img_rename" src="resources/uploadProPreImages/'+decodeURIComponent(json.pproduct[i].image_rename)+'"/>'
							+'</td>'
							+'<c:url var="projectDetail" value="projectDetailView.do">'
							+'<c:param name="member_id" value="${loginUser.member_id }"/>'
							+'<c:param name="project_id" value="${project.project_id }"/>'
							+'</c:url>'
							+'<td><b><small>[공동구매]</small><br><a href="${projectDetail}" style="color:black;">'
							+decodeURIComponent(json.pproduct[i].project_name)
							+'</a><br><small>결제 상품: '+decodeURIComponent(json.pproduct[i].product_name)+'</small><br>'
							+'<small>결제 금액: '+json.pproduct[i].total_amount+'</small></b></td>'
							+'<td><b><small>결제일</small><br>'+json.pproduct[i].payment_date
							+'<br><br><small>마감일</small><br>'+json.pproduct[i].end_date+'</b></td>'
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
			 var size=4;
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
							+decodeURIComponent(json.spproduct[i].project_name)+'</b></a></td>'
							+'<td><b><small>결제일</small><br>'+json.spproduct[i].payment_date
							+'<br><br><small>마감일</small><br>'+json.spproduct[i].end_date+'</b></td>'
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
								+decodeURIComponent(json.spproduct[i].project_name)+'</b></a></td>'
								+'<td><b><small>결제일</small><br>'+json.spproduct[i].payment_date
								+'<br><br><small>마감일</small><br>'+json.spproduct[i].end_date+'</b></td>'
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
			
		 	if($(window).scrollTop()>=$(document).height()-$(window).height()-2 ){
			if(project_name==null){
			 $.ajax({
				url:"purchaseProductList.do",
				data:{"size":Number(size), "member_id":member_id},
				dataType:"json",
				type:"post",
				success:function(e){
					var jsonStr=JSON.stringify(e);
					var json=JSON.parse(jsonStr); 
					var tag="";
					for(var i=0;i<json.pproduct.length;i++){
						if(json.pproduct[i].image_rename==null){
						tag+='<tr class="list" name="tt">'
							+'<td class="limg">'
							+'<img name="img_rename" src="resources/images/logo.png"/>'
							+'</td>'
							+'<c:url var="projectDetail" value="projectDetailView.do">'
							+'<c:param name="member_id" value="${loginUser.member_id }"/>'
							+'<c:param name="project_id" value="${project.project_id }"/>'
							+'</c:url>'
							+'<td><b><small>[공동구매]</small><br><a href="${projectDetail}" style="color:black;">'
							+decodeURIComponent(json.pproduct[i].project_name)
							+'</a><br><small>결제 상품: '+decodeURIComponent(json.pproduct[i].product_name)+'</small><br>'
							+'<small>결제 금액: '+json.pproduct[i].total_amount+'</small></b></td>'
							+'<td><b><small>결제일</small><br>'+json.pproduct[i].payment_date
							+'<br><br><small>마감일</small><br>'+json.pproduct[i].end_date+'</b></td>'
							+'</tr>';
						} else{
							tag+='<tr class="list" name="tt">'
								+'<td class="limg">'
								+'<img name="img_rename" src="resources/uploadProPreImages/'+decodeURIComponent(json.pproduct[i].image_rename)+'"/>'
								+'</td>'
								+'<c:url var="projectDetail" value="projectDetailView.do">'
								+'<c:param name="member_id" value="${loginUser.member_id }"/>'
								+'<c:param name="project_id" value="${project.project_id }"/>'
								+'</c:url>'
								+'<td><b><small>[공동구매]</small><br><a href="${projectDetail}" style="color:black;">'
								+decodeURIComponent(json.pproduct[i].project_name)
								+'</a><br><small>결제 상품: '+decodeURIComponent(json.pproduct[i].product_name)+'</small><br>'
								+'<small>결제 금액: '+json.pproduct[i].total_amount+'</small></b></td>'
								+'<td><b><small>결제일</small><br>'+json.pproduct[i].payment_date
								+'<br><br><small>마감일</small><br>'+json.pproduct[i].end_date+'</b></td>'
								+'</tr>';
						}
						 size++;
					}
					$('.tbl_type').html(tag);
					$('#checksize').val(Number(size));
					
				},
				error: function(request, status, errorData) {
					alert("에러코드: " + request.status + "\n" + "메세지: "
							+ request.responseText + "\n" + "에러: "
							+ errorData);
				}
			 });
	 	}
	 }else{
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
						+decodeURIComponent(json.spproduct[i].project_name)+'</b></a></td>'
						+'<td><b><small>결제일</small><br>'+json.spproduct[i].payment_date
						+'<br><br><small>마감일</small><br>'+json.spproduct[i].end_date+'</b></td>'
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
							+decodeURIComponent(json.spproduct[i].project_name)+'</b></a></td>'
							+'<td><b><small>결제일</small><br>'+json.spproduct[i].payment_date
							+'<br><br><small>마감일</small><br>'+json.spproduct[i].end_date+'</b></td>'
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
	 	}
	}); 
	
	
</script>
	
	<div id="container">
		<div id="content" class="section_home" >
			<input type="hidden" id="memberId" value="${loginUser.member_id }"/>
			
			<div class="c_header">
				<h2>구매한 공동구매 상품</h2>
				<p class="contxt">이것 저것 알아볼 수 있어요</p>
			</div>
		</div>
		<div id="list">
			<input type="text" name="project_name" id="project_name" placeholder="프로젝트 명으로 검색"/>
			<table class="tbl_type" cellspacing="0" border="1">
			</table>
		</div>
		<div id="load" class="display-none" style="text-align:center;"><img src="resources/images/loadImg.gif" style="width:20%; height:20%;"></div>
		<div id="result" style="text-align:center;"></div>
	</div>
</body>
</html>