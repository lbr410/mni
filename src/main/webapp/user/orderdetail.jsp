<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import = "java.util.*" %>
<%@page import = "java.text.*" %>
<%@page import = "com.mni.ord.*" %>
<%@page import = "com.mni.userInfo.*" %>
<jsp:useBean id = "odao" class = "com.mni.ord.OrdDAO"></jsp:useBean>
<jsp:useBean id = "udao" class = "com.mni.userInfo.userInfoDAO"></jsp:useBean>
<jsp:useBean id = "rdao" class = "com.mni.review.ReviewDAO"></jsp:useBean>
<%request.setCharacterEncoding("utf-8");%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>멍냥이 : 주문내역</title>
<link rel = "stylesheet" type = "text/css" href = "/mni/css/orderdetail.css">
</head>
<%
if(session.getAttribute("sidx") == null){
   %>
   <script>
      window.alert('로그인 후 이용 바랍니다.');
      location.href = 'login.jsp';
   </script>
   <%
}else{
int idx = (int)session.getAttribute("sidx");
ArrayList<OrdDTO> arr = odao.UserOrderSelect(idx);
%>
<body>
<%@include file = "/header.jsp" %>
<%
userInfoDTO dto = udao.loginCheck(id);
%>
<section class = "ordersection">
   <article>
   <br>
	<h1>주문내역</h1>
   
   <% 
      String user_name = (String)session.getAttribute("sname");
      DecimalFormat df = new DecimalFormat();
       df.applyLocalizedPattern("#,###,###원");
      %>
      
  

   <%
   if(arr == null || arr.size() == 0){
	   %>
	   <h1 class = "h1"></h1>
	   <div class = "orderList">주문 내역이 없습니다.</div>
	   <%
   }else{
	%>

   <%for(int i = 0 ; i < arr.size() ; i++){ %>
   <h3><%=arr.get(i).getOrder_date() %></h3>
   <hr>
   <div><img src = "/mni/admin/product_img/<%=arr.get(i).getProd_title_img() %>" alt = "상품이미지" class = "productimg"></div>
      <table>
         <tr>   
            <th>상품명</th>
            <td><%=arr.get(i).getProd_name() %></td>
         </tr>
         <tr>
            <th>주문번호</th>
            <td><%=arr.get(i).getOrder_idx() %></td>
         </tr>
         <tr>   
            <th>결제방법</th>
            <%
            if(arr.get(i).getOrder_type().equals("card")){
            	%>
            	<td>신용카드</td>
            	<%
            }else if(arr.get(i).getOrder_type().equals("tel")){
            	%>
            	<td>휴대폰</td>
            	<%
            }
            %>
         </tr>
         <tr>   
            <th>결제금액</th>
            <td><%=df.format(arr.get(i).getOrder_total_price()) %></td>
         </tr>
         <tr>
         	<th class="margin1">상품수량</th>
         	<td class="margin1"><%=arr.get(i).getOrder_count() %>개</td>
         </tr>
      </table>
      <%if(arr.get(i).getOrder_state().equals("미승인")){ %>
         <div class = "a">
         <span class = "spanready">주문완료&nbsp;</span>
         <input type = "button" value = "주문취소" class = "button" onclick = "javascript:location.href='userOrderCancel.jsp?ord_idx=<%=arr.get(i).getOrder_idx()%>'">
         </div>
         <%
      		}else if(arr.get(i).getOrder_state().equals("상품준비중")){
      			%>
      			<div class = "a">
      	         <span class = "span">배송준비중&nbsp;</span>
      	         <input type = "button" value = "주문취소" class = "button" onclick = "javascript:location.href='userOrderCancel.jsp?ord_idx=<%=arr.get(i).getOrder_idx()%>'">
      	         </div>
      	        <%

      		}else if(arr.get(i).getOrder_state().equals("배송중")){
      			%>
      			<div class = "a">
      	         <span class = "span">배송중&nbsp;</span>
      	         <input type = "button" value = "수취확인" class = "button" onclick = "javascript:location.href='userReceiptConfirmation.jsp?ord_idx=<%=arr.get(i).getOrder_idx()%>&prod_idx=<%=arr.get(i	).getProd_idx()%>'">
      	         </div>
      			<%
      		}else if(arr.get(i).getOrder_state().equals("주문취소") || arr.get(i).getOrder_state().equals("승인거절")){
      			%>
      			<div class = "a">
      	         <span class = "span">주문취소</span>
      	         </div><br>
      	        <%
      		}else if(arr.get(i).getOrder_state().equals("배송완료")){
      			String reviewButton_s = rdao.prodReview(idx,arr.get(i).getProd_idx(),arr.get(i).getOrder_idx());
      			if(reviewButton_s != null){
      				int reviewButton = Integer.parseInt(reviewButton_s);
      				if(reviewButton == arr.get(i).getOrder_idx()){
      					%>
              			<div class = "a">
              	         <span class = "span">배송완료</span>
              	         </div>
              	        <%
      				}else{
      					%>
              			<div class = "a">
              	         <span class = "span">배송완료&nbsp;</span>
              	         <input type="button" value="리뷰작성" class="button" 
              	         onclick="location.href='/mni/user/reviewWrite.jsp?prod_idx=<%=arr.get(i).getProd_idx() %>&user_idx=<%=idx%>&order_idx=<%=arr.get(i).getOrder_idx()%>'">
              	         </div>
              	        <%
      				}
      			}else{
      				%>
          			<div class = "a">
          	         <span class = "span">배송완료&nbsp;</span>
          	         <input type="button" value="리뷰작성" class="button" 
          	         onclick="location.href='/mni/user/reviewWrite.jsp?prod_idx=<%=arr.get(i).getProd_idx() %>&user_idx=<%=idx%>&order_idx=<%=arr.get(i).getOrder_idx()%>'">
          	         </div>
          	        <%
      			}
      		}
      }
}
}
         %>
   </article>
</section>
<%@include file = "../footer.jsp" %>
</body>
</html>