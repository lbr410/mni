<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.mni.product.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오리젠</title>
<link rel="stylesheet" type="text/css" href="/mni/css/category.css">

</head>
<%@ include file="header.jsp" %>

<body>
   <div class="bar">홈 > 카테고리 > 장난감</div>
   <div class="menu">
      <div class="category">
         <div class="list1">카테고리</div>
         <div class="list2"><a href="/mni/feed.jsp">사료</a></div>
         <div class="list2"><a href="/mni/snack.jsp">간식</a></div>
         <div class="list2"><a href="/mni/supplies.jsp">용품</a></div>
         <div class="list3"><a href="/mni/toy.jsp">장난감</a></div>
      </div>
   </div>
   <div class="head-title">장난감</div>
   <div class="prodNum">개의 상품</div>
   <div class="prodSection">
   
   <table border="0" cellspacing="0">
   <tr>
   		<td class="prodImg">
   		<img src="/mni/img/200_01_01.jpg">
   		</td>
   </tr>
  
   <tr>
   		<td class="prodName">
   		이름
   		</td>
   </tr>
   <tr>
   		<td class="prodPrice">
   		가격
   		</td>
   </tr>
   </table>
   <table>
     <tr>
   		<td class="prodImg">
   		<img src="/mni/img/200_01_01.jpg">
   		</td>
   </tr>
  
   <tr>
   		<td class="prodName">
   		이름
   		</td>
   </tr>
   <tr>
   		<td class="prodPrice">
   		가격
   		</td>
   </tr>
   </table>
    </div>
<%@ include file="footer.jsp" %>
</body>
</html>