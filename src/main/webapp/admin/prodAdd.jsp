<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>멍냥이 관리자 : 상품등록</title>
</head>
<link rel="stylesheet" type="text/css" href="/mni/css/prodAdd.css">
<script>
function price(object){
	if (object.value.length > object.maxLength){
	      object.value = object.value.slice(0, object.maxLength);
	    }
}
</script>
<body>
<div class="divSize">
<%@ include file="admin_header/admin_header_2.jsp" %>
<section>
<br><br><br>
	<span>상품등록</span>
	<article>
	<br>
		<form name="prodInsert" action="prodInsert_ok.jsp" method="post" enctype="multipart/form-data">
		<div class="textFocus">
		<input type="text" name="prod_name" class="text_size" required="required"><label>상품이름</label></div><br>
		<div>
		<label class="select_title">동물</label>
		<label class="select_title">카테고리</label>
		<label class="select_title">브랜드</label></div>
		<div class="select_margin_top">
		<select name="prod_pet" size="5" required="required">
			<option value="d">강아지</option>
			<option value="c">고양이</option>
		</select> 
		<select name="prod_category" size="5" required="required">
			<option value="01">사료</option>
			<option value="02">간식</option>
			<option value="03">용품</option>
			<option value="04">장난감</option>
		</select>
		<select name="prod_brand" size="5" required="required">
			<option value="100">오리젠</option>
			<option value="200">아카나</option>
			<option value="300">로얄캐닌</option>
			<option value="400">아투</option>
			<option value="500">기타</option>
		</select>
		</div>
		<br>
		
		<div class="text_margin_top textFocus">
		<input type="number" name="prod_price" class="text_size" maxlength="6" required oninput="price(this)"><label>가격</label></div>
		<div class="text_margin_top textFocus">
		<input type="number" name="prod_count" class="text_size" maxlength="3" required oninput="price(this)"><label>재고</label></div>
		<div class="text_margin_top textFocus">
		<input type="text" name="prod_title" class="text_size" required="required"><label>글제목</label></div>
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