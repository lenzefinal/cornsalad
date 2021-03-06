<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<!-- <script src="https://maxcdn.bootstrapcdn.com/bvootstrap/4.0.0/js/bootstrap.min.js"></script> -->
<link rel="stylesheet" href="http://cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
	$(document).ready(function() {
		$(".refound-story").hide();
		$("#flip").click(function() {
			$("#panel").slideToggle("slow");
			
		});
		
		
		$(".a1").click(function() {
			var pic = $(".active");
			pic.removeClass("active");
			
			$(this).parent().addClass("active");
			
			$(".project-store").show();
			$(".supporter-tab").hide();
			$(".comment-tab").hide();
			$(".refound-story").hide();
		});

		$(".a2").click(function() {
			var pic = $(".active");
			pic.removeClass("active");
			
			$(this).parent().addClass("active");
			
			$(".project-store").hide();
			$(".supporter-tab").hide();
			$(".comment-tab").show();
			$(".refound-story").hide();

		});
		$(".a3").click(function() {
			var pic = $(".active");
			pic.removeClass("active");
			
			$(this).parent().addClass("active");
			
			$(".project-store").hide();
			$(".supporter-tab").hide();
			$(".comment-tab").hide();
			$(".refound-story").show();
		});

		$(".a4").click(function() {
			var pic = $(".active");
			pic.removeClass("active");
			
			$(this).parent().addClass("active");
			
			$(".project-store").hide();
			$(".supporter-tab").show();
			$(".comment-tab").hide();
			$(".refound-story").hide();
		});

		initComparisons();
	});
	
	//jieun
	function initComparisons() {
		var arr = $("#cornGrade-avg-input");
		
		if(arr.length != 0){
			var avg = $("#cornGrade-avg-input").attr("value");
			
			var x, i;
		   /*find all elements with an "overlay" class:*/
		    x = document.getElementsByClassName("img-comp-overlay");
		  
		    var w, h;
		    w = x[0].offsetWidth;
		    h = x[0].offsetHeight;
		    
		    var valuePer = (avg * 20 * h) / 100;
		    /*set the width of the img element to 50%:*/
		    x[0].style.height = valuePer + "px";
		}
	}
</script>
<link href="/finalp/resources/css/projectDetailView.css" rel="stylesheet">
</head>
<body>
<c:import url="../header.jsp"/>

