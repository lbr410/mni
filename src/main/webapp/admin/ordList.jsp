<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>멍냥이 관리자 : 주문내역</title>
<link rel="stylesheet" type="text/css" href="/mni/css/adminList.css">
</head>
<body>
<%@ include file="admin_header/admin_header_1.jsp" %>
<h1>주문 내역</h1>
	<section>
	<div><input type="text" name="search" placeholder="검색어 입력" id="searchBox">
	<input type="button" value="검색">
	</div>
	<div class="misord"><input type="checkbox" name="check" value="미승인 주문" >미승인 주문</div>
		<table>
			<tr id="trUp">
				<th>NO.</th>
				<th>주문일시</th>
				<th>주문번호</th>
				<th>아이디</th>
				<th>상품정보</th>
				<th>수량</th>
				<th>상태</th>
				<th>결제방법</th>
				<th>금액</th>
			</tr>
			<tr>
				<td>1</td>
				<td>2023-07-09</td>
				<td>1234-123455</td>
				<td>abcd12</td>
				<td>로얄캐닌 인도어 8kg</td>
				<td>3</td>
				<td>승인X</td>
				<td>신용카드</td>
				<td>100,000</td>
			</tr>
		</table>
	</section>
</body>
</html>