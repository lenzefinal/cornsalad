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
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bvootstrap/4.0.0/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="http://cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
	$(document).ready(function() {
		$("#flip").click(function() {
			$("#panel").slideToggle("slow");
		});

		$(".a1").click(function() {
			$(".project-store").show();
			$(".supporter-tab").hide();
			$(".comment-tab").hide();
		});

		$(".a2").click(function() {
			$(".project-store").hide();
			$(".supporter-tab").hide();
			$(".comment-tab").show();
		});

		$(".a4").click(function() {
			$(".project-store").hide();
			$(".supporter-tab").show();
			$(".comment-tab").hide();
		});

	});
</script>
<link href="/finalp/resources/css/projectDetailView.css" rel="stylesheet">
</head>
<body>
<c:import url="../header.jsp"/>

<input type="hidden" id="member_id" value="${loginUser.member_id }">

	<div id="container" class="wd-layout-sub-content reward actionbar-hide">
		<!-- S : 캠페인 액션바 -->

		<!-- E : 캠페인 액션바 -->
		<!-- S : 리워드 헤더 -->
		<div class="reward-header">
			<div class="bg"
				style="background-image: url(https://cdn.wadiz.kr/wwwwadiz/green001/2018/0222/20180222115943523_14048.png/wadiz/quality/95/optimize)"></div>
			<p class="title-info">
				<em>테크</em> <strong>${proview.project_name }</strong> 프로젝트
			</p>
			<h2 class="title">
				<p href="/web/campaign/detail/14048">${proview.rep_content }</p>
			</h2>
		</div>
		<!-- E : 리워드 헤더 -->
		<!-- S : 리워드 네비게이션 -->
		<div class="reward-nav">
			<ul class="tab-list">
				<li class="active"><a class="tab-link a1">스토리</a></li>
				<li><a class="tab-link a2">댓글 <span
						class="count-total comment-total">142</span>
				</a></li>
				<li><a class="tab-link a3">환불및 교환 <span class="count-total">2<i
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
									<strong>471</strong>명의 서포터
								</p>
							</div>
							<div class="btn-wrap funding">
								<button onclick="location.href='account.do'"
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
								
								
								<script>
									$(document).ready(function(){
										$("#btnLike1").on("click",function(){
											alert("로그인해주세요");
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
										
											
											
									});
			</script>
								
								<div id="shareSection" class="share-section">
									
								</div>
							</div>

							<div class="banner-section-RB2">
								<a
									href="https://www.wadiz.kr/web/wboard/newsBoardDetail/4600?headWordId=2&amp;cPage=1&amp;_refer_section_st=RB2_0"
									class="banner-coupon">
									<div class="bJXRvz">
										<div class="cBbkfc">
											<div class="fuCNpE">창작자 소개</div>
											<div class="eYscdN">
												<span class="ilGdVJ"></span> <a
													href="/u/donipisepozodachi/projects"> <span
													class="fVfxlF">${proview.member_name }</span>
												</a>
											</div>
		 			<script>
					$(document).ready(function(){
						var min=$("#Min1").text();
					
						if(min=="0시간"){
								$("#Min1").hide();
						}
					});
					
					</script> 
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
											</div>
										</div>
									</div> <!-- E : 프로젝트 위험 요인과 해결 방안  --> <!-- S : 프로젝트 신고하기 모바일 -->

									<div class="wz-message-box project-report-mobile">
										<p class="title">신고하기란?</p>
										<p>
											해당 프로젝트에 지적 재산권을 침해하거나<br>거짓된 내용이 있다면 알려주세요.
										</p>

										<button type="button" class="btn btn-primary"
											data-toggle="modal" data-target="#blacklist-modal"
											style="width: 100%;">프로젝트 신고하기</button>
									</div> <!-- E : 프로젝트 신고하기 --> <!-- S : 보상품 목록, 참여할 때 드리는 선물  -->
									<div id="campaign-rewards"
										style="position: relative; top: -50px"></div>
									<div class="moveRewards">
										<div class="wd-ui-gift">
											<h3 class="project-right-title">리워드 선택</h3>

											<button class="rightinfo-reward-list  ing"
												onclick="backMoney('26841', 'false')">
												<div class="top-info">
													<dl class="reward-info">
														<dt>99,000원 펀딩</dt>
														<dd>
															<p class="reward-name">일반버드 (고미볼 1세트)</p>
															<p>
																정상가 159,000원 (할인율 38%)<br>고미볼(흰색) 1set
															</p>
														</dd>
													</dl>
													<ul class="data-info">
														<li class="shipping"
															style="width: 100%; margin-bottom: 5px;">배송비<em>3,000원</em></li>
														<li class="date" style="width: 100%;">리워드 발송 시작일 <em>2018년
																06월 말 (21~말일) 예정</em>
														</li>
													</ul>
													<p class="reward-qty">
														제한수량 <strong>200</strong>개 &nbsp; <em>현재 163개 남음!</em>
													</p>
													<p class="reward-soldcount">
														총 <strong>37</strong>개 펀딩완료
													</p>
												</div>
												<p class="hover-text">이 리워드 펀딩하기</p>
											</button>
											<button class="rightinfo-reward-list  ing"
												onclick="backMoney('26842', 'false')">
												<div class="top-info">
													<dl class="reward-info">
														<dt>158,000원 펀딩</dt>
														<dd>
															<p class="reward-name">커플/친구 패키지 (고미볼 2세트)</p>
															<p>
																정상가 159,000원 (할인율 50%)<br>고미볼(흰색) 2set
															</p>
														</dd>
													</dl>
													<ul class="data-info">
														<li class="shipping"
															style="width: 100%; margin-bottom: 5px;">배송비<em>3,000원</em></li>
														<li class="date" style="width: 100%;">리워드 발송 시작일 <em>2018년
																06월 말 (21~말일) 예정</em>
														</li>
													</ul>
													<p class="reward-qty">
														제한수량 <strong>150</strong>개 &nbsp; <em>현재 90개 남음!</em>
													</p>
													<p class="reward-soldcount">
														총 <strong>60</strong>개 펀딩완료
													</p>
												</div>
												<p class="hover-text">이 리워드 펀딩하기</p>
											</button>
											<button class="rightinfo-reward-list  ing"
												onclick="backMoney('34830', 'false')">
												<div class="top-info">
													<dl class="reward-info">
														<dt>237,000원 펀딩</dt>
														<dd>
															<p class="reward-name">다둥이용 패키지 (고미볼 3세트)</p>
															<p>
																정상가 159,000원 (할인율 50%)<br>고미볼(흰색) 3set
															</p>
														</dd>
													</dl>
													<ul class="data-info">
														<li class="shipping"
															style="width: 100%; margin-bottom: 5px;">배송비<em>3,000원</em></li>
														<li class="date" style="width: 100%;">리워드 발송 시작일 <em>2018년
																06월 말 (21~말일) 예정</em>
														</li>
													</ul>
													<p class="reward-qty">
														제한수량 <strong>50</strong>개 &nbsp; <em>현재 44개 남음!</em>
													</p>
													<p class="reward-soldcount">
														총 <strong>6</strong>개 펀딩완료
													</p>
												</div>
												<p class="hover-text">이 리워드 펀딩하기</p>
											</button>

											<button class="rightinfo-reward-list ing"
												onclick="backMoney('34831', 'false')">
												<div class="top-info">
													<dl class="reward-info">
														<dt>890,000원 펀딩</dt>
														<dd>
															<p class="reward-name">동호회 패키지 A (고미볼 10세트)</p>
															<p>
																정상가 159,000원 (할인율 44%)<br>고미볼(흰색) 10set
															</p>
														</dd>
													</dl>
													<ul class="data-info">
														<li class="shipping"
															style="width: 100%; margin-bottom: 5px;">배송비<em>6,000원</em></li>
														<li class="date" style="width: 100%;">리워드 발송 시작일 <em>2018년
																06월 말 (21~말일) 예정</em>
														</li>
													</ul>
													<p class="reward-qty">
														제한수량 <strong>10</strong>개 &nbsp; <em>현재 10개 남음!</em>
													</p>
													<p class="reward-soldcount">
														총 <strong>0</strong>개 펀딩완료
													</p>
												</div>
												<p class="hover-text">이 리워드 펀딩하기</p>
											</button>

											<button class="rightinfo-reward-list ing"
												onclick="backMoney('34832', 'false')">
												<div class="top-info">
													<dl class="reward-info">
														<dt>1,780,000원 펀딩</dt>
														<dd>
															<p class="reward-name">동호회 패키지 B (고미볼 20세트)</p>
															<p>
																정상가 159,000원 (할인율 44%)<br>고미볼(흰색) 20set
															</p>
														</dd>
													</dl>
													<ul class="data-info">
														<li class="shipping"
															style="width: 100%; margin-bottom: 5px;">배송비<em>9,000원</em></li>
														<li class="date" style="width: 100%;">리워드 발송 시작일 <em>2018년
																06월 말 (21~말일) 예정</em>
														</li>
													</ul>
													<p class="reward-qty">
														제한수량 <strong>10</strong>개 &nbsp; <em>현재 10개 남음!</em>
													</p>

													<p class="reward-soldcount">
														총 <strong>0</strong>개 펀딩완료
													</p>

												</div>

												<p class="hover-text">이 리워드 펀딩하기</p>


											</button>
											

											<button class="rightinfo-reward-list soldout ing"
												onclick="backMoney('26839', 'true')">
												<div class="top-info">
													<dl class="reward-info">
														<dt>79,000원 펀딩</dt>
														<dd>
															<p class="reward-name">슈퍼 얼리버드 (고미볼 1세트)</p>
															<p>
																정상가 159,000원 (할인율 50%)<br>고미볼 1set<br>
															</p>
														</dd>
													</dl>
													<ul class="data-info">
														<li class="shipping"
															style="width: 100%; margin-bottom: 5px;">배송비<em>3,000원</em></li>
														<li class="date" style="width: 100%;">리워드 발송 시작일 <em>2018년
																06월 중순 (11~20일) 예정</em>
														</li>
													</ul>

													<p class="reward-qty soldout">
														<em>제한수량이 모두 펀딩되었습니다.</em>
													</p>
													<p class="reward-soldcount">
														총 <strong>100</strong>개 펀딩완료
													</p>


												</div>

												<p class="hover-text soldout">
													제한수량이<br>모두 펀딩되었습니다.
												</p>

											</button>

											<button class="rightinfo-reward-list soldout ing"
												onclick="backMoney('26840', 'true')">
												<div class="top-info">
													<dl class="reward-info">
														<dt>89,000원 펀딩</dt>
														<dd>
															<p class="reward-name">얼리버드 (고미볼 1세트)</p>
															<p>
																정상가 159,000원 (할인율 44%)<br>고미볼(흰색) 1set
															</p>
														</dd>
													</dl>
													<ul class="data-info">
														<li class="shipping"
															style="width: 100%; margin-bottom: 5px;">배송비<em>3,000원</em></li>
														<li class="date" style="width: 100%;">리워드 발송 시작일 <em>2018년
																06월 말 (21~말일) 예정</em>


														</li>
													</ul>

													<p class="reward-qty soldout">
														<em>제한수량이 모두 펀딩되었습니다.</em>
													</p>

													<p class="reward-soldcount">
														총 <strong>200</strong>개 펀딩완료
													</p>

												</div>

												<p class="hover-text soldout">
													제한수량이<br>모두 펀딩되었습니다.
												</p>
											</button>

										</div>
									</div> <!-- E : 보상품 목록, 참여할 때 드리는 선물 --> <!-- S : 인기 프로젝트 리스트 -->
									<div id="normalpane" class="recommend-box-container stoped">

										<div id="fixed-funding-btn" class="fixed-funding-btn">
											<button onclick="backMoney('backing', 'false');"
												class="wz-btn primary large block">이 프로젝트 펀딩하기</button>
										</div>


										<!-- S : 프로젝트 신고하기 -->
										<!-- E : 프로젝트 신고하기 -->

										<div class="recommend-box">
											<h3 class="title">인기 프로젝트</h3>
											<c:set var="count" value="1"/>
											<c:forEach var="hot" items="${hotlist}">
											
												<div class="item">
													<div class="number">${count}</div>
													<div class="text">
														<a>${hot.project_name }</a>
													</div>
												</div>
												<c:set var ="count" value="${count+1}"/>
											</c:forEach> 


										</div>
									</div>
									<!-- E : 인기 프로젝트 리스트 --> <!-- S : 프로젝트 신고 팝업 --> <!-- S : 리턴 폼 -->
									<form action="/web/waccount/wAccountLogin" id="returnForm"
										method="get" novalidate="novalidate">
										<input type="hidden" id="returnURL" name="returnURL">
									</form> <!-- E : 리턴 폼 --> <!-- S : 인증 확인 모달 -->
									<div id="authMailLypop" class="lypop-fixed"
										style="display: none;">
										<div class="popup-mint-basic">
											<a href="javascript:closeLyPop('authMail');"
												class="btn-close"><em></em></a>
											<div class="popup-mint-text">
												<strong class="tit-popup">펀딩을 진행하기 위한<br> 기본
													회원 정보를 확인해 주세요.
												</strong>
												<div style="padding: 20px;">- 이메일 인증 : 미인증</div>
											</div>
											<div class="btn-wrap">
												<a class="btn-pd-mint" href="/web/waccount/wAuth">기본
													회원정보 변경</a>
											</div>
										</div>
									</div> <!-- E : 인증 확인 모달 -->
							</div>
							<!-- E : 우측 캠페인 관련 정보 -->


							<!-- S : 캠페인 정보 -->

						</div>

						<!-- E : 캠페인 정보 -->

					</div>
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
								
									<p class="comment-num">댓글 <em class="comment-total">33</em></p>
									
									<!-- 댓글 작성 버튼 loginUser 판단 -->
									<div class="comment-write">
										<div class="comment-create">
											<button type="button" class="wz-btn gray large block">댓글 작성</button>
										</div>
										
										<div class="wz-message-box">
											<p class="title">댓글 작성 유의사항</p>
											<ul>
												<li>펀딩 취소와 옵션 및 배송지 변경은 펀딩 기간(2018.02.28 ~ 2018.04.06)동안 
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
											<textarea name="body" maxlength="2000" placeholder="후원자만 댓글을 입력할수있습니다." class="wz-textarea" style="overflow-y: hidden; resize: none;"></textarea> 
											<div class="btn-wrap">
												<button type="button" class="wz-btn primary">댓글 등록</button>
											</div>
										</div>
									</div>
									
									<div class="comment-box">
									
										<div class="comment-wrap">
											<div class="comment-info">
												<div class="comment-head">
													<div class="user-picture"
														style="background-image: url(&quot;https://www.wadiz.kr/wwwwadiz/green001/2018/0212/20180212181912993_343742.jpg&quot;);"></div>
													<p class="user-name">
														<a href="#">정남<!----></a>
													</p>
													<p class="date">2018.03.09 23:12</p>
												</div>
												<!---->
												<!---->
											</div>
											<div class="comment-content">
												<p>
													친구공개로 되어있어있었네요^^;;.<br>전체공개로 수정 하였습니다!ㅎㅎ<br>열심히
													홍보로 응원하겠습니다-!^^
												</p>
											</div>
											<textarea name="body" rows="1" maxlength="2000"
												placeholder="답글을 입력하려면 로그인이 필요합니다." class="wz-textarea"
												style="overflow-y: hidden; resize: none; background: #ffff"></textarea>
											<div class="comment-input-button">
												<button type="button" disabled="disabled"
													class="wz-btn dense gray">답글 등록</button>
	
											</div>
										</div>
											
	
										<div class="comment-reply">
											<div class="comment-item reply">
												<div class="comment-wrap">
													<div class="comment-info">
														<div class="comment-head">
															<div class="user-picture"
																style="background-image: url(&quot;https://cdn.wadiz.kr/wwwwadiz/green002/2018/0225/20180225195501603_17013.jpg/wadiz/resize/92x92/format/jpg/quality/95/optimize&quot;);"></div>
															<p class="user-name">
																<a href="#">FASHARE(파쉐어)<em class="maker">메이커</em></a>
															</p>
															<p class="date">2018.03.10 17:48</p>
														</div>
														<!---->
														<!---->
													</div>
													<div class="comment-content">
														<p>안녕하세요 정남 서포터님! 응원 감사드립니다!! 댓글 한번더 남겨주셔서 감사합니다
															확인하였습니다 관심 많이 가져주셔서 정말 감사드립니다. 스멜탄과 함께 쾌적한 하루 하루 되세요! :)</p>
													</div>
													<div class="comment-bottom">
														<!---->
													</div>
												</div>
												<!---->
											</div>
											<!---->
										</div>
									</div>
								</div>
								<!--댓글 끝    -->
								
						</div>
					</div>

					<!-- Modal -->
					<link href="/finalp/resources/css/modalcss/blacklistModal.css"
						rel="stylesheet">
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
										<input type="text" value="${ loginUser.member_name}">
										 <input type="hidden" name="project_id" value="${ proview.project_id}"> 
										 	<input type="text"	value="">
									<textarea name="report_reason" placeholder="신고사유"></textarea>
									<input type="submit" class="blacklist blacklist-submit"
										value="신고하기">
								</form>
							</div>
						</div>
					</div>

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
										<input type="text"  value="${ loginUser.member_name}"> 
										<input type="hidden" name="project_id" value="${ likes.project_id} ">
										<input type="text" name="title" value="">
										<textarea name="content" placeholder="문의 내용"></textarea>

									<input type="submit" class="blacklist blacklist-submit"
										value="문의하기">
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>

</body>
</html>