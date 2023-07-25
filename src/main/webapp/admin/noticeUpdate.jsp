<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>멍냥이 관리자 : 공지사항 수정</title>
</head>
<link rel="stylesheet" type="text/css" href="/mni/css/noticeUpdate.css">
<body>
	<section>
		<article>
		<form name="noticeUpdate" action="noticeUpdate_ok.jsp" method="post">
			<div class="textFocus"><label>글제목</label>
			<input type="text" name="notice_title" class="text_size" value="제목 수정"></div><br>
			<textarea name="notice_content">이곳은 수정할 내용</textarea><br><br>
			<input type="reset" value="모두 지우기" class="buttonDeco">
			<input type="submit" value="수정" class="buttonDeco">
		</form>
		</article>
	</section>
</body>
</html>