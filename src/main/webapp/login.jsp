<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel = "stylesheet" type = "text/css" href = "/mni/css/login.css">
</head>
<body>
<%@include file = "header.jsp" %>
<section class = "loginsection">
	<article>
		<img src = "/mni/img/loginlogo.png" class = "img">
		<form name = "fm" action = "" method="post">
			<div>
				<input type = "text" name = "id" placeholder="아이디" class = "textbox"><br>
				<div></div>
				<input type = "password" name = "pwd" placeholder="비밀번호" class = "textbox"><br>
				<div class = "textsize">
				<input type = "checkbox" name = "idremember" class = "checkbox">&nbsp;아이디 기억하기
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<a href = "">아이디 찾기</a> | <a href = "">비밀번호 찾기</a>
				</div><br>
				<input type = "submit" value = "로그인" class = "button"><br>
				<input type = "button" value = "회원가입" class = "button" onclick = "javascript:location.href = 'join.jsp'">
			</div>
		</form>
	</article>
</section>
<%@include file = "footer.jsp" %>
</body>
</html>