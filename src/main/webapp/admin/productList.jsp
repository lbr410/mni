<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>멍냥이 관리자 : 상품관리</title>
<link rel="stylesheet" type="text/css" href="/mni/css/adminList.css">
</head>
<body>
<%@ include file="admin_header/admin_header_2.jsp" %>
<h1>상품 관리</h1>
	<section>
	<div><input type="text" name="search" placeholder="검색어 입력" id="searchBox">
	<input type="button" value="검색">
	</div>
	<div class="productup"><input type="button" value="상품등록"></div>
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
			<tr>
				<td>1</td>
				<td>로얄캐닌 인도어 8kg</td>
				<td>120,000</td>
				<td>로얄캐닌</td>
				<td>고양이</td>
				<td>사료</td>
				<td>50</td>
				<td>2023-07-23 17:47:00</td>
				<td>특가★로얄캐닌 인도어 8kg 3일간 할인!</td>
				<td><img src="#" alt="상세페이지이미지"></td>
				<td>
				<input type="button" value="수정">
				<input type="button" value="삭제">
				</td>
			</tr>
		</table>
	</section>
</body>
</html>