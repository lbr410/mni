<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>멍냥이 관리자 : 로그인</title>
<link rel="stylesheet" type="text/css" href="/mni/css/adminList.css">
</head>
<body>
<section>
<form name="adminlogin" id="login" action="adminlogin_ok.jsp" method="post"> 
<img src="/mni/img/mainlogo.png" alt="adminlogo"><br>
	<div class="textFocus"><input type="text" name="adminlogin_id" placeholder=" 아이디"></div><br>
	<div class="textFocus"><input type="password" name="adminlogin_pwd" class="textBoxsize" placeholder=" 비밀번호"></div><br>
	<div class="checkbox"><input type="checkbox" name="admin_checkbox" value="자동로그인">자동로그인
	<input type="checkbox" name="admin_checkbox" value="아이디 기억하기">아이디 기억하기
	</div><br>
	<input type="submit" class="buttonDeco" value="로그인">
	<br>
</form>
</section>
</body>
</html>