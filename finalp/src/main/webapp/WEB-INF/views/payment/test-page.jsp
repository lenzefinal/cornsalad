<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>test-page</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>
<body>

<script type="text/javascript" src="/finalp/resources/js/paymentScript.js"></script>
<script>

</script>
<c:url var ="openpay" value="payment.do">
	<c:param name="p_id" value="152145778182347"/>
	<c:param name="g_id" value="1521503358293"/>
</c:url>
<c:url var ="openp_pay" value="p_payment.do">
	<c:param name="p_id" value="152159737628112"/>
	<c:param name="product_id" value="1521597494713"/>
</c:url>
<button onclick="location.href='${ openpay }'">결제하기 테스트</button>
<button onclick="test()">첫번째 상품 구매</button>
<button onclick="location.href='${ openp_pay}'">공동 구매 테스트</button>


</body>
</html>