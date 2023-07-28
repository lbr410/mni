<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.mni.userInfo.*" %>
<jsp:useBean id="udao" class="com.mni.userInfo.userInfoDAO" scope="session"></jsp:useBean>
<%
request.setCharacterEncoding("UTF-8");

//넘어온 아이디와 패스워드 받기
String user_id=request.getParameter("id");
String user_pwd=request.getParameter("pwd");
String idremember=request.getParameter("idremember");
userInfoDTO result = udao.loginCheck(user_id, user_pwd);

	if(result!=null){
		if(idremember!=null){
			Cookie ck = new Cookie("idremember",user_id);
			ck.setMaxAge(60*60*24*30);
			response.addCookie(ck);
		}else{
			Cookie ck = new Cookie("idremember",user_id);
			ck.setMaxAge(0);
			response.addCookie(ck);
		}
		String user_name=udao.getUserInfo(user_id);
		session.setAttribute("sid",user_id);
		session.setAttribute("sname",user_name);
		session.setAttribute("spwd",user_pwd);
		
		%>
		<script>
		location.href='/mni/index.jsp';
		</script>
		<%
	}else{
		%><script>
		window.alert('ID 또는 비밀번호가 잘못되었습니다.');
		location.href='/mni/user/login.jsp';
		</script><%
	}
	%>
	
	
