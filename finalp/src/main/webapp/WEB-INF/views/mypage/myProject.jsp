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
</style>

</head>
 <body class="skin_main">
<c:import url="../header.jsp"/>
<c:import url="mypageStatusHeader.jsp"/>
<c:import url="mypageStatusSide.jsp"/>
<script type="text/javascript">
	$(window).ready(function(){
		var tag="";
			tag+='<c:forEach var="project" items="${project }" end="2">'
				+'<tr class="list " name="tt">'
				+'<td class="limg">'
				+'<c:if test="${empty project.image_rename }">'
				+'<img name="img_rename" src="resources/images/logo.png"/>'
				+'</c:if>'
				+'<c:if test="${not empty project.image_rename }">'
				+'<img name="img_rename" src="resources/uploadProPreImages/${project.image_rename }"/>'
				+'</c:if>'
				+'</td>'
				+'<td><b><a href="#" style="color:black;">${project.project_name }</b></a></td>'
				+'<td><b>${project.creation_date }</b></td>'
				+'</tr>'
				+'</c:forEach>';
		$('.tbl_type').html(tag);
	});
	 $(window).scroll(function() {
		 if( $(document).height() == ($(window).scrollTop() + $(window).height())) {
			 $.ajax({
				url:"myProject.do",
				dataType:"json",
				type:"get",
				data:{size:3},
				success:function(){
					var json=
				},
				error:
					alert();
			 });
			 
			 
			 
			 var tag="";
				/* tag+='<c:forEach var="project" items="${project }" end="${end+3}">'
					+'<tr class="list " name="tt">'
					+'<td class="limg">'
					+'<c:if test="${empty project.image_rename }">'
					+'<img name="img_rename" src="resources/images/logo.png"/>'
					+'</c:if>'
					+'<c:if test="${not empty project.image_rename }">'
					+'<img name="img_rename" src="resources/uploadProPreImages/${project.image_rename }"/>'
					+'</c:if>'
					+'</td>'
					+'<td><b><a href="#" style="color:black;">${project.project_name }</b></td>'
					+'<td><b>${project.creation_date }</b></td>'
					+'</tr>'
					+'</c:forEach>';
			$('.tbl_type').html(tag);
 */			
			
		}
		 
	}); 

	
</script>
	
	<div id="container">
		<div id="content" class="section_home" >
			<div class="c_header">
				<h2>내가 등록한 프로젝트</h2>
				<p class="contxt">이것 저것 알아볼 수 있어요</p>
			</div>
		</div>
		<div id="list">
		<input type="hidden" value="5" id="bb" name="bb">
		<input type="hidden" value="50" id="aa">
			<table class="tbl_type" cellspacing="0" border="1">
			</table>
		</div>
	</div>
</body>
</html>