<%@page import="com.mni.ord.OrdDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.mni.cart.*" %>
<%@page import="java.text.*"%>
<%
	ArrayList<CartDTO> arr = new ArrayList<CartDTO>();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>멍냥이 : 장바구니</title>
</head>
<link rel="stylesheet" type="text/css" href="/mni/css/usercart.css">
<body>
<%@ include file="/header.jsp" %>
<jsp:useBean id="cdao" class="com.mni.cart.CartDAO"></jsp:useBean>
<section>
	<article>
	<br>
	<h1>장바구니</h1>
	<form name="cart" action="/mni/product/payment.jsp" method="post">
	<table>
	<%
		Integer idx = (Integer)session.getAttribute("sidx");
		DecimalFormat df = new DecimalFormat("#,##0원");
		if(idx==null) {
	%>
			<script>
				window.alert('로그인 후 이용 바랍니다.');
				location.href = '/mni/user/login.jsp';
			</script>
	<%
			return;
		} else {
			ArrayList<CartDTO> table = cdao.cartList(idx);
			int total[] = cdao.totalCntPrice(idx);
		
			if(table.size()!=0) {
				for(int i=0; i<table.size(); i++) {
					if(i!=0) {
			%>
				<tr>
					<td class="td0">
					<input type="hidden" name="cart_idx" value="<%=table.get(i).getCart_idx() %>">
					<input type="hidden" name="total_price" value="<%=total[1] %>">
					<input type="hidden" name="cart_size" value="<%=table.size() %>">
					<input type="hidden" name="prod_idx" value="<%=table.get(i).getProd_idx() %>">
					<img src="../admin/product_img/<%=table.get(i).getProd_title_img() %>" alt="상품이미지" class="prodImg"></td>
					<td class="td1">
					<div class="fontSize"><%=table.get(i).getProd_name() %></div></td>
					<td class="td2">
						<input type="button" value="-" class="countBtn"
						onclick="javascript: var count = document.all.order_count[<%=i %>].value; 
									if(count > 1) {number = parseInt(count) - 1;}
									document.all.order_count[<%=i %>].value = number;
									location.href='/mni/user/cartCntMinus.jsp?prod_idx=<%=table.get(i).getProd_idx() %>'
									">
						<input type="text" name="order_count" value="<%=table.get(i).getCart_count() %>" class="countText">
						<input type="button" value="+" class="countBtn" 
						onclick="javascript: var count = document.all.order_count[<%=i %>].value; 
									number = parseInt(count) + 1;
									document.all.order_count[<%=i %>].value = number;
									location.href='/mni/user/cartCntplus.jsp?prod_idx=<%=table.get(i).getProd_idx() %>';
									"></td>
					<td class="fontSize2 td3"><%=df.format(table.get(i).getCart_total_price()) %></td>
					<td class="td4"><input type="button" value="삭제" class="deleteBtn" 
						onclick="javascript: location.href='cartDelete.jsp?user_idx=<%=idx %>&prod_idx=<%=table.get(i).getProd_idx() %>'">					
						</td>
				</tr>
			<%
					} else {
						%>
				<tr>
					<td class="td0">
					<input type="hidden" name="cart_idx" value="<%=table.get(i).getCart_idx() %>">
					<input type="hidden" name="total_price" value="<%=total[1] %>">
					<input type="hidden" name="cart_size" value="<%=table.size() %>">
					<input type="hidden" name="prod_idx" value="<%=table.get(i).getProd_idx() %>">
					<img src="../admin/product_img/<%=table.get(i).getProd_title_img() %>" alt="상품이미지" class="prodImg"></td>
					<td class="td1">
					<div class="fontSize"><%=table.get(i).getProd_name() %></div></td>
					<td class="td2">
						<input type="button" value="-" class="countBtn"
						onclick="javascript: var count = document.all.order_count.value; 
									number = parseInt(count) - 1;
									document.all.order_count.value = number;
									location.href='/mni/user/cartCntMinus.jsp?prod_idx=<%=table.get(i).getProd_idx() %>'
									">
						<input type="text" name="order_count" value="<%=table.get(i).getCart_count() %>" class="countText">
						<input type="button" value="+" class="countBtn" 
						onclick="javascript: var count = document.all.order_count.value;
									number = parseInt(count) + 1; 
									document.all.order_count.value = number;
									location.href='/mni/user/cartCntplus.jsp?prod_idx=<%=table.get(i).getProd_idx() %>';
									"></td>
					<td class="fontSize2 td3"><%=df.format(table.get(i).getCart_total_price()) %></td>
					<td class="td4"><input type="button" value="삭제" class="deleteBtn" 
						onclick="javascript: location.href='cartDelete.jsp?user_idx=<%=idx %>&prod_idx=<%=table.get(i).getProd_idx() %>'">					
						</td>
				</tr>
						<%
					}
					arr.add(table.get(i));
				}
			%>
				<tr class="orderTd">
					<td colspan="5">
					<input type="submit" value="총 <%=total[0] %>개 | <%=df.format(total[1]) %> 주문하기" class="orderBtn"></td>
				</tr>
			<%
			} else {
				%>
					<tr><td class="cartEmpty">장바구니에 담긴 물건이 없습니다. 🥲</td></tr>
				<%	
			}
		}
		
		session.setAttribute("cart", arr);
	%>
	</table>
	</form>
	</article>
</section>
<%@ include file="/footer.jsp" %>
</body>
</html>