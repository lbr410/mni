<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>    
<jsp:useBean id="udto" class = "com.mni.userInfo.userInfoDTO"></jsp:useBean>
<jsp:setProperty property = "*" name = "udto" />
<jsp:useBean id="udao" class = "com.mni.userInfo.userInfoDAO"></jsp:useBean>
<%
 int join = udao.userjoin(udto);
if(join > 0){
	%>
	<script>
		window.alert('<%=udto.getUser_id()%>님 환영합니다.');
		location.href = '/mni/index.jsp';
	</script>
	<%
}
%>