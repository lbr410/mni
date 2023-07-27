<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link rel = "stylesheet" type = "text/css" href = "/mni/css/join.css">
<script>
function sethide(){	
document.getElementById('pwdchecking').style.display = 'none';
document.getElementById('idchecking_true').style.display = 'none';
document.getElementById('idchecking_false').style.display = 'none';
}
function showpwd(){
	 
	var pwd = document.join.user_pwd.value;
	var pwd_s = document.join.pwdcheck.value;
	 
	if(pwd == pwd_s){
		document.getElementById('pwdchecking').style.display = 'none';
			
	}else{
		document.getElementById('pwdchecking').style.display = '';
	}
}

function addrpopup(){
	window.open('/mni/user/userFindAddr.jsp','findaddr','width=500,height=300');
}
	
function idcheck(){
	var user_id = document.join.user_id.value;
	window.open("/mni/user/idCheck.jsp?id="+user_id);
}
</script>
<body onload = "sethide()">
<%@include file = "header.jsp" %>
<section class = "sectionjoin">
	<article>
		<h2>회원가입</h2>
		<div class = "divsize"><font color = "red">*</font> 필수입력사항</div>		
	</article>
</section>
<hr/>
<form name = "join" action = "#" method="post">
<table>
	<tr>
	<th>아이디<font color = "red">*</font></th>
	<td>
	<input type = "hidden" name = "">
	<input type = "text" name = "user_id" placeholder="아이디 입력." class = "inputtext" required>
	<input type = "button" value = "중복확인" onclick = "idcheck()" class = "button">
	<div id = "idchecking_true" class = "idexception">사용가능한 아이디입니다!</div>
	<div id = "idchecking_false" class = "idexception">중복된 아이디입니다!</div>
	</td>
	</tr>
	<tr>
	<th>비밀번호<font color = "red">*</font></th>
	<td><input type = "password" name = "user_pwd" placeholder="비밀번호 입력." class = "inputtext" required></td>
	</tr>
	<tr>
	<th>비밀번호 확인<font color = "red">*</font></th>
	<td>
	<input type = "password" name = "pwdcheck" placeholder="비밀번호 확인." class = "inputtext" onchange = "showpwd()" required>
	<div id = "pwdchecking" class = "pwdexception">입력한 비밀번호가 일치하지 않습니다.</div>
	</td>
	</tr>
	<tr>
	<th>이름<font color = "red">*</font></th>
	<td><input type = "text" name = "user_name" class = "inputtext" required></td>
	</tr>
	<tr>
	<th>주민번호<font color = "red">*</font></th>
	<td>
	<input type = "text" name = "user_jumin_front" maxlength="7" class = "jumin" required>
	-	
	<input type = "password" name = "user_jumin_back" maxlength="7" class = "jumin" required>
	</td>
	
	</tr>
	<tr>
	<th>주소<font color = "red">*</font></th>
	<td>
	<input type = "text" name = "user_zip" class = "add" readonly required>
	<input type = "button" value = "주소검색" onclick = "addrpopup()" class = "button"><br>
	<input type = "text" name = "user_addr1" readonly class = "inputtext" required><br>
	<input type = "text" name = "user_addr2" class = "inputtext" required>
	</td>
	</tr>
	<tr>
	<th>전화번호<font color = "red">*</font></th>
	<td>
	<input type = "text" name = "user_tel" maxlength="11" class = "inputtext" required>
	<div>"-"는 빼고 입력해 주세요.</div>
	</td>
	</tr>
	<tr>
		<th>이메일</th>
		<td>
		<input type = "text" name = "user_email" class = "inputtext" required><br>
		</td>
	</tr>
	<tr>
	<td colspan = "2" align = "center"><input type = "submit" value = "회원가입" class = "submit"></td>
	</tr>
</table>
</form>
<%@include file = "footer.jsp" %>
</body>
</html>