<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>



<script>

</script>

</head>
<body>
<c:import url="../header.jsp"></c:import>

<link rel="stylesheet" href="/finalp/resources/css/paymentStyle.css" />
<script type="text/javascript" src="/finalp/resources/js/paymentScript.js"></script>

<div class="reward-body">

<div class="wpurchase-title">
				<table id="reward-title">
				<tr>
				<td id="back"><a href="#"><img src="/finalp/resources/images/paymentimages/left-arrow2.png" height="20" width="20"> &nbsp; <span>스토리로 돌아가기</span></a></td>
				<td id="reward-name">${ p.project_name }</td>
				<td id="seller">
				<h4><img class="img_round" src="resources/images/mypageProfiles/${ p.profile_img_rename }" /> &nbsp; ${ p.member_name }</h4></td>
				</tr>
				</table>
    		</div>
    	
    		<div class="wpurchase-wrap">
    			<div class="wpurchase-step">
    				<ol>
    					<li><em>물품<br />선택</em></li>
    					<li><em>결제 하기</em></li>
    					<li class="active"><em>소문내기</em></li>    					
    				</ol>
    			</div>

		<div class="wpurchase-result-wrap">
	    			<div class="wpurchase-result">
	    				<div class="result-box">
	    					<p><strong>${ m.member_name }님,</strong></p>
	    					<p>공동구매에 참여해주셔서 참 감사합니다!</p>
	    				</div>
	    			</div>
	    			<div class="wpurchase-share">
	    				<p class="title">자 이제, 소문낼 차례!</p>
	    				<p>${ m.member_name }님이 공유해주시는 소식이 널리퍼져 이 공동구매의 성공에 아주 크게 기여할 수 있습니다.</p>
	    				<ul class="share-list">
	    					<li>
	    						<p>댓글로 메이커 응원하기</p>
	    						<a href="댓글이동?projet_id='${ p.project_id }'" class="comment">댓글 남기기</a>
	    					</li>
	    				</ul>
	    			</div>
	    			
	    			<div class="wpurchase-notice center">
	    				<p class="title">콘샐러드 공동구매는 선 결제,후 배송 시스템을 이용합니다.</p>
	    				<div class="inner-rdbox">
		    				<ul>
								<li>프로젝트 성공 후, 잔액 부족으로 인한 취소와 같은 불상사를 예방하기 위해 선 결제 시스템을 이용합니다.</li>
								<li>프로젝트 종료일의 다음 영업일에 펀딩 성공여부에 따라 결제취소/배송시작이 진행됩니다.</li>
								<li>프로젝트 실패 시 결제 정보가 자동으로 삭제되고 결제가 취소됩니다.</li>
								<li>프로젝트 종료 전, 결제를 취소하고 싶으시다면 마이페이지 > 나의 결제현황에서 취소가능 합니다.</li>
		    				</ul>
	    				</div>
	    			</div>
	    			<div class="wpurchase-notice center div2">
	    				<p class="title">결제예약결과 및 배송예상일 조회는 나의 결제현황에서 확인하세요. </p>
	    				<div class="btn-wrap">
	    					<button class="btn-rd-mint" onclick="결제내역이동?member_id='${ m.member_id }'&payment_id='${ payment_id }'">펀딩 결제 내역 바로가기</button>
	    				</div>
	    			</div>
    			</div>
    		</div>
    		

</div>

<c:import url="../footer.jsp"/>
</body>
</html>

