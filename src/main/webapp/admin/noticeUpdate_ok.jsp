<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.mni.notice.*" %>
<jsp:useBean id="ndao" class="com.mni.notice.NoticeDAO"></jsp:useBean>
<%
request.setCharacterEncoding("utf-8");
%>
<%
String usertitle=request.getParameter("notice_title");
String usercontent=request.getParameter("notice_content");

String idx_s=request.getParameter("idx");
int idx=Integer.parseInt(idx_s);
int result=ndao.noticeUpdate(usertitle, usercontent, idx);

String msg=result>0?"수정 완료":"수정 실패";
%>
<script>
window.alert('<%=msg%>');
location.href='notice.jsp';
</script>