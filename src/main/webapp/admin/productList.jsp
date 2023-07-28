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
</script>
</head>
<body>
<%@ include file="admin_header/admin_header_2.jsp" %>
<h1>상품 관리</h1>
	<section>
	<div class="searchBox"><input type="text" name="prod_search" placeholder="검색어 입력" id="searchBox">
	<input type="button" value="검색" class="seaBtnDeco">
	</div>
	<div class="productup"><input type="button" value="상품등록" class="longboxBtnDeco" onclick="prodAdd()"></div>
		<table>
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
				<th>상세정보</th>
				<th></th>
			</tr>
			<%
			ArrayList<ProductDTO> arr=pdao.prodList();
			String pet="";
			String brand="";
			String category="";
			SimpleDateFormat spdate=new SimpleDateFormat("yyyy-MM-dd a hh:mm:ss");
			String date="";
			if(arr==null || arr.size()==0){
				%>
				<tr>
					<td colspan="10">등록된 상품이 없습니다.</td>
				</tr>
				<%
			}else{
			for(int i=0; i<arr.size(); i++){
				//date=spdate.format(arr.get(i).getProd_date());
				//System.out.println(date);
				if(arr.get(i).getProd_pet().equals("d")){
					pet="강아지";
				}else if(arr.get(i).getProd_pet().equals("c")){
					pet="고양이";
				}
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
				<td><%=arr.get(i).getProd_idx() %></td>
				<td><%=arr.get(i).getProd_name() %></td>
				<td><%=arr.get(i).getProd_price() %></td>
				<td><%=brand %></td>
				<td><%=pet %></td>
				<td><%=category %></td>
				<td><%=arr.get(i).getProd_count() %></td>
				<td><%=arr.get(i).getProd_date() %></td>
				<td><%=arr.get(i).getProd_title() %></td>
				<td><img src="/mni/admin/product_img/<%=arr.get(i).getProd_title_img() %>" alt="타이틀이미지"></td>
				<td>
				<input type="button" value="수정" class="proBtnDeco">
				<input type="button" value="삭제" class="proBtnDeco">
				</td>
			</tr>
			<%
			}
			}%>
		</table>
	</section>
</body>
</html>