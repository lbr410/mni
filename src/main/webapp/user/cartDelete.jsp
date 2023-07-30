<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="cdao" class="com.mni.cart.CartDAO"></jsp:useBean>
<%
	String prod_idx_s = request.getParameter("prod_idx");
	if(prod_idx_s==null || prod_idx_s.equals("")) {
		prod_idx_s = "0";
	}
	
	int prod_idx = Integer.parseInt(prod_idx_s);
	Integer idx = (Integer)session.getAttribute("sidx");
	
	int count = cdao.cartDelete(idx, prod_idx);
%>
<script>
	location.href = '/mni/user/usercart.jsp';
</script>