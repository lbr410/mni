<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="cdto" class="com.mni.cart.CartDTO"></jsp:useBean>
<jsp:setProperty property="*" name="cdto" />
<jsp:useBean id="cdao" class="com.mni.cart.CartDAO"></jsp:useBean>
<%
	String prod_idx_s = request.getParameter("prod_idx");
	int prod_idx = Integer.parseInt(prod_idx_s);
	request.setCharacterEncoding("UTF-8");
	
	if(cdao.duplicateProdInTheCart(cdto)) {
		cdao.duplicateCartUpdate(cdto);
	} else {
		cdao.cartInsert(cdto);
	}
%>
<script>
	window.alert('장바구니에 담았습니다.');
	location.href='/mni/product/product.jsp?idx=<%=prod_idx%>';
</script>