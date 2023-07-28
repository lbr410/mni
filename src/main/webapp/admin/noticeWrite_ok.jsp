<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="ndao" class="com.mni.notice.NoticeDAO"></jsp:useBean>
<%
request.setCharacterEncoding("utf-8");
%>
<%
String usertitle=request.getParameter("notice_title");
String usercontent=request.getParameter("notice_content");

int result=ndao.noticeWirte(usertitle, usercontent);
String msg=result>0?"등록 성공":"등록 실패";

%>
<script>
window.alert('<%=msg%>');
location.href='notice.jsp';
</script>