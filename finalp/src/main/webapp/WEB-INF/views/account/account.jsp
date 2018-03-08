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

<link rel="stylesheet" href="/finalp/resources/css/aStyle.css" />
<script type="text/javascript" src="/finalp/resources/js/aScript.js"></script>

<div class="container">

  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <!-- <div class="modal-header"> -->
          <!-- <!-- <button type="button" class="close" data-dismiss="modal">&times;</button> -->
          <!-- <!-- <h4 class="modal-title">Modal Header</h4> --> 
        <!-- </div> -->
        <div class="modal-body">
          <a href="#" class="btn less back"><img src="/finalp/resources/images/accountimages/left arrow.png" height="20" width="20"> &nbsp; <span class="mid">스토리로 돌아가기</span></a>
		  <p class="title"><strong>잠깐!</strong> 펀딩과 쇼핑이 어떻게 다른지 확인 후 펀딩을 진행하세요</p>
		
		<div class="wz-form large" id="reward-notice-form">
          <dl>
            <dt><input type="checkbox" id="check1" value="Y"><label for="check1"> &nbsp; 바로 결제되지 않아요</label></dt>
            <dd>
              <p>지금 펀딩하시면 <strong>결제 예약</strong>되며, 목표금액 달성 시, <strong>2018.03.26</strong>에 모두 함께 결제됩니다.</p>
              <p><em>수수료 타입에 따라 목표 금액과 상관없이 진행되는 경우도 있습니다.</em></p>
            </dd>
						<dt><input type="checkbox" id="check2" value="Y"><label for="check2"> &nbsp; 펀딩 종료 후에는 취소할 수 없어요</label></dt>
            <dd>
              <p>리워드 결제 예약 취소와 변경은 <strong>프로젝트 펀딩기간 중</strong>에만 가능합니다.<br>펀딩 취소는 <strong>2018.03.25</strong>까지 가능합니다. 이후로는 취소가 불가합니다.
            </p></dd>
            <dt><input type="checkbox" id="check3" value="Y"><label for="check3"> &nbsp; 바로 리워드가 발송되지 않아요</label></dt>
            <dd>
              <p>리워드는 메이커가 <strong>약속한 날짜</strong>에 발송됩니다.<br>선택한 리워드의 발송 예정일을 확인한 후에 펀딩해 주세요.</p>
              <p><em>리워드 펀딩 특성상 발송이 지연되거나 불가할 수 있습니다.<br>스토리 하단의 리워드 발송 예상 변동 기간 및 교환, 환불, AS 정책을 참고해주세요.</em></p>
            </dd>
          </dl>
        </div>

        </div>
        <div class="modal-footer" id="reward-footer">
         <button type="button" class="btn block continue gray" onclick="closeLyPop();" data-dismiss="modal">계속해서 펀딩하기</button>
        </div> 
      </div>
      
    </div>
  </div>
  
</div>
<!-- 와디즈 카피 -->

<div class="reward-body">

<div class="wpurchase-title">
				<table id="reward-title">
				<tr>
				<td id="back"><a href="#"><img src="/finalp/resources/images/accountimages/left-arrow2.png" height="20" width="20"> &nbsp; <span>스토리로 돌아가기</span></a></td>
				<td id="reward-name">우리 아이를 혼자 두지 마세요. 반려동물용 인공지능로봇 [고미볼]</td>
				<td id="seller"><h4>(주) 고미랩스</h4></td>
				</tr>
				</table>
