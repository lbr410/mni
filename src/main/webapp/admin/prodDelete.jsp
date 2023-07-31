<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.mni.product.*" %>
<jsp:useBean id="pdao" class="com.mni.product.ProductDAO"></jsp:useBean>
<%
String prod_idx_s = request.getParameter("prod_idx");
if(prod_idx_s == null || prod_idx_s.equals("")){
   %>
   <script>
   window.alert('잘못된 접근입니다.');
   location.href='/mni/admin/productList.jsp';
   </script>
   <%
}
int prod_idx = Integer.parseInt(prod_idx_s);
int result = pdao.prodDelete(prod_idx);
String msg = result>0?"삭제 완료":"삭제 실패";
%>
<script>
window.alert('<%=msg%>');
location.href='/mni/admin/productList.jsp';
</script>