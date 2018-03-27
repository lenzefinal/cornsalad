<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html >
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
th {
	background: #999;
	width: 20%;
}
img{
	weight : 100%;
	height : auto;
}
.mce-notification-warning{
 	display:none;
 }
</style>
  <script src='https://cloud.tinymce.com/stable/tinymce.min.js'></script>
  <script type="text/javascript" src="/finalp/resources/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	tinymce.init({
		  selector: '#tarea',
	      height: 500,
	  	  plugins: [
	    	    "advlist autolink lists link image charmap print preview anchor",
	        	"searchreplace visualblocks code fullscreen",
	        	"insertdatetime media table contextmenu paste imagetools wordcount"
	    	],
	    	toolbar: "insertfile undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link image",
	  	// imagetools_cors_hosts: ['www.tinymce.com', 'codepen.io'],
	  	content_css: [
		    '//fonts.googleapis.com/css?family=Lato:300,300i,400,400i',
	    	'//www.tinymce.com/css/codepen.min.css'
	  	],
	  	 // without images_upload_url set, Upload tab won't show up
	    images_upload_url: 'postAcceptor.php',
	    
	    // we override default upload handler to simulate successful upload
	    images_upload_handler: function (blobInfo, success, failure) {
	    	var form = new FormData();
	    	form.append('uploadFile',blobInfo.blob());
	    	$.ajax({
	    		url : "bimg.do",
	    		data : form,
	    		dataType : 'text',
	    		type : "post",
	    		processData: false,
	        	contentType: false,
	    		success : function(result){
	    			success(result);		
	    		}
	    	});
	    }
	});
	
</script>
</head>
<body>
	<c:import url="/WEB-INF/views/header.jsp" />

	<div class="container" style="margin-top: 5%">
		<div>
			<div class="col-lg-2"></div>
			<div class="col-lg-10">
				<h2>게시글 쓰기</h2>
			</div>
			<div class="col-lg-10">
				<form action="binsert.do" method="post"
					enctype="multipart/form-data">
					<table id="dt_basic" class="table table-bordered ">
						<tr>
							<th>제목</th>
							<td><input type="text" name="title"></td>
						</tr>
						<tr>
							<th>작성자</th>
							<td><input type="text" name="member_id"
								value="${loginUser.member_id}" readonly></td>
						</tr>
						<tr>
							<th>종 류</th>
							<td><input type="radio" name="board_category_id"
								value="BCA-STU">지식 나눔
							<input type="radio" name="board_category_id"
								value="BCA-PRO">물품 나눔</td>
						</tr>
						<tr>
							<th>첨부 파일</th>
							<td><input type="file" name="uploadFile"></td>
						</tr>
						<tr>
							<th>내 용</th>
							<td>
							<div class="myeditabletable">
							<textarea rows="40" cols="100" name="content" id = "tarea"></textarea>
							</div>
							</td>
						</tr>
						<tr>
							<td colspan="2"><input type="submit" value="등록하기"></td>
						</tr>

					</table>
				</form>
				<hr />
				<div id="buttoncontrill">
					<a href="javascript:history.back()">[목록으로]</a>
				</div>
			</div>
		</div>
	</div>
</body>
</html>