</div>
    	
    		<div class="wpurchase-wrap" >
    			<div class="wpurchase-step">
    				<ol>
    					<li class="active"><em>리워드<br />선택</em></li>
    					<li><em>결제 하기</em></li>
    					<li><em>소문내기</em></li>    					
    				</ol>
    			</div>

				<div class="top-area">
	    					<h3><em>리워드 선택</em></h3>
	    					<p class="sub-text">펀딩해주시는 금액에 따라 감사의 의미로 리워드를 제공해 드립니다.</p>
	    					<a class="help-text" href="#"><label>펀딩하기는 쇼핑하기가 아닙니다! 자세히 알아보세요.</label></a>
	    		</div>

				<form name="purchaseForm" id="purchaseForm" method="post">
					<div id="reward-list">
	    					<ul>
	    						
	    						<li>
									<div class="reward-background">
	    							<dl class="reward-box ">
	    								<dt><input type="checkbox" id="ckrw33830" class="reward-check" name="rewardId" value="33830"  /><label for="ckrw33830"> </label></dt>
	    								<dd>
	    									<input type="hidden" id="amountRw33830" value="37000" />
	    									<input type="hidden" id="remainCnt33830" class="remain-cnt" value="110" />
	    									<input type="hidden" id="limitCnt33830" class="limit-cnt" value="200" />
	    									<label for="ckrw33830">
	    									<p class="sum">99,000원 펀딩합니다.</p>
	    									<p class="number"> 일반버드 (고미볼 1세트)
		    									
		    										
		    										
		    										<span class="remains">(249개 남음)</span>
		    									
		    								</p>
	    									<p class="text">정상가 159,000원 (할인율 38%)<br>고미볼(흰색) 1set</p>
	    									<p class="date"> 
	    										
	    										배송비 3,000원
	    										 | 리워드 제공 예상일 : 
	    										 
	    										 	
	    												
	    										 		
													    
														<span>2018년 06월</span>
														<span>말 (21~말일) 예정</span>
	    										 	
	    										 	
	    										 
											</p>
	    									</label>
	    									<div class="checked-area hidden">
	    										<div class="amount">
	    											<p class="title">수량</p>
	    											<p class="input-area">
	    												<button type="button" onclick="changeQty('minus', 33830)" class="icon-remove-box-o"><img src="/finalp/resources/images/accountimages/minus.png" alt="" width="15px" height="15px"></button>
	    												<input type="text" id="qty33830" class="reward-qty" value="0" />
	    												<button type="button" onclick="changeQty('plus', 33830)" class="icon-add-box-o"><img src="/finalp/resources/images/accountimages/plus.png" alt="" width="15px" height="15px"></button>
	    											</p>
	    										</div>
	    										 
	    									</div>
	    								</dd>
	    							</dl>
									</div>
	    						</li>

<li>
									<div class="reward-background">
	    							<dl class="reward-box soldout">
	    								<dt><input type="checkbox" id="ckrw33829" class="reward-check" name="rewardId" value="33829" disabled="disabled" /><label for="ckrw33829"> </label></dt>
	    								<dd>
	    									<input type="hidden" id="amountRw33829" value="18500" />
	    									<input type="hidden" id="remainCnt33829" class="remain-cnt" value="0" />
	    									<input type="hidden" id="limitCnt33829" class="limit-cnt" value="20" />
	    									<label for="ckrw33829">
	    									<p class="sum">89,000원 펀딩합니다.</p>
	    									<p class="number">얼리버드 (고미볼 1세트)
		    									
		    										
		    										<span class="soldout">(마감)</span>
		    										
		    								</p>
	    									<p class="text">정상가 159,000원 (할인율 44%)<br>고미볼(흰색) 1set</p>
	    									<p class="date"> 
	    										
	    										배송비 3,000원
	    										 | 리워드 제공 예상일 : 
	    										 
	    										 	
	    												
	    										 		
													    
														<span>2018년 06월</span>
														<span>말 (21~말일) 예정</span>
	    										 	
	    										 	
	    										 
											</p>
	    									</label>
	    								
	    									<div class="checked-area hidden">
	    										<div class="amount">
	    											<p class="title">수량</p>
	    											<p class="input-area">
	    												<button type="button" onclick="changeQty('minus', 33830)" class="icon-remove-box-o"><img src="/finalp/resources/images/accountimages/minus.png" alt="" width="15px" height="15px"></button>
	    												<input type="text" id="qty33830" class="reward-qty" value="0" />
	    												<button type="button" onclick="changeQty('plus', 33830)" class="icon-add-box-o"><img src="/finalp/resources/images/accountimages/plus.png" alt="" width="15px" height="15px"></button>
	    											</p>
	    										</div>
	    										 
	    									</div>
	    								</dd>
	    							</dl>
									</div>
	    						</li>
	    							
	    					</ul>
	    				</div>
	    			</form>

				<div class="btn-wrap">
    				<p class="confirm">우리 아이를 혼자 두지 마세요. 반려동물용 인공지능로봇 [고미볼]에 <span id="sumTotalNum">0</span> 원을 펀딩합니다.</p>
    				<button class="btn-rd-violet">다음 단계로 &gt;</button>
    			</div>

</div>
<c:import url="../footer.jsp"/>
</body>
</html>

