<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.mni.userInfo.*" %>
<jsp:useBean id="udao" class="com.mni.userInfo.userInfoDAO" scope="session"></jsp:useBean>
<%
request.setCharacterEncoding("utf-8");

String userpwd=request.getParameter("pwd");


if(userpwd!=""){
	/*String userpwd=request.getAttribute("pwd");
	String dbpwd=udao.userjoin(userpwd);*/
	if(userpwd.equals("dbpwd")){
		%>
		<script>
		location.href='userinfo.jsp';
		</script>
		<%
	}	
}else{
	%>
	<script>
	window.alert('비밀번호를 입력해주세요.');
	location.href='usercheck.jsp';
	</script>	
	<%
}

%>