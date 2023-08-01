<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.mni.product.*" %>
<jsp:useBean id="pdao" class="com.mni.product.ProductDAO"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>멍냥이 관리자 : 상품관리</title>
<link rel="stylesheet" type="text/css" href="/mni/css/adminList.css">
<script>
function prodAdd(){
   location.href='/mni/admin/prodAdd.jsp';
}
function prodDelete(prod_idx){
   let del = window.confirm('삭제하시겠습니까?');
   if(del){
      location.href='/mni/admin/prodDelete.jsp?prod_idx='+prod_idx;
   }else{
      location.href='/mni/admin/productList.jsp';
   }
}
</script>
</head>
<%
int totalCnt = pdao.prodCnt(); //db 연동 총 게시물
int pageCnt = 5; //한 페이지당 보여줄 게시물
int pageButton = 10; //페이지 버튼 개수

String cp_s = request.getParameter("cp"); //첫 접속 시 1페이지로 이동
if(cp_s == null || cp_s.equals("")){
   cp_s = "1";
}
int cp = Integer.parseInt(cp_s); // 사용자 현재 위치

if(totalCnt == 0){
	totalCnt=1;
}
int totalPage = totalCnt / pageCnt +1; //총 페이지 수
if(totalCnt % pageCnt == 0){
   totalPage--;
}

int userGroup = cp / pageButton; //유저 현재 위치 그룹
if(cp % pageButton == 0){
   userGroup--;
}
%>
<body>
<div class="divSize">
<%@ include file="admin_header/admin_header_2.jsp" %>
<h1>상품 관리</h1>
   <section>
   	<article>
   <div class="searchBox"><input type="text" name="prod_search" placeholder="검색어 입력" id="searchBox">
   <input type="button" value="검색" class="seaBtnDeco">
   </div>
   <div class="productup"><input type="button" value="상품등록" class="longboxBtnDeco" onclick="prodAdd()"></div>
      <table>
      <thead>
         <tr>
            <th>NO.</th>
            <th>상품명</th>
            <th>판매가</th>
            <th id="thup">브랜드</th>
            <th id="thup">대분류</th>
            <th id="thup">소분류</th>
            <th id="thup">재고</th>
            <th>등록일</th>
            <th>글제목</th>
            <th>상품이미지</th>
            <th></th>
         </tr>
         </thead>
         <tfoot>
         <tr>
            <td colspan="10" align="center">
         <%
         /**페이징*/
         if(userGroup != 0){
            %><a href="productList.jsp?cp=<%=userGroup*pageButton%>">&lt;&lt;</a><%
         }
         for(int i = userGroup*pageButton+1; i<=(userGroup+1)*pageButton; i++){
            String button = i == cp ? "nowPage":"page";
            %>&nbsp;&nbsp;<button class="<%=button %>" onclick="javascript:location.href='productList.jsp?cp=<%=i%>'"><%=i %></button>&nbsp;&nbsp;<%
            if(i == totalPage){
               break;
            }
         }
         if(userGroup != (totalPage/pageButton-(totalPage%pageButton==0?1:0))){
            %><a href="productList.jsp?cp=<%=(userGroup+1)*pageButton+1%>">&gt;&gt;</a><%
         }
         %>
         </td>
         </tr>
         </tfoot>
         <tbody>
         <%
         ArrayList<ProductDTO> arr=pdao.prodList(cp, pageCnt);
         String pet="";
         String brand="";
         String category="";
         DecimalFormat df = new DecimalFormat();
         df.applyLocalizedPattern("#,###,###원");
         if(arr==null || arr.size()==0){
            %>
            <tr>
               <td colspan="10" class="td">등록된 상품이 없습니다.</td>
            </tr>
            <%
         }else{
         for(int i=0; i<arr.size(); i++){
            if(arr.get(i).getProd_pet().equals("d")){
               pet="강아지";
            }else if(arr.get(i).getProd_pet().equals("c")){
               pet="고양이";
            }
            String price=df.format(arr.get(i).getProd_price());
            switch(arr.get(i).getProd_brand()){
            case 100: brand="오리젠";break;
            case 200: brand="아카나";break;
            case 300: brand="로얄캐닌";break;
            case 400: brand="아투";break;
            case 500: brand="기타";break;
            }
            switch(arr.get(i).getProd_category()){
            case 01: category="사료";break;
            case 02: category="간식";break;
            case 03: category="용품";break;
            case 04: category="장난감";break;
            }
         %>
         <tr>
            <td class="td"><%=arr.get(i).getProd_idx() %></td>
            <td class="td"><%=arr.get(i).getProd_name() %></td>
            <td class="td"><%=price %></td>
            <td class="td"><%=brand %></td>
            <td class="td"><%=pet %></td>
            <td class="td"><%=category %></td>
            <td class="td"><%=arr.get(i).getProd_count() %></td>
            <td class="td"><%=arr.get(i).getProd_date() %></td>
            <td class="td"><%=arr.get(i).getProd_title() %></td>
            <td class="td"><img src="/mni/admin/product_img/<%=arr.get(i).getProd_title_img() %>" alt="타이틀이미지" class="title_img"></td>
            <td class="td">
            <input type="button" value="수정" class="proBtnDeco" onclick="location.href='/mni/admin/prodUpdate.jsp?prod_idx=<%=arr.get(i).getProd_idx()%>'">
            <input type="button" value="삭제" class="proBtnDeco" onclick="prodDelete(<%=arr.get(i).getProd_idx()%>);">
            </td>
         </tr>
         <%
         }
         }%>
         </tbody>
      </table>
      </article>
   </section>
   </div>
</body>
</html>