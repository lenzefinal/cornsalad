<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>등록한 공동구매</title>
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
 <body class="skin_main" >
<c:import url="mypageStatusHeader.jsp"/>
<c:import url="mypageStatusSide.jsp"/>
<script type="text/javascript">
var size=4;
	$(window).ready(function(){
		var member_id=$('#memberId').val();

		$.ajax({
			url:"myProductList.do",
			data:{"size":size, "member_id": member_id},
			dataType:"json",
			type:"post",
			success:function(e){
				var jsonStr=JSON.stringify(e);
				var json=JSON.parse(jsonStr); 
				var tag="";
				if(json.product[0]!=null){
				for(var i=0;i<json.product.length;i++){
					if(json.product[i].image_rename==null){
					tag+='<tr class="list" name="tt">'
						+'<td class="limg">'
						+'<img name="img_rename" src="resources/images/logo.png"/>'
						+'</td>'
						+'<td><b><small>[공동구매]</small><br><a href="${projectDetail}" style="color:black;">'
						+decodeURIComponent(json.product[i].project_name)+'</b></a></td>'
						+'<td><b><small>등록일</small><br>'+json.product[i].creation_date+'<br><br>마감일<br>'+json.product[i].end_date+'</b></td>'
						+'</tr>';
					} else{
						tag+='<tr class="list" name="tt">'
							+'<td class="limg">'
							+'<img name="img_rename" src="resources/uploadProPreImages/'+decodeURIComponent(json.product[i].image_rename)+'"/>'
							+'</td>'
							+'<c:url var="projectDetail" value="projectDetailView.do">'
							+'<c:param name="member_id" value="${loginUser.member_id }"/>'
							+'<c:param name="project_id" value=""/>'
							+'</c:url>'
							+'<td><b><small>[공동구매]</small><br><a href="${projectDetail}" style="color:black;">'
							+decodeURIComponent(json.product[i].project_name)+'</b></a></td>'
							+'<td><b><small>등록일</small><br>'+json.product[i].creation_date+'<br><br>마감일<br>'+json.product[i].end_date+'</b></td>'
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
				url:"searchmyproduct.do",
				dataType:"json",
				data:{"size":size, "member_id":member_id,"project_name":project_name},
				type:"post",
				success:function(e){
					var jsonStr=JSON.stringify(e);
					var json=JSON.parse(jsonStr); 
					var tag="";
					for(var i=0;i<json.smproduct.length;i++){
						if(json.smproduct[i].image_rename==null){
						tag+='<tr class="list" name="tt">'
							+'<td class="limg">'
							+'<img name="img_rename" src="resources/images/logo.png"/>'
							+'</td>'
							+'<c:url var="projectDetail" value="projectDetailView.do">'
							+'<c:param name="member_id" value="${loginUser.member_id }"/>'
							+'<c:param name="project_id" value=""/>'
							+'</c:url>'
							+'<td><b><small>[공동구매]</small><br><a href="${projectDetail}" style="color:black;">'
							+decodeURIComponent(json.smproduct[i].project_name)+'</b></a></td>'
							+'<td><b><small>등록일</small><br>'+json.smproduct[i].creation_date+'<br><br>마감일<br>'
							+json.smproject[i].end_date+'</b></td>'
							+'</tr>';
						} else{
							tag+='<tr class="list" name="tt">'
								+'<td class="limg">'
								+'<img name="img_rename" src="resources/uploadProPreImages/'+decodeURIComponent(json.smproduct[i].image_rename)+'"/>'
								+'</td>'
								+'<c:url var="projectDetail" value="projectDetailView.do">'
								+'<c:param name="member_id" value="${loginUser.member_id }"/>'
								+'<c:param name="project_id" value=""/>'
								+'</c:url>'
								+'<td><b><small>[공동구매]</small><br><a href="${projectDetail}" style="color:black;">'
								+decodeURIComponent(json.smproduct[i].project_name)+'</b></a></td>'
								+'<td><b><small>등록일</small><br>'+json.smproduct[i].creation_date
								+'<br><br><small>마감일</small><br>'+json.smproduct[i].end_date+'</b></td>'
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
	
	 $(window).scroll(function() {
		 var member_id=$('#memberId').val();
		 var project_name=$('#project_name').val();
		 console.log("구분자");
		 console.log($(window).scrollTop());
		 console.log($(document).height()-$(window).height());
		 	if($(window).scrollTop()>=$(document).height()-$(window).height()-2 ){
		 	if(project_name==null){
			 $.ajax({
				url:"myProductList.do",
				data:{"size":Number(size), "member_id":member_id},
				dataType:"json",
				type:"post",
				success:function(e){
					var jsonStr=JSON.stringify(e);
					var json=JSON.parse(jsonStr); 
					var tag="";
					for(var i=0;i<json.product.length;i++){
						if(json.product[i].image_rename==null){
						tag+='<tr class="list" name="tt">'
							+'<td class="limg">'
							+'<img name="img_rename" src="resources/images/logo.png"/>'
							+'</td>'
							+'<c:url var="projectDetail" value="projectDetailView.do">'
							+'<c:param name="member_id" value="${loginUser.member_id }"/>'
							+'<c:param name="project_id" value=""/>'
							+'</c:url>'
							+'<td><b><small>[공동구매]</small><br><a href="${projectDetail}" style="color:black;">'
							+decodeURIComponent(json.product[i].project_name)+'</b></a></td>'
							+'<td><b><small>등록일</small><br>'+json.smproduct[i].creation_date
							+'<br><br><small>마감일</small><br>'+json.smproduct[i].end_date+'</b></td>'
							+'</tr>';
						} else{
							tag+='<tr class="list" name="tt">'
								+'<td class="limg">'
								+'<img name="img_rename" src="resources/uploadProPreImages/'+decodeURIComponent(json.product[i].image_rename)+'"/>'
								+'</td>'
								+'<c:url var="projectDetail" value="projectDetailView.do">'
								+'<c:param name="member_id" value="${loginUser.member_id }"/>'
								+'<c:param name="project_id" value=""/>'
								+'</c:url>'
								+'<td><b><small>[공동구매]</small><br><a href="${projectDetail}" style="color:black;">'
								+decodeURIComponent(json.product[i].project_name)+'</b></a></td>'
								+'<td><b><small>등록일</small><br>'+json.smproduct[i].creation_date
								+'<br><br><small>마감일</small><br>'+json.smproduct[i].end_date+'</b></td>'
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
		 	} else {
		 		$.ajax({
					url:"searchmyproduct.do",
					dataType:"json",
					data:{"size":size, "member_id":member_id,"project_name":project_name},
					type:"post",
					success:function(e){
						var jsonStr=JSON.stringify(e);
						var json=JSON.parse(jsonStr); 
						var tag="";
						for(var i=0;i<json.smproduct.length;i++){
							if(json.smproduct[i].image_rename==null){
							tag+='<tr class="list" name="tt">'
								+'<td class="limg">'
								+'<img name="img_rename" src="resources/images/logo.png"/>'
								+'</td>'
								+'<c:url var="projectDetail" value="projectDetailView.do">'
								+'<c:param name="member_id" value="${loginUser.member_id }"/>'
								+'<c:param name="project_id" value=""/>'
								+'</c:url>'
								+'<td><b><small>[공동구매]</small><br><a href="${projectDetail}" style="color:black;">'
								+decodeURIComponent(json.smproduct[i].project_name)+'</b></a></td>'
								+'<td><b><small>등록일</small><br>'+json.smproduct[i].creation_date
								+'<br><br><small>마감일</small><br>'+json.smproduct[i].end_date+'</b></td>'
								+'</tr>';
							} else{
								tag+='<tr class="list" name="tt">'
									+'<td class="limg">'
									+'<img name="img_rename" src="resources/uploadProPreImages/'+decodeURIComponent(json.smproduct[i].image_rename)+'"/>'
									+'</td>'
									+'<c:url var="projectDetail" value="projectDetailView.do">'
									+'<c:param name="member_id" value="${loginUser.member_id }"/>'
									+'<c:param name="project_id" value=""/>'
									+'</c:url>'
									+'<td><b><small>[공동구매]</small><br><a href="${projectDetail}" style="color:black;">'
									+decodeURIComponent(json.smproduct[i].project_name)+'</b></a></td>'
									+'<td><b><small>등록일</small><br>'+json.smproduct[i].creation_date
									+'<br><br><small>마감일</small><br>'+json.smproduct[i].end_date+'</b></td>'
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
		}); 
	}); 
	
	
</script>
	
	<div id="container">
		<div id="content" class="section_home" >
			<input type="hidden" id="memberId" value="${loginUser.member_id }"/>
			
			<div class="c_header">
				<h2>내가 등록한 공동구매</h2>
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
</body>
</html>