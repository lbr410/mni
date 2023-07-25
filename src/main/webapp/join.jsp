<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel = "stylesheet" type = "text/css" href = "/mni/css/layout.css">
</head>
<style>
	.sectionjoin{
	width: 1200px; 
	margin: 0px auto; 
	padding: 50px;
	position: relative;
	}
	
	h2{
	display: inline-block;
	margin-left:-20px;
	font-size: 35px; 
	margin-bottom: -20px;
	}
	
	hr{width: 800px; margin-top: -50px;}
	
	.divsize{
	font-size: 15px; 
	margin-left: 650px; 
	margin-bottom: 10px;}
	
	table{
	width: 800px; 
	text-align: left; 
	border-spacing: 0 40px; 
	margin: 0px auto;
	}
	
	th{margin-bottom: 20px;}
	
	.add{width: 100px; height: 40px; margin-bottom: 10px;}
	
	.button{width: 100px; height: 40px;}
	
	.submit{width: 400px; height: 60px; margin-top: 30px; margin-left: 100px;}
	
	.inputtext{width: 300px; height: 40px; margin-bottom: 10px;}
	
	.jumin{width: 140px; height: 40px;}
	
	.pwdexception{color: red; font-size: 13px;}	
</style>
<script>

function sethide(){
document.getElementById('pwdchecking').style.display = 'none';
}
function show(){
	 
	var pwd = document.fm.user_pwd.value;
	 var pwd_s = document.fm.pwdcheck.value;
	 
	 if(pwd == pwd_s){
		 document.getElementById('pwdchecking').style.display = 'none';
			
		}else{
			document.getElementById('pwdchecking').style.display = '';
		}
		}

function addrpopup(){
		location.href = '#';
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
<form name = "fm" action = "#" method="post">
<table>
	<tr>
	<th>아이디<font color = "red">*</font></th>
	<td>
	<input type = "text" name = "user_id" placeholder="아이디 입력." class = "inputtext">
	<input type = "button" value = "중복확인" onclick = "javascript:location.href='#'" class = "button">
	</td>
	</tr>
	<tr>
	<th>비밀번호<font color = "red">*</font></th>
	<td><input type = "password" name = "user_pwd" placeholder="비밀번호 입력." class = "inputtext"></td>
	</tr>
	<tr>
	<th>비밀번호 확인<font color = "red">*</font></th>
	<td>
	<input type = "password" name = "pwdcheck" placeholder="비밀번호 확인." class = "inputtext" onchange = "show()">
	<div id = "pwdchecking" class = "pwdexception">입력한 비밀번호가 일치하지 않습니다.</div>
	</td>
	</tr>
	<tr>
	<th>이름<font color = "red">*</font></th>
	<td><input type = "text" name = "user_name" class = "inputtext"></td>
	</tr>
	<tr>
	<th>주민번호<font color = "red">*</font></th>
	<td>
	<input type = "text" name = "user_jumin_front" maxlength="7" class = "jumin">
	-	
	<input type = "password" name = "user_jumin_back" maxlength="7" class = "jumin">
	</td>
	
	</tr>
	<tr>
	<th>주소<font color = "red">*</font></th>
	<td>
	<input type = "text" name = "user_zip" class = "add" readonly>
	<input type = "button" value = "주소검색" onclick = "addrpopup()" class = "button"><br>
	<input type = "text" name = "user_addr1" readonly class = "inputtext"><br>
	<input type = "text" name = "user_addr2" class = "inputtext">
	</td>
	</tr>
	<tr>
	<th>전화번호<font color = "red">*</font></th>
	<td><input type = "text" name = "tel" class = "inputtext"></td>
	</tr>
	<tr>
		<th>이메일</th>
		<td>
		<input type = "text" name = "email" class = "inputtext"><br>
		</td>
	</tr>
	<tr>
	<td colspan = "2" align = "center"><input type = "submit" value = "회원가입" class = "submit"></td>
	</tr>
</table>
</form>
</body>
</html>