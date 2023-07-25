<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/mni/css/header.css">
<link rel="stylesheet" type="text/css" href="/mni/css/product.css">
</head>
<body>
<%@include file="/header.jsp"%>
<section class="section">
<article>
	<div class="prod">
	<div class="prodimg">
	<img alt="상품이미지" src="/mni/img/12345.png">
	</div>
	<div class="prodtitle">
	<div class="prodname">
	<h1>상품명</h1><br>
	</div>
	<div class="prodprice">
	<h1>27,000원</h1><br>
	</div>
	<hr>
	<div class="info">
	본 상품은 유통기한 책임제 상품이며,
	</div>
	<div>
	멍냥이에서 100% 정품임을 보증합니다.
	</div>
	<div>
	안심하시고 급여하세요!
	</div>
	<div class="prodcount">
	<div class="prodcount_prod">&nbsp;상품명12312321</div>
	<form name="prodcount">
	&nbsp;<input type="button" value="ㅡ" onclick="prodCount();">&nbsp;
	<input type="text" name="prodcount" maxlength="2" id="prodcount">&nbsp;
	<input type="button" value="+" onclick="prodCount();">
	<span>27,000원</span>
	</form>
	</div>
	<hr id="hr">
	<div class="prodcart">
	<span>&nbsp;주문금액</span>
	<span id="prodcart">54,000원</span>
	</div>
	<form name="cart">
		<input type="button" value="장바구니" id="cart">
	</form>
	</div>
	</div>
</article>
</section>
<section class="section">
<article>
	<ul class="ul">
	<li><a href="#detail">상세정보</a></li>
	<li><a href="#review">구매후기</a></li>
	<li><a href="#trade">교환 및 반품</a></li>
	<li><a href="/mni/notice.jsp">문의</a></li>
	</ul>
</article>
</section>
<hr id="ulhr">
<section class="section">
<article>
	<h2><a name="detail">상세정보</a></h2>
	<hr class="detail_hr">
	<h1>상품명</h1>
	<div id="detail_img">
	<img alt="상세이미지" src="/mni/img/123.jpg">
	</div>
</article>
</section>
<section>
<article class="section">
	<h2><a name="review">구매후기</a></h2>
	<hr class="detail_hr">
</article>
</section>
<%@include file="/footer.jsp"%>
</body>
</html>