<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>멍냥이 : 리뷰작성</title>
</head>
<style>
	/*.menu {
		display: inline-block;
		width: 90px;
		font-weight: bold;
	}*/
	
	.tableSize {
		margin-top: 40px;
		height: 600px;
	}
	
	h1 {
		font-size: 30px;
	}
	
	textarea {
	    width: 580px;
	    height: 400px;
	    resize: none;
	    padding: 12px;
	    font-size: 14px;
	    color: #111111;
	    border: 0;
	    border: 1px #cccccc solid;
	    font-family: '맑은 고딕';
	}
	
	textarea:focus {
		border-color:#ff7f50;
	    outline: none;
	}
</style>
<body>
<%@ include file="../header.jsp" %>
<section>
	<article>
	<br><h1>리뷰작성</h1>
		<form name="reviewWrite" action="reviewWrite_ok.jsp" method="post">
		<table class="tableSize">
			<tr>
				<td><label class="menu">이미지 등록</label></td>
				<td><input type="file" name="review_img"></td>
			</tr>
			<tr>
				<td><label class="menu">리뷰 작성</label></td>
				<td><textarea name="review_content"></textarea></td>
			</tr>
		</table>
		</form>
	</article>
</section>
<span>footer.jsp 수정 후 footer 불러와야함!!</span>
</body>
</html>