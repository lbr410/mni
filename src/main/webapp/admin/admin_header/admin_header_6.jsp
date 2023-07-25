<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
header{
	margin-top: 0;
	float: left;
}
.top{
	float: left;
	height: 720px;
	width: 280px;
	background-color: #ff7f50;
}
.logo{
	height: 100px;
	width: 200px;
	margin-top: 60px;
	margin-left: 45px;
	margin-bottom: 30px;
}
.logo img{
	height: 80px;
	width: 200px;
	cursor: pointer;
}
.menu{
	width: 280px;
	height: 480px;
}
.list{
	width: 280px;
	height: 40px;
	list-style: none;
	margin-bottom: 14px;
}
.list1 a{
	text-align: center;
	width: 280px;
	height: 40px;
	font-size: 18px;
	color: #ea5514;
	background-color: white;
	text-decoration: none;
	font-weight: bold;
	padding-top: 14px;
	display: block;
}
.list a{
	text-align: center;
	width: 280px;
	height: 40px;
	font-size: 18px;
	color: #333333;
	text-decoration: none;
	font-weight: bold;
	padding-top: 14px;
	display: block;
}
.list a:hover{
	background-color: white;
	color: #ea5514;
	font-weight: bold;
}
.logout a{
	float: right;
	padding-right: 18px;
	text-decoration: none;
	color: black;
	font-size: 12px;
	font-weight: bold;
}

</style>
<header>
	<div class="top">
	<div class="logo">
		<img class="mainlogo" src="/mni/img/whitelogo.png" alt="mainlogo">
	</div>
	<div class="menu">
		<div class="list"><a href="/mni/admin_header/admin_header_1.jsp">주문내역</a></div>
		<div class="list"><a href="/mni/admin_header/admin_header_2.jsp">상품관리</a></div>
		<div class="list"><a href="/mni/admin_header/admin_header_3.jsp">회원목록</a></div>
		<div class="list"><a href="/mni/admin_header/admin_header_4.jsp">리뷰내역</a></div>
		<div class="list"><a href="/mni/admin_header/admin_header_5.jsp">매출집계</a></div>
		<div class="list1"><a href="/mni/admin_header/admin_header_6.jsp">공지사항</a></div>
	</div>
	<div class="logout"><a href="#">로그아웃</a></div>
	</div>
</header>