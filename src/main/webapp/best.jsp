<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.text.*" %>
<%@page import="com.mni.product.*" %>
<%@page import="java.util.*" %>
<jsp:useBean id="pdao" class="com.mni.product.ProductDAO"></jsp:useBean>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>베스트</title>
<link rel="stylesheet" type="text/css" href="/mni/css/best.css">
</head>
<%@ include file="/header.jsp" %>
<body>
<div class="bar">홈 > 베스트</div>
<div class="head-title">베스트 </div>
<div class="prodSection">
<table>
   <tbody>
   <%
   ArrayList<ProductDTO>arr=pdao.prodBest();
   DecimalFormat df = new DecimalFormat("#,##0원");
   if(arr==null || arr.size()==0){
      %>
      <tr>
         <td colspan="3">등록된 상품이 없습니다.</td>
      </tr>
      <%
   }else{
      %><tr><%
      for(int i=0;i<arr.size();i++){
         String icon="";
         switch(i){
         case 0: icon="best1.png"; break;
         case 1: icon="best2.png"; break;
         case 2: icon="best3.png"; break;
         default : icon="rank"+(i+1)+".jpg"; 
         }      
         %>
            <td>
               <div class="brand-list-item">
                     <div class="best-icon">
                  <img src="/mni/img/<%=icon %>" alt="best<%=i+1 %>" name="besticon">
               </div>
                  <div class="prodImg">
                      <a href="javascript:location.href='/mni/product/product.jsp?idx=<%=arr.get(i).getProd_idx()%>'">
                      <img src="/mni/img/<%=arr.get(i).getProd_title_img() %>" alt="place image" name="best"></a>
                  </div>
                  <div class="description-section">
                     <div class="prodName"><%=arr.get(i).getProd_name() %></div>
                      <div class="prodTitle" id="title"><%=arr.get(i).getProd_title() %></div>
                       <div class="prodPrice"><%=df.format(arr.get(i).getProd_price()) %></div>
                  </div>
                  </div>
            </td>
         <%
            if(i%4==3 && i!=arr.size()){
               %></tr><tr><%   
            }               
         }
         %></tr><%   
      }
   %>
   </tbody>
</table>
</div>
<%@ include file="footer.jsp" %>
</body>

</html>