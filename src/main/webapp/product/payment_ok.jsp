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
	
	for(int i=0; i<cart.size(); i++) {
		int count = cart.get(i).getCart_count();
		int price = cart.get(i).getCart_price();
		int prodIdx = cart.get(i).getProd_idx();
		odao.buyProduct(idx, odto, count, price, prodIdx);
	}
	
	session.removeAttribute("cart");
%>
<script>
	window.alert('주문 완료');
	location.href='/mni/index.jsp';
</script>