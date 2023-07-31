<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.mni.userInfo.*" %>
<jsp:useBean id="udao" class="com.mni.userInfo.userInfoDAO" scope="session"></jsp:useBean>
<%
request.setCharacterEncoding("utf-8");
String userpwd=request.getParameter("pwd");
String pwd=(String)session.getAttribute("spwd");
if(pwd!=null){
	if(userpwd!=""){
		if(userpwd.equals(pwd)){
			%>
			<script>
			location.href='/mni/user/userInfo.jsp';
			</script>
			<%
		}else{
			%>
			<script>
			window.alert('비밀번호가 맞지 않습니다.');
			location.href='/mni/user/usercheck.jsp';
			</script>
			<%
		}
	}else{
		%>
		<script>
		window.alert('비밀번호를 입력해주세요.');
		location.href='/mni/user/usercheck.jsp';
		</script>	
	<%
	}
}else{
	%>
	<script>
	window.alert('로그인 후 사용 가능합니다.');
	location.href='/mni/user/login.jsp';
	</script>
	<%
}

%>