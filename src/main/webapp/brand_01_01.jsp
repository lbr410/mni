<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오리젠</title>
<link rel="stylesheet" type="text/css" href="../css/brand.css">
<style>
.bar{
	width: 990px;
	height: 20px;
	padding-top: 15px;
	padding-bottom: 10px;
	padding-left: 10px;
	background-color: #f3f3f3;
	font-size: 12px;
	text-align: left;
	margin-bottom: 15px;
}
.top{
	width: 960px;
	height: 60px;
	padding-top: 10px;
	padding: 20px;
}
.brandlogo{
	width:200px;
	height: 50px;
	overflow: hidden;
}
.banner{
	width: 1000px;
	height: 350px;
}
.imgslide{
	width: 1000px;
	height: 350px;
}
.menu{
	margin: 0 auto;
	width: 1000px;
	display: 
}
.category{
	float: left;
	width: 150px;
	height: 1200px;
	border-right: 1px solid #cccccc;
	margin-top: 24px;
}
.list1{
	border-bottom: 1px solid #cccccc;
	padding: 14px;
	color: #ff7f50;
}
.list2{
	padding: 14px;
}
.head-title{
	float: left;
    width: 650px;
    font-size: 32px;
    font-weight: bold;
    padding-top: 60px;
    padding-bottom:30px;
    color: #3a3a3a;
}
.main{
    width: 600px;
}
.brand-image-wrapper {
    position: relative;
    width: 236px;
	height: 268px;
    overflow: hidden;
    border-radius: 20px;
}
.brand-image-wrapper img {
    width: 500px;
    height: 500px;
}
.description-section {
    margin-top: 13px;
    display: flex;
    flex-direction: column;
    font-size: 15px;
    color: rgb(34, 34, 34);  
    gap: 3px;
}
.description-section_title {
    color: dimgrey;
    margin: 0;
    font-size: 18px;
    text-align: center;
}
#title{
	cursor: pointer;
}
main {
    display: flex;
    justify-content: center;
    padding: 24px 40px;
    margin: 0;
}
#brand-items-wrapper {
    display: grid;
    grid-template-columns: repeat(4, 236px);
    justify-items: center;
    align-items: left;
    box-sizing: border-box;
    gap: 10px 19px;
}
.brand-image-wrapper img{
	width: 236px;
	height: 268px;
	overflow: hidden;
}
.brand-image-wrapper:hover{
	cursor:pointer;
}
</style>
</head>
<%@ include file="header.jsp" %>

<body>
	<div class="bar">홈 > 브랜드 > 오리젠</div>
	<div class="top">
		<div class="brandlogo">
			<img class="brandlogo" src="../img/orijen.png" alt="logo">
		</div>
	</div>
    <div class="banner">
        <img class="imgslide" src="../img/imgslide.jpg" alt="banner">
   	</div>
	<div class="menu">
		<div class="category">
			<div class="list1"><a href="#">카테고리</a></div>
			<div class="list2"><a href="#">전체</a></div>
			<div class="list2"><a href="#">사료</a></div>
		</div>
	</div>
	<div class="head-title">전체</div>
	<main>
        <div id="brand-items-wrapper">
         <div class="brand-list-item">
            <div class="brand-image-wrapper">
                <a href="#"><img src="../img/imgslide.jpg" alt="brand image" name="brand"></a>
            </div>
            <div class="description-section">
                <div class="description-section_title" id="title">오리젠</div>
            </div>
          </div>
         <div class="brand-list-item">
            <div class="brand-image-wrapper">
                <a href="#"><img src="../img/imgslide.jpg" alt="brand image" name="brand"></a>
            </div>
            <div class="description-section">
                <div class="description-section_title" id="title">아카나</div>
            </div>
          </div>
          <div class="brand-list-item">
            <div class="brand-image-wrapper">
                <a href="#"><img src="../img/imgslide.jpg" alt="brand image" name="brand"></a>
            </div>
            <div class="description-section">
                <div class="description-section_title" id="title">로얄캐닌</div>
            </div>
          </div>
        </div>
    </main>
    <main>
    	<div class="brand-list-item">
           <div class="brand-image-wrapper">
                <a href="#"><img src="../img/imgslide.jpg" alt="brand image" name="brand"></a>
           </div>
           <div class="description-section">
                <div class="description-section_title" id="title">아투</div>
           </div>
        </div>
        <div class="brand-list-item">
            <div class="brand-image-wrapper">
                <a href="#"><img src="../img/imgslide.jpg" alt="brand image" name="brand"></a>
            </div>
            <div class="description-section">
                <div class="description-section_title" id="title">아투</div>
            </div>
          </div>
        <div class="brand-list-item">
            <div class="brand-image-wrapper">
                <a href="#"><img src="../img/imgslide.jpg" alt="brand image" name="brand"></a>
            </div>
            <div class="description-section">
                <div class="description-section_title" id="title">아투</div>
            </div>
         </div>

    </main>
</body>
</html>