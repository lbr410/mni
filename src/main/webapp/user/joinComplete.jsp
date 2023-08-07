<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.mni.userInfo.*" %>
<%request.setCharacterEncoding("utf-8"); %>    
<jsp:useBean id="udao" class = "com.mni.userInfo.userInfoDAO"></jsp:useBean>
<%

String id = request.getParameter("user_id");
String name = request.getParameter("user_name");
String pwd = request.getParameter("user_pwd");
String tel = request.getParameter("user_tel");
String user_jumin_front = request.getParameter("user_jumin_front");
String user_jumin_back = request.getParameter("user_jumin_back");
String user_jumin = user_jumin_front+user_jumin_back;
System.out.println(user_jumin);

String user_zip_s = request.getParameter("user_zip");
int user_zip = Integer.parseInt(user_zip_s);
String user_addr1 = request.getParameter("user_addr1");
String user_addr2 = request.getParameter("user_addr2");
String user_email = request.getParameter("user_email");

userInfoDTO udto = new userInfoDTO(id,name,pwd,tel,user_jumin,user_zip,user_addr1,user_addr2,user_email);  

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