<input type="hidden" id="member_id" value="${loginUser.member_id }">
<input type="hidden" id="seller_id" value="${ LoginTimeView.member_id }">

	<div id="container" class="wd-layout-sub-content reward actionbar-hide">
		<!-- S : 캠페인 액션바 -->

		<!-- E : 캠페인 액션바 -->
		<!-- S : 리워드 헤더 -->
		<div class="reward-header">
			<div class="bg"
				style="background-image: url('/finalp/resources/uploadProPreImages/${ proview.image_rename }')"></div>
			<p class="title-info">
				<em>${ proview.category_sub_name }</em> <strong>${proview.project_name }</strong> 프로젝트
			</p>
			<h2 class="title">
				<p>${proview.rep_content }</p>
			</h2>
		</div>
		<!-- E : 리워드 헤더 -->
		<!-- S : 리워드 네비게이션 -->
		<div class="reward-nav">
			<ul class="tab-list">
				<li class="active"><a class="tab-link a1">스토리</a></li>
				<li><a class="tab-link a2">댓글 <span
						class="count-total comment-total">${fn:length(replylist)}</span>
				</a></li>
				<li><a class="tab-link a3">환불및 교환 <span class="count-total"><i
							class="icon-new"></i></span>
				</a></li>
				<li><a class="tab-link a4">서포터 <span class="count-total">${fn:length(SuppoterView)}<i
							class="icon-new"></i></span></a></li>
			</ul>
		</div>
		<!-- E : 리워드 네비게이션 -->
		<div class="reward-body-wrap">
			<div class="wd-ui-sub-contents">
				<!-- S : 페이지 레이아웃 컨테이너 -->
				<div class="wd-ui-info-wrap">
					<!-- S : 좌측 캠페인 관련 정보 -->

					<!-- S : 우측 캠페인 관련 정보 -->
					<div class="wd-ui-sub-opener-info" style="padding-top: 0;">
						<!-- S : 프로젝트 정보  -->
						<h3 class="text-hidden">프로젝트 정보</h3>
						<div class="project-state-info">
							<div class="state-box">
								<p class="remaining-day">${proview.dday }일 남음</p>
								<p class="rate-bar">
									<em style="width: ${proview.percent }%"></em>
								</p>
								<p class="achievement-rate">
									<strong>${proview.percent }</strong>% 달성
								</p>
								<p class="total-amount">
									<strong>${proview.total_amount }</strong>원 펀딩
								</p>
								<p class="total-supporter">
									<strong>${fn:length(SuppoterView)}</strong>명의 서포터
								</p>
							</div>
							
							<div class="btn-wrap funding">
								<c:set var="n" value="null"/>
								<button onclick="location.href='payment.do?p_id=${proview.project_id}&g_id=${n}'"
									class="wz-btn primary large block">펀딩하기</button>
							</div>
									
							<c:if test="${empty loginUser}">
								<button id="btnLike1" class="cam	paign-like btn-like"
								style="width: 100%">
									<img src="resources/images/icon/love1.png"
										id="like1" style="width: 10%; size: 10%;"> <em id="cntLike"
										class="cnt-like">${ like}</em>
								</button>
							</c:if>
							
							<div class="btn-wrap share">
								<c:if test="${not empty loginUser}">
									<button id="btnLike" class="campaign-like btn-like"
									style="width: 100%">	
										<c:if test="${not empty likes}">
											<img src="resources/images/icon/love2.png"
											id="like1" style="width: 10%; size: 10%;"> <em id="cntLike"
											class="cnt-like">${ like}</em>
										</c:if>
										<c:if test="${empty likes}">
											<img src="resources/images/icon/love1.png"
											id="like1" style="width: 10%; size: 10%;"> <em id="cntLike"
											class="cnt-like">${ like}</em>
										</c:if>
										</button>
								</c:if>
						
								<div id="shareSection" class="share-section">
									
								</div>
							</div>

							<div class="bJXRvz">
								<div class="cBbkfc">
									<div class="fuCNpE">창작자 소개</div>
										<div class="eYscdN">
											<span class="ilGdVJ"></span> 
											<a href="#"><span class="fVfxlF">${proview.member_name }</span></a>
										<c:if test="${ empty cornGrade  || 
														(!empty cornGrade && cornGrade.corngrade_avg == 0) }">
											<span style="color:gray;margin-left:10px;"><b>아직 평가가 없습니다.</b></span>	
										</c:if>
										<style>
											.cornImg-container {
											  position: relative;
											  height: 50px;
											}
											.img-comp-img {
											  position: absolute;
											  width: auto;
											  height: auto;
											  overflow:hidden;
											}
											.img-comp-img img {
											  display:block;
											  vertical-align:middle;
											}
										</style>
										<c:if test="${ !empty cornGrade && cornGrade.corngrade_avg > 0 }">
											<input type="hidden" id="cornGrade-avg-input" value="${ cornGrade.corngrade_avg }"/>
											<span style="color:gray;margin-left:10px;">
												<div class="cornImg-container">
												  <div class="img-comp-img">
												    <img src="/finalp/resources/images/icon/cornpoint.png" width="40" height="50">
												  </div>
												  <div class="img-comp-img img-comp-overlay">
												    <img src="/finalp/resources/images/icon/cornpoint2.png" width="40" height="50">
												  </div>
												</div>
												<div style="margin-left:12px;"><b>${ cornGrade.corngrade_avg }</b></div>
											</span>
										</c:if>
											
										</div>
		 								<div class="dHxdxH"></div>
										<div class="iiBGoJt">
											<div>
												<!-- react-text: 598 -->
												마지막 로그인&nbsp;&nbsp;
												<!-- /react-text -->
												<b id="Min1">${LoginTimeView.min }시간</b>&nbsp;<b>${LoginTimeView.second}분</b>
											</div>
											<!-- react-text: 600 -->
											진행한 프로젝트&nbsp;&nbsp;
											<!-- /react-text -->
											<b>${count}</b>
											<!-- react-text: 602 -->
											&nbsp;&nbsp;&nbsp;&nbsp; 밀어준 프로젝트&nbsp;&nbsp;
											<!-- /react-text -->
											<b>0</b>
										</div>
									<div class="khYIRi">
										<c:if test="${not empty loginUser }">
										<c:if
											test="${loginUser.member_id eq LoginTimeView.member_id }">
											<button class="dxWcyc">
												<i class="_3YmAkQhwzI7o-uUWz_8Mp4 _1QY7TzdLHKX3-BKPDNNY"></i>
												<!-- react-text: 607 -->
												<c:url var="chat" value="chat.do">
															<c:param name="room_category" value="pj"/>
															<c:param name="room_name" value="${proview.project_name}"/>
															<c:param name="member_id" value="${loginUser.member_id}"/>
												</c:url>
												<a href="#" onclick="window.open('${chat}','채팅창','width=500,height=600, left=1500, resizable=0'); return false">채팅방 만들기</a>
												<!-- /react-text -->
											</button>
										</c:if>
										<c:if
											test="${loginUser.member_id ne LoginTimeView.member_id }">
											<button class="dxWcyc" data-toggle="modal"
												data-target="#contact">
												<img src="resources/images/icon/메일이메일.png" width="15px"
													width="10px"
													style="margin-right: 2px; margin-bottom: -4px;"> <i
													class="_3YmAkQhwzI7o-uUWz_8Mp4 _1QY7TzdLHKX3-BKPDNNY"></i>
												<!-- react-text: 607 -->
												창작자에게 문의하기
												<!-- /react-text -->
											</button>
											<br><br>
											
											<c:forEach var="wc" items="${wclist}" >
												<c:url var ="inchat" value="inchat.do">
												<c:param name="room_reply_id" value="${wc.room_id}"/>
												<c:param name="room_name" value="${wc.room_name}"/>
												<c:param name="member_id" value="${loginUser.member_id }"/>
												</c:url>
												
												<c:if test="${proview.project_name == wc.room_name}">
												<button class="dxWcyc">
												<i class="_3YmAkQhwzI7o-uUWz_8Mp4 _1QY7TzdLHKX3-BKPDNNY"></i>
												<a href="#" onclick="window.open('${inchat}','채팅창','width=500,height=600, left=1500, resizable=0'); return false" class="pointer noticeClick">채팅방참여하기</a>
												</button>
												</c:if>
												
												
												</c:forEach>
												
										</c:if>

									</c:if>
									<c:if test="${empty loginUser }">
										<button class="dxWcyc" onclick="alertify.alert('로그인해주세요')">
											<img src="resources/images/icon/메일이메일.png" width="15px"
												width="10px"
												style="margin-right: 2px; margin-bottom: -4px;"> <i
												class="_3YmAkQhwzI7o-uUWz_8Mp4 _1QY7TzdLHKX3-BKPDNNY"></i>
											<!-- react-text: 607 -->
											창작자에게 문의하기
											<!-- /react-text -->
										</button>
									</c:if>

									</div>
								</div>
								</div> 
								
								<!-- S : 프로젝트 신고하기 모바일 -->

								<div class="wz-message-box project-report-mobile">
									<p class="title">신고하기란?</p>
									<p>
										해당 프로젝트에 지적 재산권을 침해하거나<br>거짓된 내용이 있다면 알려주세요.
									</p>
									<c:if test="${not empty loginUser }">
									<button type="button" class="btn btn-primary"
											data-toggle="modal" data-target="#blacklist-modal"
											style="width: 100%;">프로젝트 신고하기</button>
									</c:if>
									<c:if test="${empty loginUser }">
									<button type="button" class="btn btn-primary"
											onclick="alertify.alert('로그인해주세요')"
											style="width: 100%;">프로젝트 신고하기</button>
									</c:if>
								</div> 
								<!-- E : 프로젝트 신고하기 -->
								 
								<!-- S : 보상품 목록, 참여할 때 드리는 선물  -->
								<div class="moveRewards">
									<div class="wd-ui-gift">
										<h3 class="project-right-title">리워드 선택</h3>
										
										<c:forEach var="glist" items="${ glist }">
											<c:if test="${ glist.remain > 0 || glist.capacity eq 0}">
	 											<button class="rightinfo-reward-list ing" onclick="location.href='payment.do?p_id=${proview.project_id}&g_id=${ glist.gift_id }'">
	 											
 											</c:if>
 											<c:if test="${empty loginUser }">
 												<button class="rightinfo-reward-list ing" onclick="alertify.alert('로그인해주세요')">
 											</c:if>
 											<c:if test="${ glist.remain eq 0 && glist.capacity ne 0}">
	 											<button class="rightinfo-reward-list soldout" disabled>
 											</c:if>
 											
											<div class="top-info">
												<dl class="reward-info">
													<dt>${glist.support_price}원 펀딩</dt>
													<dd>
														<c:forEach var="giftlist" items="${ giftlist }">
															<c:if test="${giftlist.gift_id eq glist.gift_id }">
																${ giftlist.item_name }&nbsp; x &nbsp; ${ giftlist.count }개<br>
															</c:if>
														</c:forEach>
													</dd>
												</dl>
												<ul class="data-info">
													<li class="shipping"
														style="width: 100%; margin-bottom: 5px;">배송비 &nbsp;<em>3,000원</em></li>
													<li class="date" style="width: 100%;">리워드 발송 시작일  &nbsp;-&nbsp;<em>${ glist.payment_date } &nbsp;예정</em>
													</li>
												</ul>
												
												<c:if test="${ glist.capacity eq 0 }">
													<p class="reward-qty">제한수량 <strong>없음</strong>&nbsp;&nbsp;</p>
												</c:if>		
												<c:if test="${ glist.remain eq 0 && glist.capacity ne 0}">
													<p class="reward-qty soldout"><em>제한수량이 모두 펀딩되었습니다.</em></p>
												</c:if>
												<c:if test="${ glist.remain > 0 }">
													<p class="reward-qty">제한수량 <strong> &nbsp;${ glist.capacity }</strong>개 &nbsp;&nbsp; 
														<em>현재 &nbsp; ${ glist.remain }개 남음!</em></p>
												</c:if>
												
												<p class="reward-soldcount">
													총 <strong>${ glist.sellcount }</strong>개 펀딩완료
												</p>
											</div>
											
											<p class="hover-text ingtext">이 리워드 펀딩하기</p>
											<p class="hover-text soldouttext">제한수량이<br>모두 펀딩되었습니다.</p>
											
										</button>
									</c:forEach> 	
								</div>
							</div> <!-- E : 보상품 목록, 참여할 때 드리는 선물 --> 
							
							<div id="normalpane" class="recommend-box-container stoped">
								<div id="fixed-funding-btn" class="fixed-funding-btn">
									<button onclick="backMoney('backing', 'false');" class="wz-btn primary large block">이 프로젝트 펀딩하기</button>
								</div>
								<!-- S : 인기 프로젝트 리스트 -->
								<div class="recommend-box">
									<h3 class="title">인기 프로젝트</h3>
									<c:set var="count" value="1"/>
									<c:forEach var="hot" items="${hotlist}">
									
										<div class="item">
											<div class="number">${count}</div>
											<div class="text">
												<c:url var="detail" value="projectDetailView.do">
													<c:param name="project_id" value="${hot.project_id}"/>
													<c:param name="member_id" value="${loginUser.member_id}"/>
												</c:url>
												<a href="${detail}" style="color: #F7D358;">${hot.project_name }</a>
											</div>
										</div>
										<c:set var ="count" value="${count+1}"/>
									</c:forEach> 
								</div>
							</div>
						</div>
					</div>
					<!-- 오른쪽 부분 끝 -->
					
					<div class="wd-ui-sub-campaign-info-container">
						<div class="wd-ui-sub-campaign-info">
							<!-- S : 탭 주요 콘텐츠 -->
							<div class="wd-ui-tab-contents" style="margin-right: 7%;">

								<!--스토리  -->
								<div class="project-store" style="display: block">
									${proview.content }
								</div>

								<!-- 서포터 -->
								<div class="supporter-tab" style="display: none">

									<strong class="achieve-text"> 현재 이 프로젝트에<br> <span>${fn:length(SuppoterView)} 명</span>의
										참여가 이루어졌습니다.
									</strong>
									<ul class="support-list" style="list-style: none;">
									
									 <c:forEach var="suppoter" items="${SuppoterView}">
										<li class="support-item showblock_1" id="0">
											<figure>
												<a href="#" onclick="goUserProfile(708130818);">
													<div class="profile"
														style="background-image: url('resources/images/mypageProfiles/${suppoter.profile_img_rename }')"></div>
												</a>
												<figcaption class="info">
													<strong class="title"> 사용자 <span>${suppoter.member_name }</span>님이 펀딩내용
														<span>${suppoter.project_category_name }</span>으로 참여 하셨습니다.
													</strong><br> <abbr>${suppoter.payment_date } </abbr>
												</figcaption>
											</figure>
										</li>
									</c:forEach> 
										
										
									</ul>
								</div>
								<!--서포터////////////////  -->
								
								<!-- 댓글 시작  -->
								<div class="comment-tab" style="display: none">
								
									<p class="comment-num">댓글 <em class="comment-total">${fn:length(replylist)}</em></p>
									
									<!-- 댓글 작성 버튼 loginUser 판단 -->
									<div class="comment-write">
										<div class="comment-create">
											<c:if test="${ empty loginUser }">
												<button type="button" class="wz-btn gray large block" onclick="alertify.alert('로그인을 해주세요');">댓글 작성</button>
											</c:if>
											<c:if test="${ !empty loginUser }">
												<button type="button" class="wz-btn gray large block" onclick="$('.message-box-comment').show(); $(this).parent().hide();">댓글 작성</button>
											</c:if>
										</div>
										
										<div class="message-box-comment" style="display:none;">
											<div class="wz-message-box">
												<p class="title">댓글 작성 유의사항</p>
												<ul>
													<li>펀딩 취소와 옵션 및 배송지 변경은 펀딩 기간(${ proview.start_date } ~ ${ proview.end_date })동안 
														<a href="#">나의 펀딩현황</a>에서 가능합니다.
													</li> 
													<li>펀딩 기간 이후의 관련 문의 및 배송 문의는 
														<a href="mailto:iarsn@iarsn.co.kr">admin@cornsalad.com</a>으로 문의해 주셔야 정확한 답변을 받을 수 있습니다.
													</li> 
													<li>서포터님의 연락처, 성명, 이메일 등의 소중한 개인정보는 절대 남기지 마세요.</li> 
													<li>광고성, 욕설, 비방, 도배 등의 글은 예고 없이 삭제 등 조치가 취해질 수 있습니다.</li>
												</ul>
											</div>
											
											<div class="main-comment">
												<c:if test="${ suppoterFlag }">
													<textarea name="reply_content" maxlength="2000" placeholder="후원자입니다. 댓글을 입력해주세요." class="wz-textarea replyZero" 
														style="overflow-y: hidden; resize: none;"></textarea> 
													<div class="btn-wrap">
														<button type="button" class="wz-btn primary btnZero">댓글 등록</button>
													</div>
													
													<div class="btn-wrap">
														
													</div>
												</c:if>
												<c:if test="${ !suppoterFlag  }">
													<textarea name="reply_content" maxlength="2000" placeholder="후원자만 댓글을 입력할수있습니다." readonly class="wz-textarea" 
														style="overflow-y: hidden; resize: none;"></textarea> 
													<div class="btn-wrap">
														<button type="button" class="wz-btn primary" disabled>댓글 등록</button>
													</div>
												</c:if>
												
											</div>
										</div>
									</div>
									
									<div class="comment-box">
										<c:forEach var="reply" items="${ replylist }" varStatus="status">
											<c:if test="${ reply.reply_level eq 0 }">
												<div class="comment-wrap">
													<div class="comment-info">
														<div class="comment-head">
															<div class="user-picture"
																style="background-image: url('/finalp/resources/images/mypageProfiles/${ reply.profile_img_rename }');"></div>
															<p class="user-name">
																	<a href="#"><strong>${ reply.member_name }</strong></a>
																	<a href="#" data-toggle="modal" data-target="#blacklist-modal${ status.count }" style="color:red;float:right;right:0px;">신고하기</a>
															</p>
															<p class="date">${ reply.creation_date }</p>
														</div>
													</div>
													
													<c:if test="${ reply.report_count>=5 }">
														<div class="comment-content">
															<p> 신고된 댓글입니다. </p>
														</div>
													</c:if>
													<c:if test="${ reply.report_count<5 }">
														<div class="comment-content">
															<p> ${reply.reply_content }</p>
														</div>
													</c:if>
													
													<c:if test="${ empty loginUser }">
														<textarea name="reply_content" readonly rows="1" maxlength="2000"
															placeholder="답글을 입력하려면 로그인이 필요합니다." class="wz-textarea"
															style="overflow-y: hidden; resize: none;"></textarea>
														<div class="comment-input-button">
															<button type="button" disabled
																class="wz-btn dense" style="font-size:14px;">답글 등록</button>
														</div>
													</c:if>
													<c:if test="${ !empty loginUser }">
														<c:if test="${ suppoterFlag }">
															<textarea name="reply_content" rows="1" maxlength="2000" 
															class="wz-textarea replyOne" placeholder="후원자입니다. 답글을 입력하세요." 
															style="overflow-y: hidden; resize: none; background: #ffff"></textarea>
															<input type="hidden" id="proj_reply_id_ref" value="${ reply.project_reply_id }">
															<div class="comment-input-button">
																<button type="button" 
																	class="wz-btn dense btnOne" style="font-size:14px;">답글 등록</button>
															</div>
														</c:if>
														<c:if test="${ !suppoterFlag }">
															<textarea name="reply_content" rows="1" maxlength="2000" 
															class="wz-textarea" placeholder="후원자만 답글을 달 수 있습니다." readonly
															style="overflow-y: hidden; resize: none; background: #ffff"></textarea>
															<div class="comment-input-button">
																<button type="button" 
																	class="wz-btn dense" disabled style="font-size:14px;">답글 등록</button>
															</div>
														</c:if>
													</c:if>
													
												</div>
											</c:if>	
											
											<c:if test="${ reply.reply_level eq 1 }">
												<div class="comment-reply">
													<div class="comment-item reply">
														<div class="comment-wrap">
															<div class="comment-info">
																<div class="comment-head">
																	<div class="user-picture"
																		style="background-image: url('/finalp/resources/images/mypageProfiles/${ reply.profile_img_rename }');"></div>
																	<p class="user-name">
																		<a href="#"><strong>${ reply.member_name }</strong>
																			<c:if test="${ reply.member_id eq LoginTimeView.member_id }">
																				<em class="maker">메이커</em>
																			</c:if>
																		</a>
																		<a href="#" data-toggle="modal" data-target="#blacklist-modal${ status.count }" style="color:red;float:right;right:0px;">신고하기</a>
																	</p>
																	<p class="date">${ reply.creation_date }</p>
																</div>
															</div>
															<div class="comment-content">
															<c:if test="${ reply.report_count < 5 }">
																<p>${ reply.reply_content }</p>
															</c:if>
															<c:if test="${ reply.report_count >= 5 }">
																<p> 신고가 된 댓글입니다.</p>
															</c:if>
															</div>
															<div class="comment-bottom">
																<!---->
															</div>
														</div>
													</div>
												</div>
											</c:if>
										</c:forEach>
									</div>
								</div>
								<!--댓글 끝    -->
								<script type="text/javascript">
									$(document).ready(function(){
										
										$("#btnLike1").on("click",function(){
											alertify.alert("로그인해주세요");
										});				
										var member_id=$("#member_id").val();
										var project_id=${ proview.project_id};
										$("#btnLike").on("click",function(){
											$.ajax({
												url:"Like.do",
												type:"post",
												dataType:"json",
												data:{project_id: project_id,
													  member_id: member_id},
												success:function(data){
													if(data.result==="add"){
														console.log("add");
														$("#like1").attr("src","resources/images/icon/love2.png");
														$("#cntLike").text(data.like);
													}else{
														console.log("delete");
														$("#like1").attr("src","resources/images/icon/love1.png");
														$("#cntLike").text(data.like);
													}
												}
												
											});
										});
										
										
										var min=$("#Min1").text();
									
										if(min=="0시간"){
												$("#Min1").hide();
										}
										
										var member_id=$("#member_id").val();
										var project_id=${ proview.project_id };
										
										$(document).on("click",".btnOne",function(){
											
											$.ajax({
												url:"insertReplyOne.do",
												data:{reply_content:$(this).parent().prev().prev().val(),
													  member_id:member_id,
													  project_id:project_id,
													  proj_reply_id_ref:$(this).parent().prev().val()},
												type:"post",
												dataType:"json",
												success:function(data){
													console.log("성공");
													$(".replyOne").val("");
													listHtml(data);
												}
											});
										})
										
										$(document).on("click",".btnZero",function(){
											console.log(member_id+" "+project_id);
											
											$.ajax({
												url:"insertReplyZero.do",
												data:{reply_content:$(".replyZero").val(),
													  member_id:member_id,
													  project_id:project_id},
												type:"post",
												dataType:"json",
												success:function(data){
													console.log("성공");
													
													$(".main-comment .replyZero").val("");
													listHtml(data);
												}
											});
										});
										
									});
									
									function listHtml(data){
											var jsonStr = JSON.stringify(data);
											var json = JSON.parse(jsonStr);
											
											var values="";
											var suppoterFlag=${suppoterFlag};
											
											var commentCount = 0;
											
											for(var i in json.replylist){
												
												if(json.replylist[i].reply_level == 0){
													values+='<div class="comment-wrap">'+
																'<div class="comment-info">'+
																	'<div class="comment-head">'+
																		'<div class="user-picture" style="background-image: url(/finalp/resources/images/mypageProfiles/'+decodeURIComponent(json.replylist[i].profile_img_rename)+');"></div>'+
																		'<p class="user-name">'+
																			'<a href="#"><strong>'+decodeURIComponent(json.replylist[i].member_name.replace(/\+/g," "))+'</strong></a></p>'+
																			'<a href="#" data-toggle="modal" data-target="#blacklist-modal${ status.count }" style="color:red;float:right;right:0px;">신고하기</a>'+
																		'<p class="date">'+json.replylist[i].creation_date+'</p></div></div>'+
																'<div class="comment-content"><p>';
																if(json.replylist[i].report_count<=5)
															 values+=decodeURIComponent(json.replylist[i].reply_content.replace(/\+/g," "));
																else{
														 	values+='신고된 댓글입니다.';
																}
																values+='</p></div>';
													
													if($("#member_id").val() === "" ){
														values+='<textarea name="reply_content" readonly rows="1" maxlength="2000" '+
																'placeholder="답글을 입력하려면 로그인이 필요합니다." class="wz-textarea" '+
																'style="overflow-y: hidden; resize: none;"></textarea>'+
																'<div class="comment-input-button">'+
																	'<button type="button" disabled '+
																		'class="wz-btn dense" style="font-size:14px;">답글 등록</button></div>';
													}else{
														if(suppoterFlag){
															values+='<textarea name="reply_content" rows="1" maxlength="2000" '+
																	'class="wz-textarea replyOne" placeholder="후원자입니다. 답글을 입력하세요." '+
																	'style="overflow-y: hidden; resize: none; background: #ffff"></textarea>'+
																	'<input type="hidden" id="proj_reply_id_ref" value='+json.replylist[i].project_reply_id+'>'+
																	'<div class="comment-input-button">'+
																		'<button type="button" '+
																			'class="wz-btn dense btnOne" style="font-size:14px;">답글 등록</button></div>';
														}else{
															values+='<textarea name="reply_content" rows="1" maxlength="2000" '+
																	'class="wz-textarea" placeholder="후원자만 답글을 달 수 있습니다." readonly '+
																	'style="overflow-y: hidden; resize: none; background: #ffff"></textarea>'+
																	'<div class="comment-input-button">'+
																		'<button type="button" '+
																			'class="wz-btn dense" disabled style="font-size:14px;">답글 등록</button></div>';
														}
													}
													values+='</div>';
												}else if(json.replylist[i].reply_level == 1){
													values+='<div class="comment-reply">'+
															'<div class="comment-item reply">'+
																'<div class="comment-wrap">'+
																	'<div class="comment-info">'+
																		'<div class="comment-head">'+
																			'<div class="user-picture" '+
																				'style="background-image: url(/finalp/resources/images/mypageProfiles/'+decodeURIComponent(json.replylist[i].profile_img_rename)+');"></div>'+
																			'<p class="user-name">'+
																				'<a href="#"><strong>'+decodeURIComponent(json.replylist[i].member_name.replace(/\+/g," "))+'</strong>';
																					if(json.replylist[i].member_id === $("#seller_id").val()){
																						values+='<em class="maker">메이커</em>';
																					}
																						
																		values+='</a><a href="#" data-toggle="modal" data-target="#blacklist-modal${ status.count }" style="color:red;float:right;right:0px;">신고하기</a></p>'+
																			'<p class="date">'+json.replylist[i].creation_date+'</p></div></div>'+
																	'<div class="comment-content"><p>';
																	if(json.replylist[i].report_count<=5)
																values+=decodeURIComponent(json.replylist[i].reply_content.replace(/\+/g," "));
																	else{
																values+="신고된 댓글입니다.";
																	}
																	
																values+='</p></div>'+'<div class="comment-bottom"></div></div></div></div>';
												}
												
												commentCount = commentCount+1;
											}
											
											$(".comment-box").html(values);
											
											
											$(".comment-total").html(commentCount);
										}
								</script>
								<!--환불정책 -->
								
								<div class="refound-story" style="display: block">
									<div class="wz-message-box">
									${proview.refund_role }
									</div>
								</div>
								
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>
	
	<!-- Modal -->
	<link href="/finalp/resources/css/modalcss/blacklistModal.css" rel="stylesheet">
	<div class="modal fade" id="blacklist-modal" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"
		style="display: none; z-index: 9999;">
		<div class="modal-dialog">
			<div class="blacklist-container">
				<a data-dismiss="modal"
					style="margin-left: 90%; max-width: 500px;"><i
					class="xi-close-thin xi-2x"></i></a>
				<h1>프로젝트 신고하기</h1>
				<br>
				<form action="reportProject.do" method="post">
					<input type="hidden" name="member_id" value="${ loginUser.member_id}"> 
						<input type="text" value="신고자  :${ loginUser.member_name}" readonly>
						 <input type="hidden" name="project_id" value="${ proview.project_id}"> 
						 	
					<textarea name="report_reason" placeholder="신고사유"></textarea>
					<input type="submit" class="blacklist blacklist-submit"
						value="신고하기" style="background-color:  #F7D358;">
				</form>
			</div>
		</div>
	</div>
	
	<c:forEach var="reply" items="${ replylist }" varStatus="status">
		<div class="modal fade" id="blacklist-modal${ status.count }" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"
		style="display: none; z-index: 9999;">
			<div class="modal-dialog">
				<div class="blacklist-container">
					<a data-dismiss="modal"
						style="margin-left: 90%; max-width: 500px;"><i
						class="xi-close-thin xi-2x"></i></a>
					<h1>프로젝트 댓글 신고하기</h1>
					<br>
					<form action="reportReply.do" method="post">
						<input type="hidden" name="member_id" value="${ loginUser.member_id}"> 
							<input type="text" value="신고자  : ${ loginUser.member_name}" readonly>
							<input type="hidden" name="project_reply_id" value="${ reply.project_reply_id}"> 
							<input type="hidden" name="project_id" value="${ reply.project_id }">
							 	
							<textarea name="report_reason" placeholder="신고사유"></textarea>
							<input type="submit" class="blacklist blacklist-submit"
								value="신고하기" style="background-color:  #F7D358;">
					</form>
				</div>
			</div>
		</div>
	</c:forEach>
	
	<div class="modal fade" id="contact" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true"
		style="display: none; z-index: 9999;">
		<div class="modal-dialog">
			<div class="blacklist-container">
				<a data-dismiss="modal"
					style="margin-left: 90%; max-width: 500px;"><i
					class="xi-close-thin xi-2x"></i></a>
				<h1>창작자에게 문의하기</h1>
				<br>
				<form action="insertQuestion.do" method="post">
						<input type="hidden" name="send_member_id" value="${ loginUser.member_id}"> 
						<input type="hidden" name="receive_member_id" value="${ LoginTimeView.member_id }">
						<input type="hidden" name="category" value="PC-FUND">
						<input type="text"  value="문의자:  ${ loginUser.member_name}" readonly> 
						<input type="hidden" name="project_id" value="${ proview.project_id }">
						<input type="text" name="title" placeholder="문의 제목">
						<textarea name="content" placeholder="문의 내용"></textarea>

					<input type="submit" class="blacklist blacklist-submit"
						value="문의하기" style="background-color:  #F7D358;">
				</form>
			</div>
		</div>
	</div>

</body>
</html>