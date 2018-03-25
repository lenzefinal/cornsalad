<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
 <head>
  <meta charset="UTF-8">
<title>first</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.2.js"></script>

</head>
 <body>
<input type="hidden" id="p_id" value="${ p_id }">
<input type="hidden" id="g_ids" value="${ g_ids }">
<input type="hidden" id="g_amounts" value="${ g_amounts }">
 <script>
var IMP = window.IMP; // 생략가능
IMP.init('imp06886046');  // 가맹점 식별 코드

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
    	var g_ids = $('#g_ids').val();
    	var g_amounts = $('#g_amounts').val();
    	
    	$.ajax({
    		url: "insertPay.do", //cross-domain error가 발생하지 않도록 주의해주세요
    		type: 'POST',
    		data: {
    			imp_uid : rsp.imp_uid,
	    		member_id : rsp.buyer_name,
	    		project_id : p_id,
	    		g_ids : g_ids,
	    		g_amounts : g_amounts,
	    		total_amount : rsp.paid_amount,
	    		pay_option : 'K'
    		}
    	}).done(function(data) {
    		//[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
    		if ( everythings_fine ) {
    			alert('결제에 성공했습니다!');
    			window.opener.location.replace("payment3.do?p_id="+p_id+"&payment_id="+rsp.imp_uid+"&m_id="+rsp.buyer_name);
    			window.close();
    		} else {
    			//[3] 아직 제대로 결제가 되지 않았습니다.
    			//[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
    		}
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