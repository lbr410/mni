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
<div class="divSize">
<%@ include file="admin_header/admin_header_1.jsp" %>
<h1>주문 내역</h1>
	<section>
	<article>
	<div class="searchBox"><input type="text" name="ord_search" placeholder="검색어 입력" id="searchBox">
	<input type="button" value="검색" class="seaBtnDeco">
	</div>
	<div class="misord"><input type="checkbox" name="ord_checkbox" value="미승인 주문" >미승인 주문</div>
		<table>
			<tr id="trUp">
				<th>NO.</th>
				<th>주문일시</th>
				<th>주문번호</th>
				<th>아이디</th>
				<th>이름</th>
				<th>상품정보</th>
				<th>수량</th>
				<th>상태</th>
				<th>결제방법</th>
				<th>금액</th>
				<th>우편번호</th>
				<th>주소1</th>
				<th>주소2</th>
				<th>요청사항</th>
			</tr>
			<tr>
				<td>2</td>
				<td>2023-07-09</td>
				<td>1234-123455</td>
				<td>abcd12</td>
				<td>홍길동</td>
				<td>로얄캐닌 인도어 8kg</td>
				<td>3</td>
				<td>
				<input type="button" value="승인" class="ordBtnDeco">	
				<input type="button" value="취소" class="ordBtnDeco">
				</td>
				<td>신용카드</td>
				<td>100,000</td>
				<td>03412</td>
				<td>서울특별시 강남구 양재동</td>
				<td>어쩌고아파트 301호</td>
				<td>문앞에 두고 문자주세요!</td>
			</tr>
			<tr>
				<td>1</td>
				<td>2023-07-04</td>
				<td>1234-567890</td>
				<td>qwe35</td>
				<td>홍길동</td>
				<td>바잇미 양배추 킁킁볼</td>
				<td>2</td>
				<td class="ordText">승인완료</td>				
				<td>신용카드</td>
				<td>14,000</td>
				<td>03412</td>
				<td>서울특별시 강남구 양재동</td>
				<td>어쩌고아파트 301호</td>
				<td>공동 현관문 비밀번호 1234</td>
			</tr>
		</table>
		</article>
	</section>
</div>
</body>
</html>