<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>멍냥이 관리자 : 공지사항 등록</title>
</head>
<link rel="stylesheet" type="text/css" href="/mni/css/noticeWrite.css">
<body>
	<section>
		<article>
		<form name="noticeWrite" action="noticeWrite_ok.jsp" method="post">
			<div class="textFocus">
			<input type="text" name="notice_title"><label>글제목</label></div><br>
			<textarea name="notice_content"></textarea><br><br>
			<input type="reset" value="모두 지우기" class="buttonDeco">
			<input type="submit" value="작성" class="buttonDeco">
		</form>
		</article>
	</section>
</body>
</html>