<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.text.*" %>
<%@ page import="com.mni.product.*" %>
<jsp:useBean id="pdao" class="com.mni.product.ProductDAO"></jsp:useBean>
<%
String num_s=request.getParameter("categoryNum");
if(num_s==null || num_s.equals("")){
	num_s="0";
}int num=Integer.parseInt(num_s);

String categoryName="";
String sideMenu="";

switch(num){
case 01: categoryName="사료"; sideMenu="/mni/user/sideMenu_01.jsp" ; break;
case 02: categoryName="간식"; sideMenu="/mni/user//myweb/mni/sideMenu_02.jsp" ; break;
case 03: categoryName="용품"; sideMenu="/mni/user//myweb/mni/sideMenu_03.jsp" ; break;
case 04: categoryName="장난감"; sideMenu="/mni/user//myweb/mni/sideMenu_04.jsp" ; break;
}
  
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사료</title>
<link rel="stylesheet" type="text/css" href="/mni/css/category.css">

</head>
<%
int totalCnt = pdao.menuCnt(num); // db 연동 총 게시물
int pageCnt = 12; // 한 페이지당 보여줄 게시물
int pageButton = 10; // 페이지 버튼 개수

String cp_s = request.getParameter("cp"); // 첫 접속 시 1페이지로 이동
if (cp_s == null || cp_s.equals("")) {
    cp_s = "1";
}
int cp = Integer.parseInt(cp_s); // 사용자 현재 위치

int ctgCnt = 0;
if (totalCnt == 0) {
    totalCnt = 1;
    ctgCnt = 0;
}else{
	ctgCnt = totalCnt;
}

int totalPage = totalCnt / pageCnt + 1; // 총 페이지 수
if (totalCnt % pageCnt == 0) {
    totalPage--;
}

int userGroup = cp / pageButton; // 유저 현재 위치 그룹
if (cp % pageButton == 0) {
    userGroup--;
}

%>
<%@ include file="/header.jsp" %>

<body>

   <div class="bar">홈 > 카테고리 > <%=categoryName %></div>
   
<% if(num==01){ %>
		<%@ include file="/sidemenu/sideMenu_01.jsp"%><%
	}else if(num==02){ %>
		<%@ include file="/sidemenu/sideMenu_02.jsp" %><%
	}else if(num==03){ %>
		<%@ include file="/sidemenu/sideMenu_03.jsp" %><%
	}else{%>
		<%@ include file="/sidemenu/sideMenu_04.jsp" %><%
	}
%>

   <div class="head-title"><%=categoryName %></div>
   <div class="prodNum"><%= ctgCnt %>개의 상품</div>
   <div class="prodSection">
  
   <table border="0" cellspacing="0">
      <tfoot>
      <tr>
         <td colspan="10" align="center">
         <% if (userGroup != 0) { %>
            <a href="snack.jsp?cp=<%= userGroup*pageButton %>">&lt;&lt;</a>
         <% } %>
         <% for (int i = userGroup*pageButton+1; i <= (userGroup+1)*pageButton; i++) { %>
            <% String button = i == cp ? "nowPage" : "page"; %>
            &nbsp;&nbsp;<button class="<%= button %>" onclick="javascript:location.href='snack.jsp?cp=<%= i %>'"><%= i %></button>&nbsp;&nbsp;
            <% if (i == totalPage) { break; } %>
         <% } %>
         <% if (userGroup != (totalPage/pageButton-(totalPage%pageButton==0?1:0))) { %>
            <a href="snack.jsp?cp=<%=(userGroup+1)*pageButton+1%>">&gt;&gt;</a>
         <% } %>
         </td>
      </tr>
      </tfoot>
      
    <tbody>
         <%
         ArrayList<ProductDTO> arr = pdao.menuList(cp, pageCnt, num);
         if (arr == null || arr.size() == 0) {
         	%>
         	<tr>
            	<td colspan="3"> 등록된 제품이 없습니다.</td>
         	</tr>
        	 <%
         }else{
         	%><tr><%
         	for(int i=0;i<arr.size();i++){
        	 %>
         	<td>
            	<div class="brand-list-item">
               		<div class="prodImg">
                 		<img src="/mni/admin/product_img/<%=arr.get(i).getProd_title_img() %>" alt="brand image" name="brand"></a>
               		</div>
               		<div class="description-section">
                 		<div class="prodName" id="title"><%=arr.get(i).getProd_name() %></div>
                 		<div class="prodTitle"><%=arr.get(i).getProd_title() %></div>
                 		<div class="prodPrice"><%=arr.get(i).getProd_price() %>원</div>
               		</div>
            		</div>
         	</td>   
         <%
         if(i%3==2 && i!=arr.size()){
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