<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<jsp:useBean id="dao" class="com.mni.test.Dao"></jsp:useBean>
<body>
	<h1>index.jsp</h1>
<%
	dao.daoTest();
%>
</body>
</html>