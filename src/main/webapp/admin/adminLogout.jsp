<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String admin_id=(String)session.getAttribute("admin_saveid"); //세션에 저장한 관리자 id값
Cookie auto=new Cookie("admin_auto",admin_id); //로그아웃 눌렀을 때 쿠키 제거
auto.setMaxAge(0);
response.addCookie(auto);
session.invalidate(); //세션 삭제
%>
<script>
location.href='/mni/admin/index_admin.jsp';
</script>