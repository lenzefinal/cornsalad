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

  <script type="text/javascript" src="/finalp/resources/js/paymentScript.js" charset="UTF-8"></script>


<script>

$(function() {

		var id = "#ckrw"+${ product_id };
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
});




</script>

</head>
<body>

<c:import url="../header.jsp"></c:import>

<link rel="stylesheet" href="/finalp/resources/css/paymentStyle.css" />

  
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
    					<li class="active"><em>물품<br/>선택</em></li>
    					<li><em>결제 하기</em></li>
    					<li><em>소문내기</em></li>    					
    				</ol>
    			</div>

				<div class="top-area">
	    					<h3><em>물품 선택</em></h3>


	    		</div>

				<form name="purchaseForm" id="purchaseForm" method="post">
					<div id="reward-list">
	    					<ul>
	    					<input type="hidden" id="end_date" value="${ p.end_date }"/>
	    					
	    					<c:forEach items="${ prlist }" var="prlist" varStatus="prstatus">
	    						
	    						<li>
									<div class="reward-background">
	    							<dl class="reward-box">
	    								<dt><input type="checkbox" id="ckrw${ prlist.product_id }" class="reward-check" name="rewardId" value="${ prlist.product_id }" onclick="checkboxEvent1(this.value)" i-data="${ prstatus.index }"/><label for="ckrw${ prlist.product_id }"> </label></dt>
	    								<dd>
	    									
	    									<label for="ckrw${ prlist.product_id }">
	    									<p class="sum">${ prlist.product_price }원 <br>
		    									${ prlist.product_name }
	    										
		    								</p>
	    									
	    									<p class="date"> 
	    										<br>
	    										
	    										공동구매 배송 예상일 : 
	    										 
	    										 	
	    												
	    												
	    												
														<span class="d_month"></span>
														<span class="d_date"></span>
	    										 	
	    										 	
	    										 
											</p>
	    									</label>
	    									<div class="checked-area hidden ${ prstatus.index }">
	    										<div class="amount">
	    											<p class="title">수량</p>
	    											<p class="input-area">
	    												<button type="button" onclick="changeQty('minus', ${ prlist.product_id })" class="icon-remove-box-o"><img src="/finalp/resources/images/paymentimages/minus.png" alt="" width="15px" height="15px"></button>
	    													<input type="text" name="qty" id="qty${ prlist.product_id }" class="reward-qty" value="0" price="${ prlist.product_price }" index="${ prstatus.index }" maxP="0" capacity="0"/>
	    												<button type="button" onclick="changeQty('plus', ${ prlist.product_id })" class="icon-add-box-o"><img src="/finalp/resources/images/paymentimages/plus.png" alt="" width="15px" height="15px"></button>
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
    				
    				<button class="btn-rd-violet" onclick="secondpPage('${ p.project_name }','${ p_id }','${ loginUser.member_name }')">다음 단계로 &gt;</button>
    			</div>

</div>
</div>
<c:import url="../footer.jsp"/>
</body>
</html>

