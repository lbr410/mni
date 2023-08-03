<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.text.*" %>
<%@ page import="com.mni.product.*" %>
<jsp:useBean id="pdao" class="com.mni.product.ProductDAO"></jsp:useBean>
<!DOCTYPE html>
<%
   Integer idx = (Integer)session.getAttribute("sidx");

   String pet = "";
   if(request.getParameter("pet")==null) {
      pet = "d";
   } else {
      pet = request.getParameter("pet");
   }
%> 
<html>
<head>
<meta charset="UTF-8">
 <meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>멍냥이</title>
<link rel="stylesheet" type="text/css" href="/mni/css/index.css">
</head>
<% if(pet.equals("d")) {%>
   <%@ include file="header.jsp"%>
<% } else {%>
   <%@ include file="header_cat.jsp" %>
<% } %>
<body>
    <div class="bodywrap">
    <%@include file = "slideTest.jsp" %>

    </div>
    <div class="head-title">
        <div class="best">베스트</div>
        <div class="more"><a href="/mni/best.jsp">상세보기</a></div>
    </div>
        <main>
            <div id="place-items-wrapper">
            <%
               ArrayList<ProductDTO> table = pdao.newProdView(pet);
               DecimalFormat df = new DecimalFormat("#,##0원");
               if(table==null || table.size()==0) {
            %>
                  <span>아무것도 없으면 나올 페이지 추가</span>
            <%
               } else {
                  int forSize = table.size()<=4 ? table.size() : 4;
                  for(int i=0; i<forSize; i++) {
            %>
                <div class="place-list-item">
                   <div class="place-image-wrapper">
                       <a href="/mni/product/product.jsp?idx=<%=table.get(i).getProd_idx() %>"><img src="admin/product_img/<%=table.get(i).getProd_title_img() %>" alt="place image"></a>
                   </div>
                   <div class="description-section">
                       <div class="description-section_title"><%=table.get(i).getProd_name() %></div>
                  <a class="description-section_content" href="/mni/product/product.jsp?idx=<%=table.get(i).getProd_idx() %>"><%=table.get(i).getProd_title() %></a>
                       <div class="description-section_price"><%=df.format(table.get(i).getProd_price()) %></div>
                   </div>
                   </div>
            <%       }
               }
            %>    
             </div>
        </main>

    <div class="head-title">
        <div class="best">신상품</div>
        <div class="more"><a href="/mni/newProduct.jsp">상세보기</a></div>
    </div>
        <main>
            <div id="place-items-wrapper">
            <%
               
               ArrayList<ProductDTO> table1 = pdao.newProdView(pet);
               
               if(table==null || table.size()==0) {
            %>
                  <span>아무것도 없으면 나올 페이지 추가</span>
            <%
               } else {
                  int forSize = table.size()<=4 ? table.size() : 4;
                  for(int i=0; i<forSize; i++) {
            %>
                <div class="place-list-item">
                   <div class="place-image-wrapper">
                       <a href="/mni/product/product.jsp?idx=<%=table.get(i).getProd_idx() %>"><img src="admin/product_img/<%=table.get(i).getProd_title_img() %>" alt="place image"></a>
                   </div>
                   <div class="description-section">
                       <div class="description-section_title"><%=table.get(i).getProd_name() %></div>
                  <a class="description-section_content" href="/mni/product/product.jsp?idx=<%=table.get(i).getProd_idx() %>"><%=table.get(i).getProd_title() %></a>
                       <div class="description-section_price"><%=df.format(table.get(i).getProd_price()) %></div>
                   </div>
                   </div>
            <%       }
               }
            %>    
             </div>
        </main>
<%@ include file="footer.jsp" %>
</body>
</html>