<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>멍냥이 : 리뷰작성</title>
</head>
<link rel="stylesheet" type="text/css" href="/mni/css/reviewWrite.css">
<script>
	function textCheck() {
		document.all.textLength.innerHTML = document.reviewWrite.review_content.value.length;
	}
</script>
<body>
<%@ include file="../header.jsp" %>
<section>
	<article>
	<br><h1>리뷰작성</h1>
		<form name="reviewWrite" action="reviewWrite_ok.jsp" method="post">
		<table class="tableSize">
			<tr>
				<td colspan="3"><textarea placeholder="최대 200자까지 입력 가능합니다."
				name="review_content" onkeyup="textCheck()"></textarea></td>
			</tr>
			<tr>
				<td colspan="3"><div class="textCount">(<span id="textLength">0</span> / 200)</div></td>
			</tr>
			<tr>
				<td><label class="menu">이미지 등록</label></td>
				<td><input type="file" name="review_img"></td>
				<td><input type="submit" value="작성">
			</tr>
		</table>
		</form>
	</article>
</section>
<span>footer.jsp 수정 후 footer 불러와야함!!</span>
</body>
</html>