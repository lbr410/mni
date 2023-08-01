<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오리젠</title>
<link rel="stylesheet" type="text/css" href="/mni/css/category.css">

</head>
<%@ include file="header.jsp" %>

<body>
   <div class="bar">홈 > 카테고리 > 간식</div>
   <div class="menu">
      <div class="category">
         <div class="list1">카테고리</div>
         <div class="list2"><a href="/mni/feed.jsp">사료</a></div>
         <div class="list3"><a href="/mni/snack.jsp">간식</a></div>
         <div class="list2"><a href="/mni/supplies.jsp">용품</a></div>
         <div class="list2"><a href="/mni/toy.jsp">장난감</a></div>
      </div>
   </div>
   <div class="head-title">간식</div>
   <div class="prodNum"><% %>개의 상품</div>
   <div class="prodSection">
    <main>
       <div class="brand-list-item">
           <div class="brand-image-wrapper">
                <a href="#"><img src="/mni/img/200_01_01.png" alt="brand image" name="brand"></a>
           </div>
           <div class="description-section">
                <div class="description-section_title" id="title">아투</div>
                 <div class="description-section_content">오리젠 캣앤키튼 1.8kg</div>
                <div class="description-section_price">36,000원</div>
           </div>
        </div>
        <div class="brand-list-item">
            <div class="brand-image-wrapper">
                <a href="#"><img src="/mni/img/200_01_02.png" alt="brand image" name="brand"></a>
            </div>
            <div class="description-section">
                <div class="description-section_title" id="title">배송비 포함</div>
               <div class="description-section_content">오리젠 캣앤키튼 340g</div>
                <div class="description-section_price">11,000원</div>
            </div>
          </div>
        <div class="brand-list-item">
            <div class="brand-image-wrapper">
                <a href="#"><img src="/mni/img/200_01_03.png" alt="brand image" name="brand"></a>
            </div>
            <div class="description-section">
                <div class="description-section_title" id="title">배송비 포함</div>
                <div class="description-section_content">오리젠 캣앤키튼 5.4kg</div>
                <div class="description-section_price">11,000원</div>
            </div>
         </div>
    </main>
    <main>
       <div class="brand-list-item">
           <div class="brand-image-wrapper">
                <a href="#"><img src="/mni/img/200_01_04.png" alt="brand image" name="brand"></a>
           </div>
           <div class="description-section">
                <div class="description-section_title" id="title">배송비 포함</div>
                <div class="description-section_content">오리젠 6 피쉬 캣 340g</div>
                <div class="description-section_price">11,500원</div>
           </div>
        </div>
        <div class="brand-list-item">
            <div class="brand-image-wrapper">
                <a href="#"><img src="/mni/img/200_01_05.png" alt="brand image" name="brand"></a>
            </div>
            <div class="description-section">
                <div class="description-section_title" id="title">배송비 포함</div>
                <div class="description-section_content">오리젠 6 피쉬 캣 1.8kg</div>
                <div class="description-section_price">35,000원</div>
            </div>
          </div>
        <div class="brand-list-item">
            <div class="brand-image-wrapper">
                <a href="#"><img src="/mni/img/200_01_06.png" alt="brand image" name="brand"></a>
            </div>
            <div class="description-section">
                <div class="description-section_title" id="title">배송비 포함</div>
                <div class="description-section_content">오리젠 6 피쉬 캣 5.4kg</div>
                <div class="description-section_price">92,000원</div>
            </div>
         </div>
    </main>
    </div>
<%@ include file="footer.jsp" %>
</body>
</html>