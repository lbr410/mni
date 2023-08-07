<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id = "udao" class = "com.mni.userInfo.userInfoDAO"></jsp:useBean>
<%
String juminfront = request.getParameter("juminfront");
String juminback = request.getParameter("juminback");
Boolean jumin = udao.userJuminCheck(juminfront,juminback);
if(juminfront != null || juminback != null){
if(jumin){
   %>
   <script>
   opener.document.join.jumincheckbutton.value = 'f';
   opener.document.getElementById('juminchecking_false').style.display = '';
   opener.document.getElementById('juminchecking_true').style.display = 'none';
   opener.document.getElementById('juminchecking_null').style.display = 'none';
   window.self.close();
   </script>
   <%
}else{
   %>
   <script>
   opener.document.join.user_jumin_front.value = '<%=juminfront%>';
   opener.document.join.user_jumin_back.value = '<%=juminback%>';
   opener.document.join.jumincheckbutton.value = 't';
   opener.document.getElementById('juminchecking_false').style.display = 'none';
   opener.document.getElementById('juminchecking_true').style.display = '';
   opener.document.getElementById('juminchecking_null').style.display = 'none';
   window.self.close();
   </script>
   <%
}

}else{
   %>
   <script>
   opener.document.join.jumincheck.value = 'n';
   opener.document.getElementById('juminchecking_false').style.display = 'none';
   opener.document.getElementById('juminchecking_true').style.display = 'none';
   opener.document.getElementById('juminchecking_null').style.display = '';
   window.self.close();
   </script>
   <%
}
%>