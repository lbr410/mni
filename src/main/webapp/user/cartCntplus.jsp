<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="cdao" class="com.mni.cart.CartDAO"></jsp:useBean>
<%
	String prod_idx_s = request.getParameter("prod_idx");
	int prod_idx = Integer.parseInt(prod_idx_s);
	int count = cdao.totalCntPlus(prod_idx);
%>
<script>
	location.href = document.referrer;
</script>