<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
<jsp:useBean id = "odao" class = "com.mni.ord.OrdDAO"></jsp:useBean>
<%
String order_idx_s = request.getParameter("ord_idx");
int order_idx = Integer.parseInt(order_idx_s);
int result = odao.userOrderCancel(order_idx);
if(result > 0){
	%>
	<script>
		window.alert('주문이 취소되었습니다.');
		location.href = 'orderdetail.jsp';
	</script>
	<%
}else{
	%>
	<script>
	window.alert('주문취소실패.. 관리자에게 문의바랍니다.');
	location.href = 'orderdetail.jsp';
	</script>
	<%
}
%>