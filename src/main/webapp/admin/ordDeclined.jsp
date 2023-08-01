<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="odao" class="com.mni.ord.OrdDAO"></jsp:useBean>
<%
String order_idx_s = request.getParameter("order_idx");
if(order_idx_s == null || order_idx_s.equals("")){
	%>
	<script>
	window.alert('잘못된 접근입니다.');
	location.href='/mni/admin/ordList.jsp';
	</script>
	<%
}
int order_idx = Integer.parseInt(order_idx_s);
int result = odao.orderDeclined(order_idx);
String msg = result > 0 ? "승인이 거절되었습니다." : "승인 거절 실패";
%>
<script>
window.alert('<%=msg%>');
location.href='/mni/admin/ordList.jsp';
</script>