<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
   body{width:500px;}
   h2{width: 200px;}
   h2 hr{width: 300px;}
   .zip{
      width: 65px;
      height: 20px;
      border: 1px solid lightgray;
      border-radius: 5px;
      font-size:15px;
      padding:10px;
   }
   .addr{
      width: 300px;
      height: 20px;
      border: 1px solid lightgray;
      border-radius: 5px;
      font-size:15px;
      padding:10px;
      
   }
   input[type="text"]{margin-bottom: 20px; margin-left: 20px;}
   input[type="number"]{margin-bottom: 20px; margin-left: 20px;}
   
   .button{
      width: 150px;
      height: 50px;
      border-radius: 10px;
      color: white;
      background-color: #ff7f50;
      font-size: 17px;
      margin-left: 150px;
      cursor: pointer;
      border: 0px;
   }
   
   input::-webkit-outer-spin-button,
   input::-webkit-inner-spin-button {
        -webkit-appearance: none;
        margin: 0;
   }
</style>
<script>
   function show(){
      
      var zip = document.popupaddr.popup_zip.value;
      var addr1 = document.popupaddr.popup_addr1.value;
      
      if(zip != "" && addr1 != ""){
      opener.document.join.user_zip.value = zip;
      opener.document.join.user_addr1.value = addr1;
      window.self.close();
      }else{
         window.alert('우편번호와 기본주소를 입력하셔야합니다.');
      }
   }
   
   function addr(object){
       if (object.value.length > object.maxLength){
         object.value = object.value.slice(0, object.maxLength);
       }    
     }
</script>
<body>
<form name = "popupaddr">
<h2>주소 입력</h2>
<hr>
우편번호 <input type = "number" name = "popup_zip" maxlength="5" class = "zip" oninput = "addr(this)"><br>
기본주소 <input type = "text" name = "popup_addr1" class = "addr"><br>
<input type = "submit" value = "확인" class = "button" onclick = "show()"> 
</form>
</body>
</html>