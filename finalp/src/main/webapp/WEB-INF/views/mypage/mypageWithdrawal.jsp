<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 탈퇴</title>
<style type="text/css">
	.dtitle {
		width: 145px;
	}
	@media ( max-width : 320px ) and (min-width: 0) {
		.dtitle {
			width: 13%;
		}
	}
	@media ( max-width : 1080px ) and (min-width: 0) {
		.dtitle {
			width: 20%;
		}
	}
	.dropout {
		font-size: 12px;
		margin-top: 59px;
		margin-bottom: 0 !important;
		padding-left: 13px;
		color: #333;
	}
	
	.btn0{
		width:80px;
		height:40px;
		text-align:center;
	    background-color: #f5f6f8;
	    color: gray;
	    border: 2px solid #F7D358; 
	    -webkit-transition-duration: 0.4s;
   		transition-duration: 0.4s;
   		font-size:14px;
   		font-family: NanumGothic, 'Malgun Gothic', Dotum, Helvetica,
		'Apple SD GothicNeo', Sans-serif;
   		line-hieght:10px;
   		font-weight:bold;
	}
</style>
<script type="text/javascript">
	function agreeCheck(chk){
	   	if (chk.checked==true){
	   		$('.btn0').attr("disabled", false);
	    	$('.btn0').css("background-color","#F7D358");
	    	$('.btn0').css("color", "white");
		}else{
			$('.btn0').attr("disabled", true);
	    	$('.btn0').css("background-color","#f5f6f8");
	    	$('.btn0').css("color", "gray");
		}
	}
</script>
</head>
<body class="skin_main">
<c:import url="../header.jsp"/>
<c:import url="mypageIndexHeader.jsp"/>
  <div id="container">
 	 <div id="content">
  		<div class="c_header">
			<h2>탈퇴 안내</h2>
			<p class="contxt" style="font-size:12px">정말 탈퇴 하시려고요?<br>회원탈퇴를 진행하기 전에 아래의 안내 사항을 꼭 확인해주세요.</p>
		</div>
		<div class="section_delete">
			<ul>
				<li class="dropout"><b>탈퇴 후 회원님의 <s>개인정보는 모두 삭제 처리</s> 됩니다.</b></li>
				<li class="dropout_dsc">현재 등록한 프로젝트나 공동구매 상품이 있다면 1:1문의를 통해 문의 후 회원 탈퇴를 진행해주시기 바랍니다.</li>
			</ul>
			<table class="tbl_type" cellspacing="0" border="1">
				<tr><th class="dtitle">회원정보</th><td>아이디, 비밀번호, 이메일, 이름, 계좌와 관련된 모든 정보</td></tr>
				<tr><th class="dtitle">프로젝트</th><td>등록한 프로젝트, 펀딩중인 프로젝트, 찜한 프로젝트</td></tr>
				<tr><th class="dtitle">공동구매</th><td>등록한 공동구매 상품, 구매한 공동구매 상품, 찜한 공동구매 상품</td></tr>
			</table>
			
			<div class="dropout_agree_area">
				<ul>
					<li class="dropout"><label><input type="checkbox" onClick="agreeCheck(this)" ><b>&nbsp;위의 유의사항을 모두 확인하였으며, 이에 동의하고 회원 탈퇴 절차를 진행합니다.</b></label></li>
					<li style="margin-top:3%; margin-left:40%">
					<a data-toggle="modal" data-target="#deleteMember-modal">
					<input name="checkButton" type="submit" value="탈퇴하기" class="btn0" disabled>
					</a>
					</li>
				</ul>
			</div>
		</div>
 	 </div>
  </div>
  <div class="modal fade" id="deleteMember-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="static" style="display: none; z-index:9999;">
	 	<div class="modal-dialog">
			<div class="loginmodal-container">
				<a data-dismiss="modal" style="margin-left:90%;"><i class="xi-close-thin xi-2x" onclick="location.href='/doubleb/index.jsp'"></i></a>
				<h1>정말 탈퇴하시나요?</h1><br>
			 	<form action="mDelete.do" method="post" id="deleteMember">
			 		<input type="hidden" name="member_id" value='${loginUser.member_id }'/>
					<input type="password" name="member_pwd" placeholder="비밀번호를 입력해주세요.">
					<input type="submit" name="login" class="login loginmodal-submit" value="탈퇴">
			  	</form>
			  	<p>'탈퇴' 버튼을 누르면 되돌릴 수 없습니다.<br>
					신중히 생각 후 결정하세요!</p>
			</div>
		</div>
	</div>
</body>
</html>