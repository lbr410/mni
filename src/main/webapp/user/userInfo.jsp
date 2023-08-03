<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.mni.userInfo.*" %>
<%request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="udao" class="com.mni.userInfo.userInfoDAO"></jsp:useBean>
<%
	String user_id = (String)session.getAttribute("sid");
	System.out.println(user_id);
	userInfoDTO dto = udao.loginCheck(user_id);
	System.out.println(dto);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel = "stylesheet" type = "text/css" href = "/mni/css/userInfo.css">
</head>
<script>

function sethide(){
	document.getElementById('pwdchecking').style.display = 'none';
}

function showException(){
		 
	var pwd = document.join.user_pwd.value;
	var pwd_s = document.join.pwdcheck.value;
	
	if(pwd == pwd_s){
		document.getElementById('pwdchecking').style.display = 'none';
	}else{
		document.getElementById('pwdchecking').style.display = '';
		}
}

function addrpopup(){
	window.open('addrPopup.jsp','popup','width=500, height=300');
}

function userInfoModify(){
	var pwd = document.join.user_pwd.value;
	var pwd_s = document.join.pwdcheck.value;
	
	if(pwd == pwd_s){
		return true;
	}else{
		window.alert('입력하신 비밀번호가 일치하지 않습니다.');
		return false;
	}
	
}
</script>
<body onload = "sethide()">
<%@include file = "/header.jsp" %>
<section class = "section">
	<article>
		<h2>회원정보 수정</h2>
		<hr>
		<form name = "join" action = "userInfo_ok.jsp" method="post" onsubmit = "return userInfoModify()">
		<table>
			<tr>
				<th>이름</th>
				<td><input type = "text" name = "user_name" class = "inputtext" value="<%=dto.getUser_name()%>"></td>				
			</tr>
			<tr>
				<th>전화번호</th>
				<td><input type = "text" name = "user_tel" class = "inputtext" value="<%=dto.getUser_tel()%>"></td>
			</tr>
			<tr>
				<th>이메일</th>
				<td><input type = "text" name = "user_email" class = "inputtext" value="<%=dto.getUser_email()%>"></td>
			</tr>
			<tr>
				<th>새 비밀번호</th>
				<td><input type = "password" name = "user_pwd" class = "inputtext"></td>
			</tr>
			<tr>
				<th>새 비밀번호 확인</th>
				<td>
				<input type = "password" name = "pwdcheck" onchange = "showException()" class = "inputtext">
				<div id = "pwdchecking" class = "pwdexception">입력한 비밀번호가 일치하지 않습니다.</div>
				</td>
			</tr>
			<tr>
				<th>주소<font color = "red">*</font></th>
				<td>
				<input type = "text" name = "user_zip" class = "add" readonly value="<%=dto.getUser_zip()%>">
				<input type = "button" value = "주소검색" onclick = "addrpopup()" class = "button"><br>
				<input type = "text" name = "user_addr1" readonly class = "inputtext" value="<%=dto.getUser_addr1()%>"><br>
				<input type = "text" name = "user_addr2" class = "inputtext" value="<%=dto.getUser_addr2()%>">
				</td>
			</tr>
		</table>
		<input type = "submit" value = "수정" class = "submit">
		</form>
	</article>
</section>
<%@include file = "../footer.jsp" %>
</body>
</html>