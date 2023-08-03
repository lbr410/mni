<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>멍냥이 : 결제완료</title>
<style>
section{
	margin: 0px auto;
	width: 1000px;
	
}
section h1{
	width: 1000px;
	margin-top: 30px;
}

.ordUser{
	float:left;
	height: 100px;
	 width: 450px;
	 margin-top: 20px;
	 margin-left: 30px;
}
.ordPay{
	float:right;
	height: 150px;
	 width: 450px;
	 margin-top: 20px;
	 margin-left: 30px;
}
.line{
	border-left: 1px solid #cccccc;
	height: 220px;
	left: 50%;
	position: absolute;
	padding-left: 40px;
}
.span{
	margin-left: 50px;
}
.ordCom{
	margin-top: 30px;
	margin-bottom: 10px;
}

#mainButton{
	margin-top:15px;
	text-align: center;
	font-size:16px;
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
	font-size:16px;
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

.orderComplete {
	text-align: center;
}

.hrStyle {
	background: #cccccc;
	height: 1px;
	border: 0;
	margin-top: 20px;
	margin-bottom: 20px;
	width: 1000px;
}

.menu {
	font-weight: bold;
}

.divWidth {
	width: 400px;
}

.divFloat {
	float: left;
}

.divHeight {
	height: 30px;
}
</style>
</head>
<body>
<%@include file="/header.jsp" %>
<section>
<article>
	<div class="orderComplete">
	<h1>❤️주문이 완료되었습니다. 멍냥이를 이용해주셔서 감사합니다. 😘❤️</h1>
	<hr class="hrStyle">
	</div>
	<div class="ordUser">
	<h2>🐶 받는 사람 정보</h2>
	<div class="ordCom">
	<span class="menu">받는사람</span>
	<span class="span">홍길동</span>
	</div>
	<div>
	<div class="menu divFloat">받는주소&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
	<div class="span divWidth">12345</div>
	<div class="menu divFloat">　　　　&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
	<div class="span divWidth">서울특별시 동작구 만양로 19길 78</div>
	<div class="menu divFloat divHeight">　　　　&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
	<div class="span divWidth">행복한우리아파트 707동 101호</div>
	</div>
	<div>
	</div>
	<div class="ordCom">
	<span class="menu">요청사항</span>
	<span class="span">부재 시 연락주세요ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ</span>
	</div>
	</div>
	<div class="ordPay">
	<div class="line">
	<h2>😺 결제 정보</h2>
	<div class="ordCom">
	<span class="menu">결제방법</span>
	<span class="span">신용카드</span>
	</div>
	<div>
	<span class="menu">결제금액</span>
	<span class="span">17,000원</span>
	</div>
	</div>
	</div>
</article>
</section><br><br><br><br>
<hr class="hrStyle">
<section>
<article>
<form action="">
		<input type="button" value="주문 상세보기" id="ordButton" onclick="location.href='/mni/user/orderdetail.jsp';">
		<input type="button" value="쇼핑 계속하기" id="mainButton" onclick="location.href='/mni/index.jsp';">
	</form>
</article>
</section>
<%@include file="/footer.jsp"%>
</body>
</html>