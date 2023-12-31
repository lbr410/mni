<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="adao" class="com.mni.admin.AdminDAO"></jsp:useBean>
<%
request.setCharacterEncoding("utf-8"); //전송방식 때문에 인코딩 바꿈
String admin_id=request.getParameter("adminlogin_id"); //관리자 id 입력 값 받기
String admin_pwd=request.getParameter("adminlogin_pwd"); //관리자 pwd 입력 값 받기
String admin_saveid=request.getParameter("admin_saveid"); //아이디 저장 체크박스 값 받기
String admin_auto=request.getParameter("admin_auto"); //자동 로그인 체크박스 값 받기
boolean result=adao.adminLogin(admin_id, admin_pwd); //로그인 성공하면 true 실패하면 falue 반환
if(result){ 
	if(admin_saveid!=null){ //아이디 저장 체크 시 30일간 쿠키 생성
		Cookie saveid=new Cookie("admin_saveid",admin_id);
		saveid.setMaxAge(60*60*24*30);
		response.addCookie(saveid);
	}else{ //체크 해제 시 쿠키 제거
		Cookie ck=new Cookie("admin_saveid",admin_id);
		ck.setMaxAge(0);
		response.addCookie(ck);
	}if(admin_auto!=null){ //자동 로그인 체크 시 365일간 쿠키 생성
		Cookie auto=new Cookie("admin_auto",admin_id);
		auto.setMaxAge(60*60*24*365);
		response.addCookie(auto);
	}
	session.setAttribute("admin_saveid", admin_id); //관리자 id를 세션에 저장
	%>
	<script>
	location.href='/mni/admin/ordList.jsp';
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
