<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.mni.product.*" %>
<jsp:useBean id="pdao" class="com.mni.product.ProductDAO"></jsp:useBean>
<%
String pet="";
pet="d";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신상품</title>
<link rel="stylesheet" type="text/css" href="/mni/css/newProduct.css">
</head>
<%
int totalCnt = pdao.prodCnt(); // db 연동 총 게시물
int pageCnt = 24; // 한 페이지당 보여줄 게시물
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
<%@ include file="header.jsp" %>
<body>
<div class="bar">홈 > 신상품</div>
<div class="head-title">신상품</div>
<div class="prodSection">	
<table border="0" cellspacing="0">
	<tfoot>
	<tr>
		<td colspan="10" align="center">
         <% if (userGroup != 0) { %>
            <a href="newProduct.jsp?cp=<%= userGroup*pageButton %>">&lt;&lt;</a>
         <% } %>
         <% for (int i = userGroup*pageButton+1; i <= (userGroup+1)*pageButton; i++) { %>
            <% String button = i == cp ? "nowPage" : "page"; %>
            &nbsp;&nbsp;<button class="<%= button %>" onclick="javascript:location.href='newProduct.jsp?cp=<%= i %>'" id="page"><%= i %></button>&nbsp;&nbsp;
            <% if (i == totalPage) { break; } %>
         <% } %>
         <% if (userGroup != (totalPage/pageButton-(totalPage%pageButton==0?1:0))) { %>
            <a href="newProduct.jsp?cp=<%=(userGroup+1)*pageButton+1%>">&gt;&gt;</a>
         <% } %>
         </td>
	</tr>
	</tfoot>
	
	<tbody>
		<%
		ArrayList<ProductDTO> arr = pdao.newProdView(pet);
		if (arr == null || arr.size() == 0) {
			%>
			<tr>
				<td colspan="4">등록된 제품이 없습니다.</td>
			</tr>
			<%
		}else{
		%><tr><%
		for(int i=0;i<arr.size();i++){
		%>
		<td>
           	<div class="brand-list-item">
              		<div class="prodImg">
						<a href="/mni/product/product.jsp?idx=<%=arr.get(i).getProd_idx() %>">
                		<img src="/mni/img/<%=arr.get(i).getProd_title_img() %>" alt="prodImg" name="prod"></a>
              		</div>
              		<div class="description-section">
                		<div class="prodName" id="title"><%=arr.get(i).getProd_name() %></div>
                		<a href="/mni/product/product.jsp?idx=<%=arr.get(i).getProd_idx() %>">
                			<div class="prodTitle"><%=arr.get(i).getProd_title() %></div>
                		</a>
                		<div class="prodPrice"><%=arr.get(i).getProd_price() %>원</div>
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