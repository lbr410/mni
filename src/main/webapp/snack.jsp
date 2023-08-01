<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.text.*" %>
<%@ page import="com.mni.product.*" %>
<jsp:useBean id="pdao" class="com.mni.product.ProductDAO"></jsp:useBean>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오리젠</title>
<link rel="stylesheet" type="text/css" href="/mni/css/category.css">
</head>
<%
int totalCnt = pdao.prodCnt(); // db 연동 총 게시물
int pageCnt = 6; // 한 페이지당 보여줄 게시물
int pageButton = 10; // 페이지 버튼 개수

String cp_s = request.getParameter("cp"); // 첫 접속 시 1페이지로 이동
if (cp_s == null || cp_s.equals("")) {
    cp_s = "1";
}
int cp = Integer.parseInt(cp_s); // 사용자 현재 위치

if (totalCnt == 0) {
    totalCnt = 1;
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
   <div class="bar">홈 > 카테고리 > 간식</div>
   <div class="menu">
      <div class="category">
         <div class="list1">카테고리</div>
         <div class="list2"><a href="javascript:location.href='feed.jsp?categoryNum=01'">사료</a></div>
         <div class="list3"><a href="javascript:location.href='snack.jsp?categoryNum=02'">간식</a></div>
         <div class="list2"><a href="javascript:location.href='supplies.jsp?categoryNum=03'">용품</a></div>
         <div class="list2"><a href="javascript:location.href='toy.jsp?categoryNum=04'">장난감</a></div>
      </div>
   </div>
  <div class="head-title">사료</div>
  <div class="prodNum"><%= totalCnt %>개의 상품</div>
  <div class="prodSection">
  <table border="0" cellspacing="0">
	<tfoot>
		<tr>
		<td colspan="10" align="center">
           <% /**페이징*/ %>
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
       DecimalFormat df = new DecimalFormat("#,##0원");
       ArrayList<ProductDTO> arr = pdao.prodList(cp, pageCnt);
       if (arr == null || arr.size() == 0) {
       %>
       <tr>
          <td> 등록된 제품이 없습니다.</td>
       </tr>
       <%
           }else{
           %><tr><%
           for(int i=0;i<arr.size();i++){
              %>
            <td>
                <div class="brand-list-item">
                    <div class="prodImg">
                    <a href="#"><img src="/mni/admin/product_img/<%=arr.get(i).getProd_title_img() %>" alt="타이틀이미지" class="title_img"></a>
                    </div>
                     <div class="description-section">
                         <div class="prodName" id="title"><%=arr.get(i).getProd_name() %></div>
                       <div class="prodTitle">
                       <a href="#"><%=arr.get(i).getProd_title() %></div>
                       <div class="prodprice"><%=arr.get(i).getProd_price() %></div>
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