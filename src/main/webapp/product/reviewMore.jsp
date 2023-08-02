<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>멍냥이 : 리뷰 더 보기</title>
<jsp:useBean id="rdao" class="com.mni.review.ReviewDAO"></jsp:useBean>
<link rel="stylesheet" type="text/css" href="/mni/css/reviewMore.css">
</head>
<body>
<%
	String prod_idx_s = request.getParameter("idx");
	int prod_idx = Integer.parseInt(prod_idx_s);
%>
<%@ include file="/header.jsp" %>
	<br><div>
	<h2 class="titleMargin"><a>구매후기</a></h2>
	<hr class="hrStyle titleMargin">
	</div>
	<section>
	<article>
	<%
		int cp = ;
		int pageCnt = ;
		rdao.productReview(prod_idx, cp, pageCnt);
	%>
	<div>
	<img src="/mni/img/orijen.jpg" alt="이미지" class="proImg">
		<span class="SpanMargin">abc</span><br>
		<span class="SpanMargin">2023-01-01</span>
	</div>
		<div class="contentDesign">ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ</div>
	<div>
		<img src="/mni/user/review_img/" alt="review image">
	</div>
	<hr class="hrStyle">
		<div>
	<img src="/mni/img/orijen.jpg" alt="이미지" class="proImg">
		<span class="SpanMargin">abc</span><br>
		<span class="SpanMargin">2023-01-01</span>
	</div>
		<div class="contentDesign">ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ</div>
	<div>
		<img src="/mni/user/review_img/" alt="review image" onError="this.style.visibility='hidden'">
	</div>
	<hr class="hrStyle">
</article>
</section>
<%@ include file="/footer.jsp" %>
</body>
</html>