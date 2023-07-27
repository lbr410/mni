<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="adao" class="com.mni.admin.AdminDAO"></jsp:useBean>
<%
request.setCharacterEncoding("utf-8"); //전송방식 때문에 인코딩 바꿈
String admin_id=request.getParameter("adminlogin_id"); //관리자 id 입력 값 받기
String admin_pwd=request.getParameter("adminlogin_pwd"); //관리자 pwd 입력 값 받기
String admin_checkbox=request.getParameter("admin_checkbox"); //아이디 저장 체크박스 값 받기
boolean result=adao.adminLogin(admin_id, admin_pwd); //로그인 성공하면 true 실패하면 falue 반환
if(result){
	if(admin_checkbox!=null){ //아이디 저장 체크 시 30일간 쿠키 생성
		Cookie ck=new Cookie("admin_checkbox",admin_id);
		ck.setMaxAge(60*60*24*30);
		response.addCookie(ck);
	}else{ //체크 해제 시 쿠키 제거
		Cookie ck=new Cookie("admin_checkbox",admin_id);
		ck.setMaxAge(0);
		response.addCookie(ck);
	}
	session.setAttribute("admin_id", admin_id); //관리자 id를 세션에 저장
	%>
	<script>
	location.href='ordList.jsp';
	</script>
	<%
}else{
	%>
	<script>
	window.alert('아이디 또는 비밀번호가 틀렸습니다.');
	location.href='index_admin.jsp';
	</script>
	<%
}
%>
