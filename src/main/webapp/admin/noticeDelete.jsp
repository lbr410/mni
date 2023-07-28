<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.mni.notice.*" %>
<jsp:useBean id="ndao" class="com.mni.notice.NoticeDAO"></jsp:useBean>
<%
request.setCharacterEncoding("utf-8");
%>
<%
String idx_s=request.getParameter("idx");
int idx=Integer.parseInt(idx_s);
int result=ndao.noticeDelete(idx);

String msg=result>0?"삭제 완료":"삭제 실패";
%>
<script>
window.alert('<%=msg%>');
location.href='notice.jsp';
</script>