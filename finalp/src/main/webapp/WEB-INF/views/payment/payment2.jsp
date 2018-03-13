<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
				<td id="reward-name">우리 아이를 혼자 두지 마세요. 반려동물용 인공지능로봇 [고미볼]</td>
				<td id="seller"><h4>(주) 고미랩스</h4></td>
				</tr>
				</table>
    		</div>
    	
    		<div class="wpurchase-wrap">
    			<div class="wpurchase-step">
    				<ol>
    					<li><em>리워드<br />선택</em></li>
    					<li class="active"><em>결제 예약</em></li>
    					<li><em>소문내기</em></li>    					
    				</ol>
    			</div>


		<form name="purchaseForm" id="purchaseForm" method="post">
            <input type="hidden" id="campaignId" name="campaignId" value="14048"/>
            <input type="hidden" id="presenteeName" name="presenteeName" />
            <input type="hidden" id="contactNumber" name="contactNumber" />
            <input type="hidden" id="zipCode" name="zipCode" />
            <input type="hidden" id="address" name="address" />
            <input type="hidden" id="addressDetails" name="addressDetails" />
            <input type="hidden" id="applyPoint" name="applyPoint" value="0"/>
            <input type="hidden" id="email" name="email" value="cyh7957@naver.com" />
            <input type="hidden" id="addDonation" name="addDonation" value="0"/>
            <input type="hidden" id="dontShowNameYn" name="dontShowNameYn" value="" />
            <input type="hidden" id="dontShowAmountYn" name="dontShowAmountYn" value="" />
            <input type="hidden" name="secureStateBagKey" value="ZmVmOGI1ZGQtMzkxZC00ZGNmLWE1ZGMtNjNjZjY2MjE4MjE3T0RJek1UZGhabU10WmpjNU15MDBNREE0TFRneFlUZ3RPVFZtWVRSak9XSm1aamcw"/>
            
            <div class="wpurchase-order">
              <h3>리워드</h3>
              <div class="order-list">
                <ul>
                  
                  <li>
                    <p class="title">일반버드 (고미볼 1세트)</p>
                    <p class="text">정상가 159,000원 (할인율 38%)
