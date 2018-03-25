<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  
<style>
.gnbsub-menu>h1{
	margin-top:0px;
}
</style>
</head>
<body>

<c:import url="../header.jsp"></c:import>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="/finalp/resources/css/paymentStyle.css" />

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

  <script type="text/javascript" src="/finalp/resources/js/paymentScript.js" charset="UTF-8"></script>

<script>

$(function() {

		var id = "#ckrw"+${ gift_id };
		var idata = $(id).attr("i-data");
		
		console.log(idata);
				
		$(id).attr("checked", true);
		$("."+idata).removeClass("hidden");
		
		//종료일 받아오기
		var e_date = $('#end_date').val();
		var year = e_date.substr(0,4);
		var month = Number(e_date.substr(5,2))+1;
		var date = Number(e_date.substr(8,2))+14;
		var dd = "";
		
		if(month != 2 ){
			if(date <= 20){
				dd="중순(11~20일)";
			}else if(date <= 30){
				dd="말일(21~말일)";
			}else if(date <= 40){
				dd="초(1~10일)";
				month += 1;
			}else{
				dd="중순(11~20일)";
				month += 1;
			}
		}else{
			if(date <= 20){
				dd="중순(11~20일)";
			}else if (date <=  28){
				dd="말일(21~말일)";
			}else if (date <=38){
				dd="초(1~10일)";
				month += 1;
			}else {
				dd="중순(11~20일)";
				month += 1;
			}
		}
		
		$(".d_month").text(year+"년 "+month+"월 ");
		$(".d_date").text(dd);
		
		jQuery("#myModal").modal({backdrop: 'static', keyboard: false});
});



</script>


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
          <a href="javascript:history.back();" class="btn less back"><img src="/finalp/resources/images/paymentimages/left arrow.png" height="20" width="20"> &nbsp; <span class="mid">스토리로 돌아가기</span></a>
		  <p class="title"><strong>잠깐!</strong> 펀딩과 쇼핑이 어떻게 다른지 확인 후 펀딩을 진행하세요</p>
		
		<div class="wz-form large" id="reward-notice-form">
          <dl>
            <dt><input type="checkbox" id="check1" name="check-b"><label for="check1"> &nbsp; 바로 결제되지 않아요</label></dt>
            <dd>
              <p>지금 펀딩하시면 <strong>결제 예약</strong>되며, 목표금액 달성 시, <strong>2018.03.26</strong>에 모두 함께 결제됩니다.</p>
              <p><em>수수료 타입에 따라 목표 금액과 상관없이 진행되는 경우도 있습니다.</em></p>
            </dd>
			<dt><input type="checkbox" id="check2" name="check-b"><label for="check2"> &nbsp; 펀딩 종료 후에는 취소할 수 없어요</label></dt>
            <dd>
              <p>리워드 결제 예약 취소와 변경은 <strong>프로젝트 펀딩기간 중</strong>에만 가능합니다.<br>펀딩 취소는 <strong>2018.03.25</strong>까지 가능합니다. 이후로는 취소가 불가합니다.
            </p></dd>
            <dt><input type="checkbox" id="check3" name="check-b"><label for="check3"> &nbsp; 바로 리워드가 발송되지 않아요</label></dt>
            <dd>
              <p>리워드는 메이커가 <strong>약속한 날짜</strong>에 발송됩니다.<br>선택한 리워드의 발송 예정일을 확인한 후에 펀딩해 주세요.</p>
              <p><em>리워드 펀딩 특성상 발송이 지연되거나 불가할 수 있습니다.<br>스토리 하단의 리워드 발송 예상 변동 기간 및 교환, 환불, AS 정책을 참고해주세요.</em></p>
            </dd>
          </dl>
        </div>

        </div>
        <div class="modal-footer" id="reward-footer">
         <button type="button" class="btn" id="closemodal" data-dismiss="modal" disabled="true">계속해서 펀딩하기</button>
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
				<td id="back"><a href="#"><img src="/finalp/resources/images/paymentimages/left-arrow2.png" height="20" width="20"> &nbsp; <span>스토리로 돌아가기</span></a></td>
				<td id="reward-name">${ p.project_name }</td>
				<td id="seller">
				<h4><img class="img_round" src="resources/images/mypageProfiles/${ p.profile_img_rename }" /> &nbsp; ${ p.member_name }</h4></td>
				</tr>
				</table>
</div>
    	
    		<div class="wpurchase-wrap" >
    			<div class="wpurchase-step">
    				<ol>
    					<li class="active"><em>리워드<br/>선택</em></li>
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
	    					<input type="hidden" id="end_date" value="${ p.end_date }"/>
	    					
	    					<c:forEach items="${ glist }" var="glist" varStatus="gstatus">
	    						
	    						<li>
									<div class="reward-background">
	    							<dl class="reward-box">
	    								<dt><input type="checkbox" id="ckrw${ glist.gift_id }" class="reward-check" name="rewardId" value="${ glist.gift_id }" onclick="checkboxEvent1(this.value)" i-data="${ gstatus.index }"/><label for="ckrw${ glist.gift_id }"> </label></dt>
	    								<dd>
	    									
	    									<label for="ckrw${ glist.gift_id }">
	    									<p class="sum">${ glist.support_price }원 펀딩합니다. 
		    									<c:if test="${ glist.capacity > 0 }">
		    										<span class="remains">(${ glist.remain }개 남음)</span></p>
		    									</c:if>
	    									<p class="number">
	    										
		    									<c:forEach items="${ ilist }" var="ilist">
		    										<c:if test="${ glist.gift_id == ilist.gift_id }">
		    										 	${ ilist.item_name } (${ ilist.count } EA)<br>
		    										</c:if>   
		    									</c:forEach>
	    									
		    									
		    										
		    										
		    										
		    									
		    								</p>
	    									
	    									<p class="date"> 
	    										<br>
	    										
	    										리워드 제공 예상일 : 
	    										 
	    										 	
	    												
	    												
	    												
														<span class="d_month"></span>
														<span class="d_date"></span>
	    										 	
	    										 	
	    										 
											</p>
	    									</label>
	    									<div class="checked-area hidden ${ gstatus.index }">
	    										<div class="amount">
	    											<p class="title">수량</p>
	    											<p class="input-area">
	    												<button type="button" onclick="changeQty('minus', ${ glist.gift_id })" class="icon-remove-box-o"><img src="/finalp/resources/images/paymentimages/minus.png" alt="" width="15px" height="15px"></button>
	    													<input type="text" name="qty" id="qty${ glist.gift_id }" class="reward-qty" value="0" price="${ glist.support_price }" index="${ gstatus.index }" maxP="${ glist.remain }" capacity="${ glist.capacity }"/>
	    												<button type="button" onclick="changeQty('plus', ${ glist.gift_id })" class="icon-add-box-o"><img src="/finalp/resources/images/paymentimages/plus.png" alt="" width="15px" height="15px"></button>
	    											</p>
	    										</div>
	    										 
	    									</div>
	    								</dd>
	    							</dl>
									</div>
	    						</li>
	    					</c:forEach>
	    					
	    					</ul>
	    				</div>
	    			</form>

				<div class="btn-wrap">
					<input type="hidden" id="total_price" value="0"/>
    				<p class="confirm">${ p.project_name }에 <span id="sumTotalNum">0</span> 원을 펀딩합니다.</p>
    				
    				<button class="btn-rd-violet" onclick="secondPage('${ p_id }','${ m_id }')">다음 단계로 &gt;</button>
    			</div>

</div>
</div>
<c:import url="../footer.jsp"/>
</body>
</html>

