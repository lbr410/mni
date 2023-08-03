<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import = "java.util.*" %>
<%@page import = "java.text.*" %>
<%@page import = "com.mni.ord.*" %>
<jsp:useBean id = "odao" class = "com.mni.ord.OrdDAO"></jsp:useBean>
<%
request.setCharacterEncoding("utf-8");
if(session.getAttribute("sidx") == null){
   %>
   <script>
      window.alert('로그인후 이용해주세요.');
      location.href = 'login.jsp';
   </script>
   <%
}else{
int idx = (int)session.getAttribute("sidx");
ArrayList<OrdDTO> arr = odao.UserOrderSelect(idx);

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel = "stylesheet" type = "text/css" href = "/mni/css/orderdetail.css">
</head>
<body>
<%@include file = "../header.jsp" %>
<section class = "ordersection">
   <article>
   
   <div class = "userimg">
   <% 
      String user_name = (String)session.getAttribute("sname");
      DecimalFormat df = new DecimalFormat();
       df.applyLocalizedPattern("#,###,###원");
      %>
      <div class = "username">
      <%=user_name %> &nbsp;&nbsp;&nbsp;<div class = "settinglogo" onclick = "javascript:location.href='/mni/user/usercheck.jsp'"></div>
      </div>
   </div>
   <h1><%=user_name %>님의 주문내역</h1>
   <%for(int i = 0 ; i < arr.size() ; i++){ %>
   <h3><%=arr.get(i).getOrder_date() %></h3>
   <hr>
   <div class = "productimg"></div>
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
            <td><%=arr.get(i).getOrder_type() %></td>
         </tr>
         <tr>   
            <th>결제금액</th>
            <td><%=df.format(arr.get(i).getOrder_total_price()) %></td>
         </tr>
      </table>
      <%if(arr.get(i).getOrder_state().equals("미승인")){ %>
         <div class = "a">
         <span class = "spanready">주문완료</span>
         <input type = "button" value = "주문취소" class = "button" onclick = "javascript:location.href='userOrderCancel.jsp?ord_idx=<%=arr.get(i).getOrder_idx()%>'">
         <input type = "button" value = "수취확인" class = "button" onclick = "javascript:location.href='userReceiptConfirmation.jsp?ord_idx=<%=arr.get(i).getOrder_idx()%>'">
         </div>
         <%
      		}else if(arr.get(i).getOrder_state().equals("배송 준비중")){
      			%>
      			<div class = "a">
      	         <span class = "span">배송 준비중</span>
      	         <input type = "button" value = "주문취소" class = "button" onclick = "javascript:location.href='userOrderCancel.jsp?ord_idx=<%=arr.get(i).getOrder_idx()%>'">
      	         <input type = "button" value = "수취확인" class = "button" onclick = "javascript:location.href='userReceiptConfirmation.jsp?ord_idx=<%=arr.get(i).getOrder_idx()%>'">
      	         </div>
      	        <%
      		}else if(arr.get(i).getOrder_state().equals("주문취소")){
      			%>
      			<div class = "a">
      	         <span class = "span">주문취소</span>
      	         </div><br>
      	        <%
      		}else if(arr.get(i).getOrder_state().equals("배송완료")){
      			%>
      			<div class = "a">
      	         <span class = "span">배송 완료</span>
      	         <input type="button" value="리뷰작성" class="button" 
      	         onclick="location.href='/mni/user/reviewWrite.jsp?prod_idx=<%=arr.get(i).getProd_idx() %>'">
      	         </div>
      	        <%
      		}
      }
}
         %>
   </article>
</section>
<%@include file = "../footer.jsp" %>
</body>
</html>