<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel = "stylesheet" type = "text/css" href = "/mni/css/layout.css">
<link rel = "stylesheet" type = "text/css" href = "/mni/css/userInfo.css">
</head>
<script>
function sethide(){
	document.getElementById('pwdchecking').style.display = 'none';
	}
function showException(){
		 
	var pwd = document.fm.user_pwd.value;
	var pwd_s = document.fm.pwdcheck.value;
		 
	if(pwd == pwd_s){
		document.getElementById('pwdchecking').style.display = 'none';
	}else{
		document.getElementById('pwdchecking').style.display = '';
		}
	}
</script>
<body onload = "sethide()">
<%@include file = "../header.jsp" %>
<section class = "section">
	<article>
		<h2>회원정보 수정</h2>
		<hr>
		<form name = "fm" class = "info" action = "#" method="post">
		<table>
			<tr>
				<th>이름</th>
				<td><input type = "text" name = "user_name" class = "inputtext"></td>				
			</tr>
			<tr>
				<th>전화번호</th>
				<td><input type = "text" name = "user_tel" class = "inputtext"></td>
			</tr>
			<tr>
				<th>이메일</th>
				<td><input type = "text" name = "user_email" class = "inputtext"></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type = "text" name = "user_pwd" class = "inputtext"></td>
			</tr>
			<tr>
				<th>비밀번호 확인</th>
				<td>
				<input type = "password" name = "pwdcheck" onchange = "showException()" class = "inputtext">
				<div id = "pwdchecking" class = "pwdexception">입력한 비밀번호가 일치하지 않습니다.</div>
				</td>
			</tr>
			<tr>
				<th>주소<font color = "red">*</font></th>
				<td>
				<input type = "text" name = "user_zip" class = "add" readonly >
				<input type = "button" value = "주소검색" onclick = "addrpopup()" class = "button"><br>
				<input type = "text" name = "user_addr1" readonly class = "inputtext"><br>
				<input type = "text" name = "user_addr2" class = "inputtext">
				</td>
			</tr>
		</table>
		<input type = "submit" value = "수정" class = "submit">
		</form>
		<div class = "userimg">
		<div class = "username">사용자 명</div>
		</div>
	</article>
</section>
<%@include file = "../footer.jsp" %>
</body>
</html>