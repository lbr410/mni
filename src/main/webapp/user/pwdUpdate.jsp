<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8");%>
<jsp:useBean id = "udao" class = "com.mni.userInfo.userInfoDAO"></jsp:useBean>
<%
String id = request.getParameter("id");
String juminfront = request.getParameter("juminfront");
String juminback = request.getParameter("juminback");
Boolean pwd = udao.getUserPwd(id, juminfront, juminback);
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>멍냥이: 비밀번호 변경</title>
</head>
<style>
.inputtext{
	width: 300px; 
	height: 40px; 
	margin-bottom: 10px;
	border:1px solid lightgray;
	border-radius: 10px;
}
.pwdexception{color: red; font-size: 13px;}

table{margin: 0 auto; border-spacing: 0 40px;}

th{text-align: left;}

td{text-align: center; padding-left: 20px; }

.submit{
	width: 300px;
    height: 45px;
    margin-top: 30px;
    margin-left: 80px;
    border: 1px solid #ff7f50;
    border-radius: 10px;
    background-color: #ff7f50;
    color: white;
    cursor: pointer;
}
</style>
<script>
function sethide(){
	document.getElementById('pwdchecking').style.display = 'none';
}

function showpwd(){
	 
	var pwd = document.change.user_pwd.value;
	var pwd_s = document.change.pwdcheck.value;
	 
	if(pwd == pwd_s){
		document.getElementById('pwdchecking').style.display = 'none';
			
	}else{
		document.getElementById('pwdchecking').style.display = '';
	}
}

function changesubmit(){
	var pwd = document.change.user_pwd.value;
	var pwd_s = document.change.pwdcheck.value;
	var pwdcheck = pwd == pwd_s;
	
	if(pwdcheck){
		return true;
	}else{
		window.alert('비밀번호가 일치하지 않습니다.');
		document.getElementById('pwdchecking').style.display = '';
		return false;
	}
}
</script>
<%
if(pwd == false){
	%>
	<script>
		window.alert('입력하신 회원님의 정보가 없습니다.');
		location.href = 'pwdSearch.jsp?id=<%=id%>';
	</script>
	<%
}
%>
<body onload = "sethide()">
<%@include file = "/header.jsp" %>
<section>
	<article>
	<form name = "change" action = "pwdUpdate_ok.jsp" method = "post" onsubmit = "return changesubmit()">
		<table>
			<tr>
				<th>변경할 비밀번호<font color = "red">*</font></th>
				<td><input type = "password" name = "user_pwd" placeholder="비밀번호 입력." class = "inputtext" required></td>
			</tr>
			<tr>
				<th>비밀번호 확인<font color = "red">*</font></th>
				<td>
				<input type = "password" name = "pwdcheck" placeholder="비밀번호 확인." class = "inputtext" onchange = "showpwd()" required>
				<!-- 사용자에게 위에 비밀번호와 일치하는지 다른지 알려주는 div태그 -->
				<div id = "pwdchecking" class = "pwdexception">입력한 비밀번호가 일치하지 않습니다.</div>
				</td>
			</tr>	
		</table>
		<input type = "hidden" name = "id" value = "<%=id %>">
		<input type = "hidden" name = "juminfront" value = "<%=juminfront %>">
		<input type = "hidden" name = "juminback" value = "<%=juminback %>">
		<input type = "submit" value = "변경하기" class = "submit">
	</form>
	</article>
</section>	
<%@include file = "/footer.jsp" %>	
</body>
</html>