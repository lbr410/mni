<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/mni/css/orderComplete.css">
<style>
section{
	margin: 0px auto;
	width: 1000px;
}
section h1{
	width: 1000px;
	margin-top: 30px;
}
hr{
	margin-top: 10px;
	background-color: black;
	height: 1px;
	border: 0;
}
.ordUser{
	float:left;
	height: 100px;
	 width: 450px;
	 margin-top: 40px;
	 margin-left: 30px;
}
.ordPay{
	float:right;
	height: 150px;
	 width: 450px;
	 margin-top: 40px;
	 margin-left: 30px;
}
.line{
	border-left: 3px solid #e9e9e9;
	height: 150px;
	left: 50%;
	position: absolute;
}
.span{
	font-weight: bold;
	margin-left: 50px;
}
.ordCom{
	margin-top: 30px;
}
#hr{
	width: 1000px;
	background-color: #e9e9e9;
}
#mainButton{
	margin-top:15px;
	text-align: center;
	font-size:20px;
	color:white;
	background-color: #ff7f50;
	text-decoration: none;
	width: 180px;
	height: 40px;
	border-radius: 2px;
	cursor: pointer;
	border: 0;
}
#ordButton{
	margin-top:15px;
	text-align: center;
	font-size:20px;
	color:#ff7f50;
	background-color: white;
	text-decoration: none;
	width: 180px;
	height: 40px;
	border-radius: 2px;
	cursor: pointer;
	border: 0.5px solid;
	border-color: #ff7f50;
}
</style>
</head>
<body>
<%@include file="/header.jsp" %>
<section>
<article>
	<div>
	<h1>주문완료</h1>
	<hr>
	</div>
	<div>
	<h1>주문이 완료되었습니다! 멍냥이를 이용해주셔서 감사합니다!</h1>
	<hr>
	</div>
	<div>
	<h1>상품 배송 정보</h1>
	</div>
</article>
</section>
<section>
<article>
	<div class="ordUser">
	<h2>받는 사람 정보</h2>
	<div class="ordCom">
	<span>받는사람</span>
	<span class="span">홍길동</span>
	</div>
	<div>
	<span>받는주소</span>
	<span class="span">서울특별시 서대문구 연희동 연희로 242</span>
	</div>
	<div>
	<span>요청사항</span>
	<span class="span">부재 시 연락주세요</span>
	</div>
	</div>
	<div class="ordPay">
	<div class="line">
	<h2>결제 정보</h2>
	<div class="ordCom">
	<span>주문금액</span>
	<span class="span">17,000원</span>
	</div>
	<div>
	<span>결제방법</span>
	<span class="span">신용카드</span>
	</div>
	<div>
	<span>총 결제금액</span>
	<span class="span">17,000원</span>
	</div>
	</div>
	</div>
</article>
</section>
<hr id="hr">
<section>
<article>
<form action="">
		<input type="button" value="주문 상세보기" id="ordButton">
		<input type="button" value="쇼핑 계속하기" id="mainButton">
	</form>
</article>
</section>
<%@include file="/footer.jsp" %>
</body>
</html>