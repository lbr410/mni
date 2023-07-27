<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
session.invalidate(); //세션 삭제
%>
<script>
location.href='/mni/admin/index_admin.jsp';
</script>