<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>멍냥이: 비밀번호 찾기</title>
</head>
<style>

h2{
margin-bottom: -20px;
}

fieldset{
width: 600px; 
height: 200px; 
margin-top: 30px; 
text-align: center;
border: 1px solid lightgray;
}

table{
	border-spacing: 0 20px;
}

th{text-align: left;}

td{padding-left: 10px; text-align: left;}

input::-webkit-outer-spin-button,
input::-webkit-inner-spin-button {
  -webkit-appearance: none;
  margin: 0;
}

.input{
width: 120px;
height: 20px;
border:1px solid lightgray;
border-radius: 10px;
padding: 10px;
}


fieldset .submit{
	width: 300px; 
	height: 45px; 
	border: 1px solid #ff7f50;
	border-radius: 10px;
	background-color: #ff7f50;
	color: white;
	cursor: pointer;
	margin-left: 75px;
}

.jumin{
	width: 140px; 
	height: 40px;
	border:1px solid lightgray;
	border-radius: 10px;
	font-size:medium;
	text-align: center;
}
	
.juminback{
	width: 140px; 
	height: 40px;
	border:1px solid lightgray;
	border-radius: 10px;
	-webkit-text-security: disc;
	font-size:medium;
	text-align: center;
}
</style>
<script>
function jumin(object){
    if (object.value.length > object.maxLength){
      object.value = object.value.slice(0, object.maxLength);
    }    
}
</script>
<body>
<%@include file = "/header.jsp" %>
<section>
	<article>
	<h2>비밀번호 찾기</h2>
		<form name = "fm" action = "pwdUpdate.jsp" method = "post">
		<fieldset>
		<table>
		<tr>
		<%
			String id_s = request.getParameter("id");
		if(id_s != null){
			%>
			<th>아이디</th> 
			<td><input type = "text" name = "id" value = "<%=id_s%>" required class ="input"></td>
			<%
		}else{
			%>
			<th>아이디</th> 
			<td><input type = "text" name = "id" placeholder="아이디 입력" required class ="input"></td>
			<%
		}
		%>
		</tr>
		<tr>
			<th>주민번호</th> 
			<td>
			<input type = "number" name = "juminfront" maxlength="6" class = "jumin" oninput = "jumin(this)" required> 
			- <input type = "number" name = "juminback" maxlength="7" class = "juminback" oninput = "jumin(this)" required>
			</td>
		</tr>
		</table>
		<input type = "submit" value = "비밀번호 찾기" class = "submit">
		</fieldset>
		</form>		
	</article>
</section>
<%@include file = "/footer.jsp" %>
</body>
</html>