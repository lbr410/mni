<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id = "udao" class = "com.mni.userInfo.userInfoDAO"></jsp:useBean>
<%
	int idx = (int)session.getAttribute("sidx");
	if(idx != 0 && !(idx < 0)){
		Boolean resualt = udao.userUnregister(idx);
		if(resualt){
			session.invalidate();
			%>
			<script>
				window.alert('회원탈퇴가 완료되었습니다.');
				location.href = '/mni/index.jsp';
			</script>
			<%
		}else{
			%>
			<script>
				window.alert('회원탈퇴 실패.. 관리자에게 문의바랍니다.');
				window.history.back();
			</script>
			<%
		}
	}
%>