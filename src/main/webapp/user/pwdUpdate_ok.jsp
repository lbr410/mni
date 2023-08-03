<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8");%>
<jsp:useBean id = "udao" class = "com.mni.userInfo.userInfoDAO"></jsp:useBean>
<%
String id = request.getParameter("id");
String pwd = request.getParameter("user_pwd");
String juminfront = request.getParameter("juminfront");
String juminback = request.getParameter("juminback"); 
int result = udao.setUserUpdatePwd(pwd, id, juminfront, juminback);
if(result > 0){
	%>
	<script>
		window.alert('비밀변호가 변경되었습니다.');
		location.href = 'login.jsp';
	</script>
	<%
}else{
	%>
	<script>
		window.alert('비밀변호 변경 실패..! 관리자에게 문의해주세요.');
		location.href = 'login.jsp';
	</script>
	<%	
}
%>
