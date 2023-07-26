<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel = "stylesheet" type = "text/css" href = "/mni/css/header.css">
<link rel = "stylesheet" type = "text/css" href = "/mni/css/orderdetail.css">
</head>
<body>
<%@include file = "../header.jsp" %>
<section class = "ordersection">
	<article>
	
	<div class = "userimg">
		<div class = "username">사용자명</div>
	</div>
		
	<h1>***님의 주문내역</h1>
	<%for(int i = 0 ; i < 10 ; i++){ %>
	<h3>2023.01.01</h3>
	<hr>
	<div class = "productimg"></div>
		<ul class = "orderlist">	
				<li>상품명</li>
				<li>주문번호</li>
				<li>결제방법</li>
				<li>결제금액</li>
			</ul>
			<div class = "a">
			배송유무
			<input type = "button" value = "주문취소" class = "button">
			<input type = "button" value = "수취확인" class = "button">
			</div>
			<%} %>
	</article>
</section>
<%@include file = "../footer.jsp" %>
</body>
</html>