<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
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
	document.getElementById('idchecking_null').style.display = 'none';
	document.getElementById('tel').style.display = 'none';
	document.getElementById('juminchecking_false').style.display = 'none';
	document.getElementById('juminchecking_true').style.display = 'none';
	document.getElementById('juminchecking_null').style.display = 'none';
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

function juminCheck(){
	var juminfront = document.join.user_jumin_front.value;
	var juminback = document.join.user_jumin_back.value;
	
	if(juminfront.length != 6 || juminback.length != 7){
			 window.alert('잘못된 주민번호 형식입니다.');
		}else{
			window.open("/mni/user/juminCheck.jsp?juminfront="+juminfront+"&juminback="+juminback);
		}
}

function joinsubmit(){
	   
	   var idcheckbutton = document.join.idcheckbutton.value;
	   var pwd = document.join.user_pwd.value;
	   var pwdcheck = document.join.pwdcheck.value;
	   var zip = document.join.user_zip.value;
	   var addr1 = document.join.user_addr1.value;
	   var addr2 = document.join.user_addr2.value;
	   
	   var tf = pwd == pwdcheck;
	   //비밀번호 일치여부 true false
	   
	   var tel = document.join.user_tel.value;
	   // 전화번호 '-'기호 11자리 체크 여부
	   
	   var juminfront = document.join.user_jumin_front.value;
	   var juminback = document.join.user_jumin_back.value;
	   var jumincheckbutton = document.join.jumincheckbutton.value;
	   // 주민번호 길이 6자리 7자리 체크 여부
	   
	   //아이디 중복여부
	   if(idcheckbutton == ""){
	      window.alert('아이디 중복확인을 해주세요.');
	      return false;
	   }else if(idcheckbutton == "f"){
	      window.alert('중복된 아이디입니다.');
	      return false;
	   }else if (idcheckbutton == "t"){
	      
		   // 비밀번호 여부
	      if(tf){
	         
	         if(zip != "" && addr1 != "" && addr2 != ""){
	           
	         if(zip.length != 5){
	        	 window.alert('잘못된 우편번호형식 입니다.');
	        	 return false;
	         }else{
	        	 
	          // 전화번호 형식여부 
	         if(tel.length != 11){
	       		 window.alert('잘못된 전화번호 형식입니다.');
	       		 return false;
	       	 }else{
	       		 if(jumincheckbutton == ""){
	       			window.alert('주민번호 중복확인을 해주세요.');
	       			 return false;
	       		 }else if(jumincheckbutton == "f"){
	       			 window.alert('중복된 주민번호 입니다.');
	       			 return false;
	       		 }else if(jumincheckbutton == "n"){
	       			 window.alert('주민번호를 입력하셔야 합니다.');
	       			 return false;
	       		 }else if(jumincheckbutton == "t"){
	       			 return true;
	       		 }
	       	 }
	          
	         }
	          // 우편번호및 기본주소 상세주소 기재 여부
	         }else if(zip == "" && addr1 == ""){
	            window.alert('주소검색 버튼을 통해 우편번호와 기본주소를 작성해주세요.');
	            return false;
	         }else if(addr2 == ""){
	            window.alert('상세주소를 작성해주세요.');
	            return false;
	         }
	         // 비밀번호 일치여부
	      }else{
	         window.alert('비밀번호가 일치하지 않습니다.');
	         document.getElementById('pwdchecking').style.display = '';
	         return false;
	      }
		   // 아이디 입력 여부
	   }else if(idcheckbutton == "n"){
	      window.alert('아이디를 입력하셔야합니다.');
	      
	      return false;
	   }
	   
	   
	}

function jumin(object){
    if (object.value.length > object.maxLength){
      object.value = object.value.slice(0, object.maxLength);
    }    
  }
  
function telChecked(){
	  
	var tel = document.join.user_tel.value;
	for(var a = 0 ; a < tel.length; a++){
		
		if(tel[a] == "-"){
			window.alert('"-"는 입력하실수 없습니다.');
			document.getElementById('tel').style.display = '';
			document.join.user_tel.value = '';
			return;
		}else if(tel[a] != "-"){
			document.getElementById('tel').style.display = 'none';
		}
	}
 }
 
