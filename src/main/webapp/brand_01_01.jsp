<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<%@page import="com.mni.brand.*" %>
<jsp:useBean id="bdao" class="com.mni.brand.BrandDAO"></jsp:useBean>
<%
String num_s=request.getParameter("brandNum");
int num=Integer.parseInt(num_s);

%>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오리젠</title>
<link rel="stylesheet" type="text/css" href="/mni/css/brand_01_01.css">
</head>
<%@ include file="header.jsp" %>

<body>
	<div class="bar">홈 > 브랜드 > 오리젠</div>
	<div class="top">
		<div class="brandlogo">
			<img class="brandlogo" src="/mni/img/orijen.png" alt="logo">
		</div>
	</div>
    <div class="banner">
        <img class="imgslide" src="/mni/img/200_01.jpg" alt="banner">
   	</div>
	<div class="menu">
		<div class="category">
			<div class="list1"><a href="#">카테고리</a></div>
			<div class="list2"><a href="#">전체</a></div>
			<div class="list2"><a href="#">사료</a></div>
		</div>
	</div>
	<div class="head-title">전체</div>
    <main>
    	<% 
    	ArrayList<BrandDTO> arr=bdao.brandNum(num);
    	if(arr==null || arr.size()==0){
    		%>
    		<div>상품정보가 없습니다.</div>
    		<%
    	}else{
    		for(int i=0;i<arr.size();i++){
    			%>
    			<div class="brand-list-item">
           			<div class="brand-image-wrapper">
               		 <a href="#"><img src="/mni/img/<%=arr.get(i).getProd_title_img() %>" alt="brand image" name="brand"></a>
           			</div>
               		<div class="description-section">
               		 	<div class="description-section_title" id="title"><%=arr.get(i).getProd_name() %></div>
           				<div class="description-section_content"><%=arr.get(i).getProd_title() %></div>
             	    	<div class="description-section_price"><%=arr.get(i).getProd_price() %></div>
          	 		</div>
      		  </div>

    			<%
    			if(i%3==2) {
    				%>
    				
    				<%
    			}
    		}
    	}
    	
    	%>

    </main>
<%@ include file="footer.jsp" %>
</body>
</html>