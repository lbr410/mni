<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<jsp:useBean id="tdao" class="com.mni.test.Dao"></jsp:useBean>
<body>
	<h1>index.jsp</h1>
	<h6>index.jsp</h6>
	<h3>index.jsp</h3>
	<h1>안녕하세요</h1>
<%
	tdao.daoTest();
%>
</body>
</html>