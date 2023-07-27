<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id = "udao" class = "com.mni.userInfo.userInfoDAO"></jsp:useBean>
<%
String user_id = request.getParameter("id");
Boolean id = udao.userIdCheck(user_id);
if(id){
	%>
	<script>
	opener.document.getElementById('idchecking_false').style.display = '';
	location.href = '/mni/join.jsp';
	</script>
	<%
}else{
	%>
	<script>
	opener.document.join.user_id.value = '<%=user_id%>';
	opener.document.getElementById('idchecking_true').style.display = '';
	window.self.close();
	</script>
	<%
}
%>