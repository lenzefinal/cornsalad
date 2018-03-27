<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html>
 <head>
  <meta charset="UTF-8">
<title>pay-card</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.2.js"></script>

</head>
 <body>
<input type="hidden" id="p_id" value="${ p_id }">
<input type="hidden" id="p_category" value="${ p_category }">
<input type="hidden" id="m_id" value="${ m_id }">

<c:if test="${ p_category eq 'PC-FUND' }">
	<input type="hidden" id="g_ids" value="${ g_ids }">
	<input type="hidden" id="g_amounts" value="${ g_amounts }">

</c:if>
<c:if test="${ p_category eq 'PC-PROD' }">
	<input type="hidden" id="p_ids" value="${ p_ids }">
	<input type="hidden" id="p_amounts" value="${ p_amounts }">
</c:if>

 <script>
var IMP = window.IMP; // 생략가능
IMP.init('imp21520851');  // 가맹점 식별 코드

IMP.request_pay({
    pg : 'danal_tpay', //아임포트 관리자에서 danal_tpay를 기본PG로 설정하신 경우는 생략 가능
    pay_method : 'card', //card(신용카드), trans(실시간계좌이체), vbank(가상계좌), phone(휴대폰소액결제)
    merchant_uid : 'merchant_' + new Date().getTime(), //상점에서 관리하시는 고유 주문번호를 전달
    name : "${ p_name }",
    amount : '${ p_price }',
    buyer_name : "${ m_id }",
   /*  buyer_tel : "'${ p_id }'", //누락되면 카드사 인증에 실패할 수 있으니 기입해주세요 */
	company:'cornsalad'
}, function(rsp) {
    if ( rsp.success ) {
    	//[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
		
    	var p_id = $('#p_id').val();
    	var p_category = $('#p_category').val();
    	var m_id = $('#m_id').val();
    	
    	if(p_category == 'PC-FUND'){
	    	var g_ids = $('#g_ids').val();
	    	var g_amounts = $('#g_amounts').val();
	    	var p_ids = '';
	    	var p_amounts ='';
    	}else{
    		var g_ids = '';
	    	var g_amounts ='';
    		var p_ids = $('#p_ids').val();
    		var p_amounts = $('#p_amounts').val();
    	}
    	
    	$.ajax({
    		url: "insertPay.do", //cross-domain error가 발생하지 않도록 주의해주세요
    		type: 'POST',
    		data: {
    			imp_uid : rsp.imp_uid,
	    		member_id : m_id,
	    		project_id : p_id,
	    		g_ids : g_ids,
	    		g_amounts : g_amounts,
	    		p_ids : p_ids,
	    		p_amounts : p_amounts,
	    		total_amount : rsp.paid_amount,
	    		pay_option : 'C',
	    		p_category : p_category
    		}
    	}).done(function(data) {
    		alert('결제에 성공했습니다!');
    		if(p_category == 'PC-FUND'){
    			window.opener.location.replace("payment3.do?p_id="+p_id+"&payment_id="+rsp.imp_uid+"&m_id="+rsp.buyer_name); 
    		}else{
    			window.opener.location.replace("p_payment3.do?p_id="+p_id+"&payment_id="+rsp.imp_uid+"&m_id="+rsp.buyer_name);
    		}
    		window.close();
    		
    	});
    } else {
        var msg = '결제에 실패하였습니다.';
        msg += '에러내용 : ' + rsp.error_msg;
        
        alert(msg);
    }
});
</script>


 </body>
</html>
