<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>멍냥이 : 장바구니</title>
</head>
<link rel="stylesheet" type="text/css" href="/mni/css/usercart.css">
<script>
	function count(type) {
		var count = document.cart.order_count.value;
		
		if(type === 'plus') {
			number = parseInt(count) + 1;
		} else if(type === 'minus') {
			number = parseInt(count) - 1;
		}
		
		document.cart.order_count.value = number;
	}
</script>
<body>
<%@ include file="../header.jsp" %>
<section>
	<article>
	<br>
	<h1>장바구니</h1>
	<form name="cart" action="" method="post">
	<table>
		<tr>
			<td class="td0">
			<img src="/mni/img/main.jpeg" alt="상품이미지" class="prodImg"></td>
			<td class="td1"><div class="brandfontSize">로얄캐닌</div>
			<div class="fontSize">로얄캐닌 인도어 8kg</div></td>
			<td class="td2">
				<input type="button" value="-" class="countBtn" onclick="count('minus')">
				<input type="text" name="order_count" value="1" class="countText">
				<input type="button" value="+" class="countBtn" onclick="count('plus')"></td>
			<td class="fontSize2 td3">100,000원</td>
			<td class="td4"><input type="submit" value="삭제" class="deleteBtn"></td>
		</tr>
		<tr>
			<td class="td0">
			<img src="/mni/img/main.jpeg" alt="상품이미지" class="prodImg"></td>
			<td class="td1"><div class="brandfontSize">기타</div>
			<div class="fontSize">차오츄르 4p</div></td>
			<td class="td2">
				<input type="button" value="-" class="countBtn" onclick="count('minus')">
				<input type="text" name="order_count" value="2" class="countText">
				<input type="button" value="+" class="countBtn" onclick="count('plus')"></td>
			<td class="fontSize2 td3">25,000원</td>
			<td class="td4"><input type="submit" value="삭제" class="deleteBtn"></td>
		</tr>
		<tr class="orderTd">
			<td colspan="5">
			<input type="button" value="총 10개 | 50,000원 주문하기" class="orderBtn"></td>
		</tr>
	</table>
	</form>
	</article>
</section>
<%@ include file="../footer.jsp" %>
</body>
</html>