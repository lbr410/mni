<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel = "stylesheet" type = "text/css" href = "/mni/css/layout.css">
<link rel = "stylesheet" type = "text/css" href = "/mni/css/usercheck.css">
</head>
<body>
<%@include file = "../header.jsp" %>
<section id = "user">
	<article>
	<form name="usercheck" action="usercheck_ok.jsp" method="post">
		<fieldset>
		<img src = "/mni/img/mainlogo.png">
			<div>
			비밀번호 입력<br>
			<input type = "password" name = "pwd" placeholder=" 비밀번호 입력"><br>
			<input type = "submit" value = "확인">
			</div>
		</fieldset>
	</form>
	</article>
</section>
<%@include file = "../footer.jsp" %>
</body>
</html>