</script>
<body onload = "sethide()">
<%@include file = "/header.jsp" %>
<section class = "sectionjoin">
	<article>
		<h2>회원가입</h2>
		<div class = "divsize"><font color = "red">*</font> 필수입력사항</div>		
	</article>
</section>
<hr/>
<form name = "join" action = "/mni/user/joinComplete.jsp" method="post" onsubmit = "return joinsubmit()">
<table>
	<tr>
	<th>아이디<font color = "red">*</font></th>
	<td>
	<!-- 
	hidden태그를 이용해 중복확인 버튼을 클릭해서 검사했는지 확인 
	하여 중복확인했을때의 idCheck.jsp에서 받은 벨류값으로 
	회원가입 submit을 실행 미실행 판단역할	
	-->
	<input type = "hidden" name = "idcheckbutton" value = "">
	<input type = "text" name = "user_id" placeholder="아이디 입력" class = "inputtext" required>
	<!-- 버튼을 누르면 idCheck.jsp로 이동해서 중복확인 메서드 실행-->
	<input type = "button" value = "중복확인" onclick = "idcheck()" class = "button">
	<!-- 사용자에게 중복인지 아닌지 알려주는 div태그 -->
	<div id = "idchecking_true" class = "idtrue">사용가능한 아이디입니다.</div>
	<div id = "idchecking_false" class = "idexception">중복된 아이디입니다.</div>
	<div id = "idchecking_null" class = "idexception">아이디를 입력하셔야합니다.</div>
	</td>
	</tr>
	<tr>
	<th>비밀번호<font color = "red">*</font></th>
	<td><input type = "password" name = "user_pwd" placeholder="비밀번호 입력" class = "inputtext" required></td>
	</tr>
	<tr>
	<th>비밀번호 확인<font color = "red">*</font></th>
	<td>
	<input type = "password" name = "pwdcheck" placeholder="비밀번호 확인" class = "inputtext" onchange = "showpwd()" required>
	<!-- 사용자에게 위에 비밀번호와 일치하는지 다른지 알려주는 div태그 -->
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
	<input type = "hidden" name = "jumincheckbutton" value = "">
	<input type = "number" name = "user_jumin_front" maxlength="6" class = "jumin" oninput = "jumin(this)">
	-	
	<input type = "number" name = "user_jumin_back" maxlength="7" class = "juminback" oninput = "jumin(this)">
	<input type = "button" value = "중복확인" onclick = "juminCheck()" class = "button">
	<div id = "juminchecking_false" class = "juminexception">중복된 주민번호입니다.</div>
	<div id = "juminchecking_true" class = "idtrue">사용가능한 주민번호입니다.</div>
	<div id = "juminchecking_null" class = "juminexception">주민번호를 입력하셔야합니다.</div>
	</td>
	
	</tr>
	<tr>
	<th>주소<font color = "red">*</font></th>
	<td>
	<input type = "text" name = "user_zip" class = "add" readonly>
   <input type = "button" value = "주소검색" onclick = "addrpopup()" class = "button"><br>
   <input type = "text" name = "user_addr1"  class = "inputtext_add" readonly><br>
   <input type = "text" name = "user_addr2" class = "inputtext" required>
	</td>
	</tr>
	<tr>
	<th>전화번호<font color = "red">*</font></th>
	<td>
	<input type = "text" name = "user_tel" maxlength="11" class = "inputtext" required onchange = "telChecked()">
	<div id = "tel" class = "a">"-"는 빼고 입력해 주세요.</div>
	</td>
	</tr>
	<tr>
		<th>이메일</th>
		<td>
		<input type = "text" name = "user_email" class = "inputtext"><br>
		</td>
	</tr>
	<tr>
	<td colspan = "2" align = "center"><input type = "submit" value = "회원가입" class = "submit"></td>
	</tr>
</table>
</form>
<%@include file = "/footer.jsp" %>
</body>
</html>