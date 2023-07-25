<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="/mni/css/header.css">
    <header>
    <div id="member">
        <a id="memberjoin" href="/mni/join.jsp">회원가입</a>
        <div class="t"></div>
        <a class="login" href="/mni/login.jsp">로그인</a>
        <div class="t"></div>
        <a class="center" href="#">고객센터</a>
    </div><br>
    <div class="header-content">
        <div class="logo">
            <img class="mainlogo" src="/mni/img/mainlogo.png" alt="mainlogo">
        </div>
        <div class="l-logo">
        <span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
        <button class="l-button">
            <img class="dog" src="/mni/img/dog.jpg" alt="dog-icon">
            <div>강아지</div>
        </button>
        <span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
        <button class="r-button" id="active-button">
            <img class="inactive-img" src="/mni/img/cat-inactive.jpg" alt="cat-inactive icon">
            <img class="active-img" src="/mni/img/cat-active.jpg" alt="cat-active icon">
            <div>고양이</div>
        </button>
        </div>
        <form class="little-search">
            <input type="text" maxlength="30" name="search" id="search" placeholder="검색어를 입력하세요.">
                <div id="magnifying-glass wrapper">
                    <img id="search-icon" src="/mni/img/magnifying glass icon.png" alt="magnifying glass icon">
                </div>
        </form>
    <span class="top-right"> </span>
    </div>
    <section>
        <div class="dropdown">
            <nav class="dropbtn">
                <span class="dropbtn_icon123">카테고리</span>
            </nav>
            <div class="dropdown-content">
                <a href="#">사료</a>
                <a href="#">간식</a>
                <a href="#">용품</a>
                <a href="#">장난감</a>
            </div>
        </div>
        <div class="btn">베스트</div>
        <div class="btn">신상품</div>
        <div class="btn">브랜드</div>
        <div class="right-section">
        <div class="cart-button" id="cart-icon">
            <img class="inactive-cart" src="/mni/img/cart-inactive.png" alt="cart-icon">
            <img class="active-cart" src="/mni/img/cart-active.png" alt="cart-icon">
        </div>
        <div class="my-button" id="my-icon">
            <img class="inactive-my" src="/mni/img/mypage-inactive.png" alt="mypage-icon">
            <img class="active-my" src="/mni/img/mypage-active.png" alt="mypage-icon">
        </div>
        </div>
    </section>
</header>
    