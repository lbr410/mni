<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>멍냥이: 아이디 찾기</title>
</head>
<style>
input[type="number"]{margin-top: 70px;}

input::-webkit-outer-spin-button,
input::-webkit-inner-spin-button {
  -webkit-appearance: none;
  margin: 0;
}

.jumin{
	width: 140px; 
	height: 40px;
	border:1px solid lightgray;
	border-radius: 10px;
	font-size:medium;
	text-align: center;
	margin-left: 30px;
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
.submit{
	width: 300px;
	height: 50px;
	margin-top: 20px; 
	margin-left: 40px;
	margin-bottom: 20px;
	border: 1px solid #ff7f50;
	border-radius: 10px;
	background-color: #ff7f50;
	color: white;
	cursor: pointer;
}
fieldset{
width: 600px; 
height: 250px; 
margin-top: 10px; 
text-align: center;
border: 1px solid lightgray;
}
.div{margin-left: -60px;}
	
h2{margin-left: 0px;}
</style>
<Script>
function jumin(object){
    if (object.value.length > object.maxLength){
      object.value = object.value.slice(0, object.maxLength);
    }    
}

</Script>
<body>
<%@include file = "/header.jsp" %>
<section>
	<article>
	<h2>아이디 찾기</h2>
	<fieldset>
		<form name = "fm" action = "/mni/user/idFind.jsp" method = "post">
			<div class = "div">
			주민번호 <input type = "number" name = "juminfront" maxlength="6" class = "jumin" oninput = "jumin(this)" required>
			- <input type = "number" name = "juminback" maxlength="7" class = "juminback" oninput = "jumin(this)" required>
			</div>
		<input type = "submit" value = "아이디찾기" class = "submit">
		</form>		
	</fieldset>
	</article>
</section>
<%@include file = "/footer.jsp" %>
</body>
</html>