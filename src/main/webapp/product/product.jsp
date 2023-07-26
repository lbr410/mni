<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	<h1>로얄캐닌 인도어 4kg 변냄새 감소</h1><br>
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
	<div class="prodcount_prod">&nbsp;로얄캐닌 인도어 4kg 변냄새 감소</div>
	<form name="prodcount">
	&nbsp;<input type="button" value="ㅡ" onclick="prodCount();">&nbsp;
	<input type="text" name="prod_count" maxlength="2" id="prodcount" value="1">&nbsp;
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
		<input type="button" value="장바구니" onclick="" id="cart">
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
	<li><a href="#cancel">취소안내</a></li>
	<li><a href="/mni/notice/noticeList.jsp">문의</a></li>
	</ul>
</article>
</section>
<hr id="ulhr">
<section class="section">
<article>
	<h2 id="section_dt"><a name="detail">상세정보</a></h2>
	<div id="detail_img">
	<img alt="상세이미지" src="/mni/img/123.jpg">
	</div>
</article>
</section>
<section class="section">
<article>
	<h2 class="section_rv"><a name="review">구매후기</a></h2>
	<hr class="detail_hr">
	<div class="reviewImg">
	</div>
</article>
</section>
<section class="section">
<article>
	<div class="review_id">
	<div>
	<span>홍길동</span>
	</div>
	<div>
	<span>2023.07.26</span>
	</div>
	</div>
	<div class="review_content">
	<span>항상 잘 먹어요. 추천합니다.</span>
	<hr class="review_hr">
	</div>
</article>
</section>
<section>
<article>
<h1>페이징 들어갈 부분</h1>
</article>
</section>
<section class="section">
<article>
	<h1 class="section_rv"><a name="cancel">취소안내</a></h1>
	<fieldset>
	<ul>
		<h3>주문취소</h3>
		<li class="cancel">주문취소는 '미승인' 단계에서만 가능합니다.</li>
		<li class="cancel">주문 내 일부 상품의 부분 취소는 불가능합니다.</li>
		<li class="cancel">주문취소는 '마이페이지 > 주문취소' 를 통해 직접 취소하실 수 있습니다.</li>
	</ul>
	</fieldset>
</article>
</section>
<%@include file="/footer.jsp"%>
</body>
</html>