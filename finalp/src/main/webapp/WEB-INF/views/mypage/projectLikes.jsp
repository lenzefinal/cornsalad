<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>찜한 프로젝트 목록 보기</title>
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
	div.display-none{
		display:none;
	}
</style>
</head>
 <body class="skin_main" >
<c:import url="mypageLikesHeader.jsp"/>
<c:import url="mypageLikesSide.jsp"/>

<script type="text/javascript">
var size=4;

$(window).ready(function(){
	var member_id=$('#memberId').val();
	var lpj_name=$('#lpj_name').val();
	$.ajax({
		url:"lProjectList.do",
		data:{"size":size, "member_id": member_id},
		dataType:"json",
		type:"post",
		success:function(e){
			var jsonStr=JSON.stringify(e);
			var json=JSON.parse(jsonStr); 
			var tag="";
			if(json.lproject[0]!=null){
			for(var i=0;i<json.lproject.length;i++){
				if(json.lproject[i].image_rename==null){
				tag+='<tr class="list" name="tt">'
					+'<td class="limg">'
					+'<img name="img_rename" src="resources/images/logo.png"/>'
					+'</td>'
					+'<td><b><small>[프로젝트]</small><br><a href="projectDetailView.do?member_id=${loginUser.member_id}&project_id='+json.lproject[i].project_id+'" style="color:black;">'+decodeURIComponent(json.lproject[i].project_name)+'</b></a></td>'
					+'<td><b><small>등록일</small><br>'+json.lproject[i].creation_date
					+'<br><br><small>마감일</small><br>'+json.lproject[i].end_date+'</b></td>'
					+'</tr>';
				} else{
					tag+='<tr class="list" name="tt">'
						+'<td class="limg">'
						+'<img name="img_rename" src="resources/uploadProPreImages/'+decodeURIComponent(json.lproject[i].image_rename)+'"/>'
						+'</td>'
						+'<td><b><small>[프로젝트]</small><br><a href="projectDetailView.do?member_id=${loginUser.member_id}&project_id='+json.lproject[i].project_id+'" style="color:black;">'+decodeURIComponent(json.lproject[i].project_name)+'</b></a></td>'
						+'<td><b><small>등록일</small><br>'+json.lproject[i].creation_date
						+'<br><br><small>마감일</small><br>'+json.lproject[i].end_date+'</b></td>'
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
	$('#lpj_name').keyup(function(){
		 var size=4;
		 var member_id=$('#memberId').val();
		 var lpj_name=$('#lpj_name').val();
		$.ajax({
			url:"searchprojectlikes.do",
			dataType:"json",
			data:{"size":size, "member_id":member_id,"project_name":lpj_name},
			type:"post",
			success:function(e){
				var jsonStr=JSON.stringify(e);
				var json=JSON.parse(jsonStr); 
				var tag="";
				for(var i=0;i<json.slproject.length;i++){
					if(json.slproject[i].image_rename==null){
					tag+='<tr class="list" name="tt">'
						+'<td class="limg">'
						+'<img name="img_rename" src="resources/images/logo.png"/>'
						+'</td>'
						+'<td><b><small>[프로젝트]</small><br><a href="projectDetailView.do?member_id=${loginUser.member_id}&project_id='+json.slproject[i].project_id+'" style="color:black;">'+decodeURIComponent(json.slproject[i].project_name)+'</b></a></td>'
						+'<td><b><small>등록일</small><br>'+json.slproject[i].creation_date
						+'<br><br><small>마감일</small><br>'+json.slproject[i].end_date+'</b></td>'
						+'</tr>';
					} else{
						tag+='<tr class="list" name="tt">'
							+'<td class="limg">'
							+'<img name="img_rename" src="resources/uploadProPreImages/'+decodeURIComponent(json.slproject[i].image_rename)+'"/>'
							+'</td>'
							+'</td>'
							+'<td><b><small>[프로젝트]</small><br><a href="projectDetailView.do?member_id=${loginUser.member_id}&project_id='+json.slproject[i].project_id+'" style="color:black;">'+decodeURIComponent(json.slproject[i].project_name)+'</b></a></td>'
							+'<td><b><small>등록일</small><br>'+json.slproject[i].creation_date
							+'<br><br><small>마감일</small><br>'+json.slproject[i].end_date+'</b></td>'
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
	 var lpj_name=$('#lpj_name').val();
	 console.log("구분자");
	 console.log($(window).scrollTop());
	 console.log($(document).height()-$(window).height());
	 	if($(window).scrollTop()>=$(document).height()-$(window).height()-2 ){
	 	if(project_name==null){
		 $.ajax({
				url:"lProjectList.do",
				data:{"size":Number(size), "member_id":member_id},
				dataType:"json",
				type:"post",
				success:function(e){
					var jsonStr=JSON.stringify(e);
					var json=JSON.parse(jsonStr); 
					var tag="";
					for(var i=0;i<json.lproject.length;i++){
						if(json.lproject[i].image_rename==null){
						tag+='<tr class="list" name="tt">'
							+'<td class="limg">'
							+'<img name="img_rename" src="resources/images/logo.png"/>'
							+'</td>'
							+'</td>'
							+'<td><b><small>[프로젝트]</small><br><a href="projectDetailView.do?member_id=${loginUser.member_id}&project_id='+json.lproject[i].project_id+'" style="color:black;">'+decodeURIComponent(json.slproject[i].project_name)+'</b></a></td>'
							+'<td><b><small>등록일</small><br>'+json.lproject[i].creation_date
							+'<br><br><small>마감일</small><br>'+json.lproject[i].end_date+'</b></td>'
							+'</tr>';
						} else{
							tag+='<tr class="list" name="tt">'
								+'<td class="limg">'
								+'<img name="img_rename" src="resources/uploadProPreImages/'+decodeURIComponent(json.slproject[i].image_rename)+'"/>'
								+'</td>'
								+'<td><b><small>[프로젝트]</small><br><a href="projectDetailView.do?member_id=${loginUser.member_id}&project_id='+json.lproject[i].project_id+'" style="color:black;">'+decodeURIComponent(json.slproject[i].project_name)+'</b></a></td>'
								+'<td><b><small>등록일</small><br>'+json.lproject[i].creation_date
								+'<br><br><small>마감일</small><br>'+json.lproject[i].end_date+'</b></td>'
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
	 	}else{
	 		$.ajax({
				url:"searchprojectlikes.do",
				dataType:"json",
				data:{"size":size, "member_id":member_id,"project_name":lpj_name},
				type:"post",
				success:function(e){
					var jsonStr=JSON.stringify(e);
					var json=JSON.parse(jsonStr); 
					var tag="";
					for(var i=0;i<json.slproject.length;i++){
						if(json.slproject[i].image_rename==null){
						tag+='<tr class="list" name="tt">'
							+'<td class="limg">'
							+'<img name="img_rename" src="resources/images/logo.png"/>'
							+'</td>'
							+'<td><b><small>[프로젝트]</small><br><a href="projectDetailView.do?member_id=${loginUser.member_id}&project_id='+json.slproject[i].project_id+'" style="color:black;">'+decodeURIComponent(json.slproject[i].project_name)+'</b></a></td>'
							+'<td><b><small>등록일</small><br>'+json.slproject[i].creation_date
							+'<br><br><small>마감일</small><br>'+json.slproject[i].end_date+'</b></td>'
							+'</tr>';
						} else{
							tag+='<tr class="list" name="tt">'
								+'<td class="limg">'
								+'<img name="img_rename" src="resources/uploadProPreImages/'+decodeURIComponent(json.slproject[i].image_rename)+'"/>'
								+'</td>'
								+'<td><b><small>[프로젝트]</small><br><a href="projectDetailView.do?member_id=${loginUser.member_id}&project_id='+json.slproject[i].project_id+'" style="color:black;">'+decodeURIComponent(json.slproject[i].project_name)+'</b></a></td>'
								+'<td><b><small>등록일</small><br>'+json.slproject[i].creation_date
								+'<br><br><small>마감일</small><br>'+json.slproject[i].end_date+'</b></td>'
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
				<h2>찜한 프로젝트</h2>
				<p class="contxt">내가 찜한 프로젝트를 확인할 수 있어요.</p>
			</div>
		</div>
		<div id="list">
			<input type="text" style="margin-left:2%" id="lpj_name" name="project_name" placeholder="제목으로 검색"/>
			<table class="tbl_type" cellspacing="0" border="1">
			</table>
		</div>
		<div id="result" style="text-align:center;"></div>
	</div>
</body>
</html>