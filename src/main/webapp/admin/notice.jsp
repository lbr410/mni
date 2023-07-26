<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>멍냥이 관리자 : 공지사항</title>
<link rel="stylesheet" type="text/css" href="/mni/css/adminList.css">
</head>
<%@ include file="admin_header/admin_header_6.jsp" %>
<body>
<h1>공지사항</h1>
<section>
		<table>
			<tr>
				<th>NO.</th>
				<th>제목</th>
				<th>작성자</th>
				<th>등록일</th>
				<th>조회수</th>
				<th></th>
			</tr>
			<tr>
				<td>1</td>
				<td><a href="noticeList.jsp">공지사항</a></td>
				<td>admin</td>
				<td>2023-07-21</td>
				<td>0</td>
				<td><input type="button" value="삭제"  class="notDelBtnDeco"></td>
			</tr>
		</table>
		<div class="noticeUpBtn"><input type="button" value="작성하기" class="longboxBtnDeco"></div>
	</section>
</body>
</html>