고미볼(흰색) 1set</p>
                    <div class="info">
                      
                      <p class="sum"><em>수량 : 1개</em>99,000원</p>
                    </div>
                  </li>
                  <input type="hidden" name="choiceRewards[0].rewardId" value="26841" />
                <input type="hidden" name="choiceRewards[0].qty" value="1" />
                <input type="hidden" name="choiceRewards[0].sumAmount" value="99000" />
                <input type="hidden" name="choiceRewards[0].memo" value="" />
                  
                </ul>
              </div>
              <div class="order-addinfo">
                <dl>
                  <dt>배송비</dt>
                  <dd>3,000원</dd>
                </dl>
               
              </div>
              <div class="order-suminfo">
                <dl>
                  <dt>펀딩금액</dt>
                  <dd>99,000원</dd>
                </dl>
                <dl>
                  <dt>배송비</dt>
                  <dd>3,000원</dd>
                </dl>
                
                <dl class="total">
                  <dt>최종결제금액</dt>
                  <dd><input type="hidden" id="totalPrice" value="102000" />
                  <em id="totalPriceView">102,000</em>원</dd>
                </dl>
              </div>
            </div>
            <div class="wpurchase-delivery-wrap">
              
              <div class="wpurchase-notice">
                <p class="title">와디즈 리워드 배송 안내</p>
                <p class="text">펀딩에 대한 보답으로 메이커는 리워드를 약속한 배송일에 제공하기 위해 노력을 다합니다.<br/><br/>
                리워드의 배송은 메이커가 담당하는 의무로 프로젝트 스토리에 안내한 배송시작일에 배송 시작을 원칙으로 합니다.<br/><br/>
                다만, 프로젝트 진행 중 예기치 못한 사정으로 리워드 제작 및 배송 일정 변경이 있을 수 있음을 알려드립니다. 변경되는 배송일은 새소식으로 메이커가 직접 전해드립니다.<br/><br/>
                리워드 제품의 불량 또는 배송오류에 대한 문의 접수 및 교환 처리는 리워드를 제공하는 메이커가 직접 담당하고 있습니다. 메이커에게 문의하기에 기재된 연락처로 직접 소통할 수 있습니다.</p>
              </div>
              
              <div class="wpurchase-supporter-info">
                <h3><em>펀딩 서포터</em></h3>
                <div class="wpurchase-input-box">
                  <dl>
                    <dt>이름</dt>
                    <dd><input type="text" id="supporterName" value="달보드레"/></dd>
                  </dl>
                  <dl>
                    <dt>이메일</dt>
                    <dd>cyh7957@naver.com</dd>
                  </dl>
                  <dl>
                    <dt>휴대폰 번호</dt>
                  
                        <dd>01088347957</dd>

                  </dl>
                  <div class="wpurchase-terms">
                    <p class="check-area">
                      <input type="checkbox" id="cktm04">
                      <label for="cktm04"> <span></span> (필수) 펀딩 진행에 대한 새소식 및 결제 관련 안내를 받습니다.</label>
                    </p>
                  </div>
                </div>
              </div>
              
              <div class="wpurchase-delivery">
                <h3><em>리워드 배송지</em></h3>
                
                <div class="delivery-list">
                  
                </div>
                <div class="deliver-new">
                  
                <div class="input-area">
                	<br>
                  <dl>
                    <dt>이름</dt>
                    <dd><input type="text" id="supporterName" value="달보드레"/></dd>
                  </dl>
                  <dl>
                    <dt>이메일</dt>
                    <dd>cyh7957@naver.com</dd>
                  </dl>
                  <dl>
                    <dt>휴대폰 번호</dt>
                    <dd>01088347957</dd>
                  </dl>
                  <dl>
                    <dt>배송지 주소</dt>
                    <dd>어쩌구 저쩌구 랄랄라</dd>
                  </dl>
                </div>
                </div>
                <div class="delivery-shippingMemo">
                  <div class="input-area">
                  <p class="title">배송 시 요청사항 (선택)</p>
                  <input type="text" name="shippingMemo" maxlength="50" placeholder="ex) 부재시 경비실에 보관해주세요."/>
                  <p class="subtext">해당 요청사항은 배송에 관련된 내용만 적어주세요.</p>
                  </div>
                </div>
              </div>
            </div>
            <hr>
            <div class="wpurchase-notice">
              <p class="title">결제시 유의사항</p>
              <ul>
                <li>잘못된 정보 기입으로 인한 불이익은 책임지지 않습니다.</li>
                <li>프로젝트 종료일(2018.03.26) 의 다음 영업일에 펀딩 성공여부에 따라 결제실행/결제취소가 진행됩니다.</li>
                <li>펀딩이 성공한 후에는 취소가 불가능합니다.</li>
                <li>펀딩이 성공한 후에 안내된 배송일부터 배송이 시작됩니다.</li>
              </ul>
            </div>
            <div id="wpurchaseType" class="wpurchase-type">
              <h3><em>결제예약 수단 선택</em></h3>
              <ul>
                <li><input type="radio" name="ra01" id="rdpt01" checked="checked" value="card" /><label for="rdpt01"> &nbsp; 신용(체크)카드</label></li>
                <li><input type="radio" name="ra01" id="rdpt02" value="kakao" /><label for="rdpt02"> &nbsp; 카카오 페이</label></li>
              </ul>
            </div>
            
          </form>
			<br>
			<hr>
				<div class="btn-wrap">
    				<p class="confirm">우리 아이를 혼자 두지 마세요. 반려동물용 인공지능로봇 [고미볼]에 <span id="sumTotalNum">0</span> 원을 펀딩합니다.</p>
    				<button class="btn-rd-violet" onclick="openPay()">다음 단계로 &gt;</button>
    			</div>
    			<button onclick="refund()">test RESTAPI</button>

</div>
</div>
<c:import url="../footer.jsp"/>
</body>
</html>

