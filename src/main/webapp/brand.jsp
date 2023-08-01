<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>브랜드</title>
<link rel="stylesheet" type="text/css" href="/mni/css/brand.css">
</head>
<%@ include file="header.jsp" %>
<body>
<div class="bar">홈 > 브랜드</div>
<div class="head-title">브랜드</div>
	<main>
        <div id="brand-items-wrapper">
         <div class="brand-list-item">
            <div class="brand-image-wrapper">
                <a href="javascript:location.href='brand_01_01.jsp?brandNum=100'"><img src="mni/img/orijen_logo.png" alt="brand image" name="brand"></a>
            </div>
            <div class="description-section">
                <div class="description-section_title" id="title">오리젠</div>
            </div>
          </div>
         <div class="brand-list-item">
            <div class="brand-image-wrapper">
                <a href="javascript:location.href='brand_01_01.jsp?brandNum=200'"><img src="/mni/img/imgslide.jpg" alt="brand image" name="brand"></a>
            </div>
            <div class="description-section">
                <div class="description-section_title" id="title">아카나</div>
            </div>
          </div>
          <div class="brand-list-item">
            <div class="brand-image-wrapper">
                <a href="javascript:location.href='brand_01_01.jsp?brandNum=300'"><img src="/mni/img/imgslide.jpg" alt="brand image" name="brand"></a>
            </div>
            <div class="description-section">
                <div class="description-section_title" id="title">로얄캐닌</div>
            </div>
          </div>
          <div class="brand-list-item">
            <div class="brand-image-wrapper">
                <a href="javascript:location.href='brand_01_01.jsp?brandNum=400'"><img src="/mni/img/imgslide.jpg" alt="brand image" name="brand"></a>
            </div>
            <div class="description-section">
                <div class="description-section_title" id="title">아투</div>
            </div>
          </div>
        </div>
    </main>
<%@ include file="footer.jsp" %>
</body>

</html>