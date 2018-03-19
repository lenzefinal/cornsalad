<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 현황보기</title>

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
		$.ajax({
			url:"myProjectList.do",
			data:{"size":size, "member_id": member_id},
			dataType:"json",
			type:"post",
			success:function(e){
				var jsonStr=JSON.stringify(e);
				var json=JSON.parse(jsonStr); 
				var tag="";
				for(var i=0;i<json.project.length;i++){
					if(json.project[i].image_rename==null){
					tag+='<tr class="list" name="tt">'
						+'<td class="limg">'
						+'<img name="img_rename" src="resources/images/logo.png"/>'
						+'</td>'
						+'<td><b><a href="#" style="color:black;">'+decodeURIComponent(json.project[i].project_name)+'</b></a></td>'
						/* +'<td><b>${project.creation_date }</b></td>' */
						+'</tr>';
					} else{
						tag+='<tr class="list" name="tt">'
							+'<td class="limg">'
							+'<img name="img_rename" src="resources/uploadProPreImages/'+decodeURIComponent(json.project[i].image_rename)+'"/>'
							+'</td>'
							+'<td><b><a href="#" style="color:black;">'+decodeURIComponent(json.project[i].project_name)+'</b></a></td>'
							/* +'<td><b>${project.creation_date }</b></td>' */
							+'</tr>';
					}
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
		 console.log("구분자");
		 console.log($(window).scrollTop());
		 console.log($(document).height()-$(window).height());
		 setTimeout(function(){
			
		 	if($(window).scrollTop()>=$(document).height()-$(window).height()-2 ){
			
			 $.ajax({
					url:"myProjectList.do",
					data:{"size":Number(size), "member_id":member_id},
					dataType:"json",
					type:"post",
					success:function(e){
						var jsonStr=JSON.stringify(e);
						var json=JSON.parse(jsonStr); 
						var tag="";
						for(var i=0;i<json.project.length;i++){
							if(json.project[i].image_rename==null){
							tag+='<tr class="list" name="tt">'
								+'<td class="limg">'
								+'<img name="img_rename" src="resources/images/logo.png"/>'
								+'</td>'
								+'<td><b><a href="#" style="color:black;">'+decodeURIComponent(json.project[i].project_name)+'</b></a></td>'
								/* +'<td><b>${project.creation_date }</b></td>' */
								+'</tr>';
							} else{
								tag+='<tr class="list" name="tt">'
									+'<td class="limg">'
									+'<img name="img_rename" src="resources/uploadProPreImages/'+decodeURIComponent(json.project[i].image_rename)+'"/>'
									+'</td>'
									+'<td><b><a href="#" style="color:black;">'+decodeURIComponent(json.project[i].project_name)+'</b></a></td>'
									/* +'<td><b>${project.creation_date }</b></td>' */
									+'</tr>';
							}
						}
						$('.tbl_type').html(tag);
						$('#checksize').val(Number(size));
						
					},
					complete:function(){
						$('#load').addClass('display-none');
					},
					error: function(request, status, errorData) {
						alert("에러코드: " + request.status + "\n" + "메세지: "
								+ request.responseText + "\n" + "에러: "
								+ errorData);
					}
				 });
		 	}
		 	 size=size+3;
		 	 $('#load').removeClass('display-none');
		 	
		 }, 500);
		
	}); 
	
	
</script>
	
	<div id="container">
		<div id="content" class="section_home" >
			<input type="hidden" id="memberId" value="${loginUser.member_id }"/>
			<div class="c_header">
				<h2>내가 등록한 프로젝트</h2>
				<p class="contxt">이것 저것 알아볼 수 있어요</p>
			</div>
		</div>
		<div id="list">
			<table class="tbl_type" cellspacing="0" border="1">
			</table>
		</div>
		<div id="load" class="display-none" style="text-align:center;"><img src="resources/images/loadImg.gif" style="width:20%; height:20%;"></div>
	</div>
</body>
</html>