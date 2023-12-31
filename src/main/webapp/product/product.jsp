<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.text.*" %>
<%@ page import="com.mni.product.*" %>
<%@ page import="com.mni.review.*" %>
<jsp:useBean id="pdao" class="com.mni.product.ProductDAO" scope="session"></jsp:useBean>
<jsp:useBean id="rdao" class="com.mni.review.ReviewDAO" scope="session"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%
   Integer sidx = (Integer)session.getAttribute("sidx");

   String idx_s = request.getParameter("idx");
   if(idx_s==null || idx_s=="") {
%>
   <script>
      window.alert('해당 상품은 존재하지 않습니다.');
      location.href = '/mni/index.jsp';
   </script>
<%
      return;
   }
   
   int idx = Integer.parseInt(idx_s);
%>
<title>멍냥이 : 상품상세</title>
<link rel="stylesheet" type="text/css" href="/mni/css/product.css">
</head>
<body>
<%@include file="/header.jsp"%>
<%
   DecimalFormat df = new DecimalFormat("#,##0원");
   ProductDTO dto = pdao.prodDetail(idx);
   
   int totalPrice = dto.getProd_price();
   String prod_idx_s = request.getParameter("idx");
   int prod_idx = Integer.parseInt(prod_idx_s);
%>
<script>
   // 갯수 버튼 눌렀을 때 갯수 증감, 갯수에 따라 주문 금액 변경
   function prodCount(type) {
      var count = document.product.cart_count.value;
      var prod_count = <%=dto.getProd_count()%>;
      
      if(type === 'plus') {
    	  if(prod_count == 0){
    		window.alert('재고가 없습니다.');
    		document.product.cart_count.value = 0;
    	  }else{
    		  if(count >= prod_count){
    			  window.alert('재고가 부족하여 더이상 담으실 수 없습니다.');
    		  }else{
    				number = parseInt(count) + 1;
    		  }
    	}
        
      } else if(type === 'minus') {
         if(count > 1) {
            number = parseInt(count) - 1;
         }
      }
      
      document.product.cart_count.value = number;
      var total = <%=dto.getProd_price() %> * number;
      document.product.cart_total_price.value = total;
      document.product.cart_total_price2.value = total.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")+'원';      
   }
   
   function product_soldout(){
	   var count = document.product.cart_count.value;
	   var prod_count = <%=dto.getProd_count()%>;
	   
	   if(count > prod_count){
		   window.alert('재고가 부족하여 더이상 담으실 수 없습니다.');
		   return false;
	   }else{
		  return true;
	   }
	      
   }
</script>
<section class="section">
<article>
   <div class="prod">
   <div class="prodimg">
   <img alt="상품이미지" src="/mni/admin/product_img/<%=dto.getProd_title_img()%>">
   </div>
   <div class="prodtitle">
   <div class="prodname">
   <h1><%=dto.getProd_title() %></h1><br>
   </div>
   <div class="prodprice">
   <h1><%=df.format(dto.getProd_price()) %></h1><br>
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
   <form name="product" action="/mni/product/product_ok.jsp" method="post" onsubmit = "return product_soldout()">
      <input type="hidden" name="prod_idx" value="<%=idx %>">
      <input type="hidden" name="user_idx" value="<%=sidx %>">
      <div class="prodcount">
      <div class="prodcount_prod">&nbsp;<%=dto.getProd_name() %></div>
      &nbsp;<input type="button" value="ㅡ" onclick="prodCount('minus');" class="button_m">&nbsp;
      <input type="text" name="cart_count" maxlength="2" 
      id="prodcount" value="1" class="cart_count">&nbsp;
      <input type="button" value="+" onclick="prodCount('plus')" class="button_p">
      <div class = "prod_count">수량 : <%=dto.getProd_count() %> 남음<span><%=df.format(dto.getProd_price()) %></span></div>
      </div>
      <hr id="hr">
      <div class="prodcart">
      <span>&nbsp;주문금액</span>
      <input type="hidden" name="cart_price" value="<%=dto.getProd_price() %>">
      <input type="hidden" name="cart_total_price" value="<%=dto.getProd_price() %>">
      <input type="text" name="cart_total_price2" value="<%=df.format(dto.getProd_price()) %>" class="order_price" readonly>
      </div>
      <%
         if(sidx==null) {
      %>
         <input type="button" value="장바구니" onclick="javascript: window.alert('로그인 후 이용 가능합니다.');location.href='/mni/user/login.jsp'" id="cartBtn">
      <%   } else {
      		if(dto.getProd_count() == 0){
      			%>
      			<input type="button" value="품절" id="cartBtn">
      			<%
      		}else{
      			%>
      			<input type="submit" value="장바구니" id="cartBtn">
      			<%
      		}
         } %>
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
   <li><a href="/mni/user/noticeList.jsp">문의</a></li>
   </ul>
</article>
</section>
<hr id="ulhr">
<section class="section">
<article>
   <div id="detail_img">
   <img alt="상세이미지" src="/mni/admin/product_img/<%=dto.getProd_info_img() %>" class = "detail_imgs">
   </div>
</article>
</section>
<section class="section">
<article>
<div>
   <a name="review" class = "a">구매후기</a>
   <span class = "rv"><a href="/mni/product/reviewMore.jsp?idx=<%=prod_idx %>">리뷰 더 보기</a></span>
  </div> 
   <hr id="ulhr" class="detail_hr">
      </article>
   </section>
<section class="section">
<article>
<%
   ArrayList<ReviewDTO> table = rdao.reviewList(idx);

   if(table==null || table.size()==0) {
%>
      <div class = "none_rv">등록된 리뷰가 없습니다.</div>
<%
   } else {
      int forSize = table.size()<=3 ? table.size() : 3;
      for(int i=0; i<forSize; i++) {
%>
</article>
</section>
   <section class="section">
   <article>
   <div class="reviewImg">
      </div>
         <div class="review_id">
         <div>
         <span><%=table.get(i).getUser_id() %></span>
         
         </div>
         <div>
         <span><%=table.get(i).getReview_date() %></span>
         </div>
         </div>
         <div class="review_content">
         <span><%=table.get(i).getReview_content().replaceAll("\n", "<br>") %></span>
         </div>
         <div>
         <a href="/mni/user/review_img/<%=table.get(i).getReview_img() %>" target="blank">
         <img src="/mni/user/review_img/<%=table.get(i).getReview_img() %>" alt="review image" class="reviewContentImg" onError="this.style.visibility='hidden'"></a>
         </div>
         <hr class="review_hr">
<%
      }
   }
%>
</article>
</section>
<section class="section">
<article>
   <h1 class="section_rv"></h1>
   <fieldset>
   <ul>
      <li><h3><a name="cancel">주문취소</a></h3></li>
      <li class="cancel">주문취소는 '미승인' 단계에서만 가능합니다.</li>
      <li class="cancel">주문 내 일부 상품의 부분 취소는 불가능합니다.</li>
      <li class="cancel">주문취소는 '마이페이지 > 주문취소' 를 통해 직접 취소하실 수 있습니다.</li>
   </ul>
   </fieldset>
</article>
</section>
<%@ include file="/footer.jsp"%>
</body>
</html>