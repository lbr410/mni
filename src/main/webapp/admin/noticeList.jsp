<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>멍냥이 관리자 : 공지사항 보기</title>
<link rel="stylesheet" type="text/css" href="/mni/css/adminList.css">
</head>
<body>
<%@ include file="admin_header/admin_header_6.jsp" %>
<h1>공지사항</h1>
<section>
<div id="noticelist"><a href="notice.jsp">목록으로</a></div>
<table id="noticetable">
	<tr>
		<td id="noticetitle">글제목</td>
		<td id="noticeSub">피어나기 전인 유소</td>
	</tr>
	<tr>
		<td colspan="2" id="noticecontent">
		하였으며 예수는 무엇을 위하여 광야에서 방황하였으며 
		</td>
	</tr>
	<tr>
		<td colspan="2" id="noticeBtn" align="right">
		<input type="button" value="수정" class="noticeBtnDeco">
		<input type="button" value="삭제" class="noticeBtnDeco">
		</td>
	</tr>
</table>

</section>
</body>
</html>