<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>멍냥이 관리자 : 회원목록</title>
<link rel="stylesheet" type="text/css" href="/mni/css/adminList.css">
</head>
<body>
<h1>회원 목록</h1>
<section>
	<div><input type="text" name="search" placeholder="검색어 입력" id="searchBox">
	<input type="button" value="검색">
	</div>
		<table>
			<tr>
				<th>NO.</th>
				<th>아이디</th>
				<th id="thup">비밀번호</th>
				<th>이름</th>
				<th>주민번호</th>
				<th>이메일</th>
				<th>연락처</th>
				<th>주소</th>
				<th>가입일자</th>
				<th id="thup">Delete_at</th>
			</tr>
			<tr>
				<td>1</td>
				<td>ezen123</td>
				<td>1234</td>
				<td>홍길동</td>
				<td>991234-1234567</td>
				<td>ezen@naver.com</td>
				<td>010-1234-1234</td>
				<td>서울 동작구 민양로 19 아파트 101-1</td>
				<td>2023-07-20</td>
				<td>0</td>
			</tr>
		</table>
	</section>
</body>
</html>