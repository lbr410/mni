<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id = "udao" class = "com.mni.userInfo.userInfoDAO"></jsp:useBean>
<%
String user_id = request.getParameter("id");
Boolean id = udao.userIdCheck(user_id);
if(!(user_id.equals(""))){
if(id){
   %>
   <script>
   opener.document.join.idcheckbutton.value = 'f';
   opener.document.getElementById('idchecking_false').style.display = '';
   opener.document.getElementById('idchecking_true').style.display = 'none';
   opener.document.getElementById('idchecking_null').style.display = 'none';
   window.self.close();
   </script>
   <%
}else{
   %>
   <script>
   opener.document.join.user_id.value = '<%=user_id%>';
   opener.document.join.idcheckbutton.value = 't';
   opener.document.getElementById('idchecking_true').style.display = '';
   opener.document.getElementById('idchecking_false').style.display = 'none';
   opener.document.getElementById('idchecking_null').style.display = 'none';
   window.self.close();
   </script>
   <%
}

}else{
   %>
   <script>
   opener.document.join.idcheckbutton.value = 'n';
   opener.document.getElementById('idchecking_null').style.display = '';
   opener.document.getElementById('idchecking_true').style.display = 'none';
   opener.document.getElementById('idchecking_false').style.display = 'none';
   window.self.close();
   </script>
   <%
}
%>