<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="udto" class="com.mni.userInfo.userInfoDTO"></jsp:useBean>
<jsp:setProperty property="*" name="udto"/>
<jsp:useBean id="udao" class="com.mni.userInfo.userInfoDAO" scope="session"></jsp:useBean>

<%

int result=udao.setUserInfo(udto);
String msg=result>0?"수정 성공":"수정 실패 [빈칸을 채워주세요.]";

%>
<script>
window.alert('<%=msg%>');
location.href='userInfo.jsp';
</script>