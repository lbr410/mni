<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.mni.product.*" %>
<jsp:useBean id="pdao" class="com.mni.product.ProductDAO"></jsp:useBean>
<%
String admin_id = (String)session.getAttribute("admin_saveid");
String ck = "";
Cookie cks[]=request.getCookies();
if(cks!=null){
	for(int i=0; i<cks.length; i++){
		//자동 로그인 쿠키 유무
		if(cks[i].getName().equals("admin_auto")){
			ck = cks[i].getValue();
		}
	}
	if(admin_id == null && !ck.equals("admin")){
		%><script>
		window.alert('로그인 후 이용가능합니다.');
		location.href='/mni/admin/index_admin.jsp';
		</script>
		<%
	}
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>멍냥이 관리자 : 상품등록</title>
</head>
<%
String prod_idx_s = request.getParameter("prod_idx");
if(prod_idx_s == null || prod_idx_s.equals("")){
   prod_idx_s="1";
}
int prod_idx = Integer.parseInt(prod_idx_s);
ProductDTO dto = pdao.prodUpdate(prod_idx);

String dog = dto.getProd_pet();
String cat = dto.getProd_pet();

String feed = "";
String snack = "";
String supplies = "";
String toy = "";
String brand_1 = "";
String brand_2 = "";
String brand_3 = "";
String brand_4 = "";
String brand_5 = "";
if(dog.equals("d")){
   dog = "selected";
}else if(cat.equals("c")){
   cat = "selected";
}
switch(dto.getProd_category()){
case 01: feed = "selected"; break;
case 02: snack = "selected"; break;
case 03: supplies = "selected"; break;
case 04: toy = "selected"; break;
}
switch(dto.getProd_brand()){
case 100: brand_1 = "selected"; break;
case 200: brand_2 = "selected"; break;
case 300: brand_3 = "selected"; break;
case 400: brand_4 = "selected"; break;
case 500: brand_5 = "selected"; break;
}
%>
<link rel="stylesheet" type="text/css" href="/mni/css/prodAdd.css">
<body>
<div class="divSize">
<%@ include file="admin_header/admin_header_2.jsp" %>
<h1>상품수정</h1><br>
<section>
   <article>
   <br>
      <form name="prodInsert" action="prodUpdate_ok.jsp" method="post" enctype="multipart/form-data">
      <input type="hidden" name="prod_idx" value="<%=prod_idx%>">
      <div class="textFocus">
      <input type="text" name="prod_name" class="text_size" value="<%=dto.getProd_name()%>"><label>상품이름</label></div><br>
      <div>
      <label class="select_title">동물</label>
      <label class="select_title">카테고리</label>
      <label class="select_title">브랜드</label></div>
      <div class="select_margin_top">
      <select name="prod_pet" size="5">
         <option value="d" <%=dog%>>강아지</option>
         <option value="c" <%=cat%>>고양이</option>
      </select> 
      <select name="prod_category" size="5">
         <option value="01" <%=feed%>>사료</option>
         <option value="02" <%=snack%>>간식</option>
         <option value="03" <%=supplies%>>용품</option>
         <option value="04" <%=toy%>>장난감</option>
      </select>
      <select name="prod_brand" size="5">
         <option value="100" <%=brand_1%>>오리젠</option>
         <option value="200" <%=brand_2%>>아카나</option>
         <option value="300" <%=brand_3%>>로얄캐닌</option>
         <option value="400" <%=brand_4%>>아투</option>
         <option value="500" <%=brand_5%>>기타</option>
      </select>
      </div>
      <br>
      
      <div class="text_margin_top textFocus">
      <input type="text" name="prod_price" class="text_size" maxlength="6" value="<%=dto.getProd_price()%>"><label>가격</label></div>
      <div class="text_margin_top textFocus">
      <input type="text" name="prod_count" class="text_size" maxlength="3" value="<%=dto.getProd_count()%>"><label>재고</label></div>
      <div class="text_margin_top textFocus">
      <input type="text" name="prod_title" class="text_size" value="<%=dto.getProd_title()%>"><label>글제목</label></div>
      <div class="text_margin_top2"><label>상품이미지</label>
      <input type="file" name="prod_title_img" required="required"></div>
      <div class="text_margin_top2"><label>상세이미지</label>
      <input type="file" name="prod_info_img" required="required"></div><br>
      <div class="text_margin_top"><input type="submit" value="등록하기" class="buttonDeco"></div>
      </form>
   </article>   
</section>
</div>
</body>
</html>