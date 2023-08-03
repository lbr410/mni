<%@page import="java.text.DecimalFormat"%>
<%@ page import="com.mni.cart.CartDTO"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.mni.ord.*" %>
<%@ page import="java.util.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="odto" class="com.mni.ord.OrdDTO"></jsp:useBean>
<jsp:setProperty property="*" name="odto" />
<jsp:useBean id="odao" class="com.mni.ord.OrdDAO"></jsp:useBean>
<%
	ArrayList<CartDTO> cart = (ArrayList)session.getAttribute("cart");

	int idx = (int)session.getAttribute("sidx");
	
	DecimalFormat df = new DecimalFormat("#,##0원");
	
	int total_price = 0;
	for(int i=0; i<cart.size(); i++) {
		int count = cart.get(i).getCart_count();
		int price = cart.get(i).getCart_price();
		int prodIdx = cart.get(i).getProd_idx();
		odao.buyProduct(idx, odto, count, price, prodIdx);
		total_price += (count*price);
	}
	
	String order_type = odto.getOrder_type().equals("card") ? "신용카드" : "휴대폰";
	String order_req = odto.getOrder_req()==null ? "배송 전에 연락주세요." : odto.getOrder_req();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>멍냥이 : 결제완료</title>
<link rel="stylesheet" type="text/css" href="/mni/css/orderComplete.css">
</head>
<body>
<%@include file="/header.jsp" %>
	<section>
	<article>
		<div class="orderComplete">
		<h1>❤️주문이 완료되었습니다. 멍냥이를 이용해주셔서 감사합니다. 😘❤️</h1>
		<hr class="hrStyle">
		</div>
		<div class="ordUser">
		<h2>🐶 받는 사람 정보</h2>
		<div class="ordCom">
		<span class="menu">받는사람</span>
		<span class="span"><%=odto.getOrder_recie() %></span>
		</div>
		<div>
		<div class="menu divFloat">받는주소&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
		<div class="span divWidth"><%=odto.getOrder_zip() %></div>
		<div class="menu divFloat">　　　　&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
		<div class="span divWidth"><%=odto.getOrder_addr1() %></div>
		<div class="menu divFloat divHeight">　　　　&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
		<div class="span divWidth"><%=odto.getOrder_addr2() %></div>
		</div>
		<div>
		</div>
		<div class="ordCom">
		<span class="menu">요청사항</span>
		<span class="span"><%=order_req %></span>
		</div>
		</div>
		<div class="ordPay">
		<div class="line">
		<h2>😺 결제 정보</h2>
		<div class="ordCom">
		<span class="menu">결제방법</span>
		<span class="span"><%=order_type %></span>
		</div>
		<div>
		<span class="menu">결제금액</span>
		<span class="span"><%=df.format(total_price) %></span>
		</div>
		</div>
		</div>
	</article>
	</section><br><br><br><br>
	<hr class="hrStyle">
	<section>
	<article>
	<form action="">
		<input type="button" value="주문 상세보기" id="ordButton" onclick="location.href='/mni/user/orderdetail.jsp';">
		<input type="button" value="쇼핑 계속하기" id="mainButton" onclick="location.href='/mni/index.jsp';">
	</form>
</article>
</section>
<%
	session.removeAttribute("cart");
%>
<%@include file="/footer.jsp"%>
</body>
</html>