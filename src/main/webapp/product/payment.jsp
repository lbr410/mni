<%@ page import="com.mni.cart.CartDTO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.text.*" %>
<%@ page import="com.mni.userInfo.*" %>
<%@ page import="java.util.*" %>
<%
	request.setCharacterEncoding("UTF-8");
	
	ArrayList<CartDTO> cart = (ArrayList)session.getAttribute("cart");
	Integer idx = (Integer)session.getAttribute("sidx");
	
	int totalPrice = Integer.parseInt(request.getParameter("total_price"));
	DecimalFormat df = new DecimalFormat("#,##0원");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel = "stylesheet" type = "text/css" href = "/mni/css/payment.css">
</head>
<script>
function addrpopup(){
	window.open('/mni/product/productFindAddr.jsp','findaddr','width=500,height=300');
}
</script>
<body>
<jsp:useBean id="udao" class="com.mni.userInfo.userInfoDAO" scope="session"></jsp:useBean>
<%
	userInfoDTO dto = udao.paymentUserInfo(idx);
%>
<%@include file = "/header.jsp" %>
<section class = "sectionpay">
	<article>
		<h1>주문/결제</h1>
		<hr>
		<form name="payment" action="payment_ok.jsp" method="post">
		<h3>구매자 정보</h3>
		<table>
			<tr>
				<th>이름</th>
				<td><%=dto.getUser_name() %></td>
			</tr>
			<tr>
				<th class = "th">이메일</th>
				<td class = "td"><%=dto.getUser_email() %></td>
			</tr>
			<tr>
				<th>휴대폰 번호</th>
				<td><%=dto.getUser_tel() %></td>
			</tr>
		</table>
		
		<h3>배송지</h3>
		<table>
			<tr>
				<th>받는사람</th>
				<td><input type="text" name="order_recie" value="<%=dto.getUser_name() %>"></td>
			</tr>
			<tr>
				<th class = "th">배송주소</th>
				<td class = "td">
					<input type = "text" name = "order_zip" class = "add" value="<%=dto.getUser_zip() %>" readonly>
					<input type = "button" value = "주소검색" onclick = "addrpopup()" class = "button1"><br>
					<input type = "text" name = "order_addr1" value="<%=dto.getUser_addr1() %>" readonly class = "inputtext"><br>
					<input type = "text" name = "order_addr2" value="<%=dto.getUser_addr2() %>" class = "inputtext">
				</td>
			</tr>
			<tr class = "textarea">
				<th>배송 요청사항</th>
				<td><input type = "text" name = "request" maxlength="20" placeholder="요청사항을 적어주세요." class = "request"></td>
			</tr>
		</table>
		<h3>결제 정보</h3>
		<table>
			<tr>
				<th class = "th">총결제금액</th>
				<td class = "td"><%=df.format(totalPrice) %></td>
			</tr>
			<tr>
				<th>결제 방법</th>
				<td>
				<input type = "radio" name = "order_type" value = "card" required>&nbsp;신용카드&nbsp;
				<input type = "radio" name = "order_type" value = "tel" required>&nbsp;휴대폰<br>
				</td>
			</tr>
		</table>
		<input type = "submit" value = "결제하기" class = "button">
		</form>
	</article>
</section>
<%@include file = "/footer.jsp" %>
</body>
</html>