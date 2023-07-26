<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>멍냥이 관리자 : 리뷰내역</title>
<link rel="stylesheet" type="text/css" href="/mni/css/adminList.css">
</head>
<body>
<%@ include file="admin_header/admin_header_4.jsp" %>
<h1>리뷰 내역</h1>
<section>
	<div><input type="text" name="review_search" placeholder="검색어 입력" id="searchBox">
	<input type="button" value="검색" class="seaBtnDeco">
	</div>
		<table>
			<tr>
				<th>NO.</th>
				<th id="thup">상품번호</th>
				<th>상품명</th>
				<th>아이디</th>
				<th>리뷰내용</th>
				<th>작성일</th>
				<th></th>
			</tr>
			<tr>
				<td>1</td>
				<td>12345</td>
				<td>로얄캐닌 인도어 8kg</td>
				<td>ezen123</td>
				<td>저희집 고양이가 너무 잘 먹습니당ㅎㅅㅎㅅㅎㅅㅎㅅㅎㅅㅎㅅㅎ</td>
				<td>2023-07-03</td>
				<td><input type="button" value="삭제" class="reBtnDeco"></td>
			</tr>
		</table>
	</section>
</body>
</html>