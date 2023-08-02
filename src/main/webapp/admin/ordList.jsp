<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.mni.ord.*" %>
<jsp:useBean id="odao" class="com.mni.ord.OrdDAO"></jsp:useBean>
<%
String admin_id = (String)session.getAttribute("admin_saveid");
String ck = "";
Cookie cks[]=request.getCookies();
if(cks!=null){
	for(int i=0; i<cks.length; i++){
		//자동 로그인 쿠키 유무
		if(cks[i].getName().equals("admin_auto")){
			ck = cks[i].getValue();
		}
	}
	if(admin_id == null && !ck.equals("admin")){
		%><script>
		window.alert('로그인 후 이용가능합니다.');
		location.href='/mni/admin/index_admin.jsp';
		</script>
		<%
	}
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>멍냥이 관리자 : 주문내역</title>
<link rel="stylesheet" type="text/css" href="/mni/css/adminList.css">
<script>
function orderSign(order_idx){
	let sign = window.confirm('승인하시겠습니까?');
	if(sign){
		location.href='/mni/admin/ordSign.jsp?order_idx='+order_idx;
	}else{
		location.href='/mni/admin/ordList.jsp';
	}
}
function orderDeclined(order_idx){
	let sign = window.confirm('승인을 거절하시겠습니까?');
	if(sign){
		location.href='/mni/admin/ordDeclined.jsp?order_idx='+order_idx;
	}else{
		location.href='/mni/admin/ordList.jsp';
	}
}
function orderDelevery(order_idx){
	let sign = window.confirm('배송 처리하시겠습니까?');
	if(sign){
		location.href='/mni/admin/ordDelevery.jsp?order_idx='+order_idx;
	}else{
		location.href='/mni/admin/ordList.jsp';
	}
}
</script>
</head>
<%
int totalCnt = odao.getProductCnt(); //총 게시물 수
int pageCnt = 10; // 한 페이지당 게시물 개수
int pageButton = 10; // 페이지 버튼 개수

String cp_s = request.getParameter("cp");
if(cp_s == null || cp_s.equals("")){
	cp_s = "1";
}
int cp = Integer.parseInt(cp_s); //사용자 현재 위치

if(totalCnt == 0){
	totalCnt = 1;
}
int totalPage = totalCnt / pageCnt +1; //총 페이지 수
if(totalCnt % pageCnt == 0){
	totalPage--;
}
int userGroup = cp / pageButton; //유저 그룹 위치
if(cp % pageButton == 0){
	userGroup--;
}
%>
<body>
<div class="divSize">
<%@ include file="admin_header/admin_header_1.jsp" %>
<h1>주문 내역</h1>
	<section>
	<article>
	<form name="ordListSearch" action="/mni/admin/ordListSearch.jsp" method="post">
	<div class="searchBox"><input type="text" name="ord_search" placeholder="사용자 ID 입력" id="searchBox" required>
	<input type="submit" value="검색" class="seaBtnDeco">
	</div>
	</form>
	<div class="misord"><input type="checkbox" name="ord_checkbox" value="미승인 주문">미승인 주문</div>
		<table>
		<thead>
			<tr id="trUp">
				<th>주문번호</th>
				<th>주문일시</th>
				<th>아이디</th>
				<th>이름</th>
				<th>상품정보</th>
				<th>수량</th>
				<th>상태</th>
				<th>결제방법</th>
				<th>금액</th>
				<th>우편번호</th>
				<th>주소1</th>
				<th>주소2</th>
				<th>받는분</th>
				<th>요청사항</th>
			</tr>
			</thead>
			<tfoot>
			<tr>
            <td colspan="14" align="center">
         <%
         /**페이징*/
         if(userGroup != 0){
            %><a href="productList.jsp?cp=<%=userGroup*pageButton%>">&lt;&lt;</a><%
         }
         for(int i = userGroup*pageButton+1; i<=(userGroup+1)*pageButton; i++){
            String button = i == cp ? "nowPage":"page";
            %>&nbsp;&nbsp;<button class="<%=button %>" onclick="javascript:location.href='/mni/admin/ordList.jsp?cp=<%=i%>'"><%=i %></button>&nbsp;&nbsp;<%
            if(i == totalPage){
               break;
            }
         }
         if(userGroup != (totalPage/pageButton-(totalPage%pageButton==0?1:0))){
            %><a href="productList.jsp?cp=<%=(userGroup+1)*pageButton+1%>">&gt;&gt;</a><%
         }
         %>
         </td>
         </tr>
			</tfoot>
			<tbody>
			<%
			ArrayList<OrdDTO> arr = odao.prodSelect();
			if(arr == null || arr.size() == 0){
				 %>
		            <tr>
		               <td colspan="14" class="td">등록된 주문이 없습니다.</td>
		            </tr>
		            <%
			}else{
				for(int i=0; i<arr.size(); i++){
			%>
			<tr>
				<td><%=arr.get(i).getOrder_idx() %></td>
				<td><%=arr.get(i).getOrder_date() %></td>
				<td><%=arr.get(i).getUser_id() %></td>
				<td><%=arr.get(i).getUser_name() %></td>
				<td><%=arr.get(i).getProd_title() %></td>
				<td><%=arr.get(i).getOrder_count() %>개</td>
				<%if(arr.get(i).getOrder_state().equals("미승인")){ %>
				<td>
				<input type="button" value="승인" class="ordBtnDeco" onclick="orderSign(<%=arr.get(i).getOrder_idx()%>)">	
				<input type="button" value="거절" class="ordBtnDeco" onclick="orderDeclined(<%=arr.get(i).getOrder_idx()%>)">
				</td>
				<%}else if(arr.get(i).getOrder_state().equals("상품준비중")){
					%><td><%=arr.get(i).getOrder_state() %>
					<input type="button" value="배송" class="ordBtnDeco" onclick="orderDelevery(<%=arr.get(i).getOrder_idx()%>)"></td><%	
				}else{ %>
				<td><%=arr.get(i).getOrder_state() %></td>
				<%} %>
				<td><%=arr.get(i).getOrder_type() %></td>
				<td><%=arr.get(i).getOrder_price() %>원</td>
				<td><%=arr.get(i).getOrder_zip() %></td>
				<td><%=arr.get(i).getOrder_addr1() %></td>
				<td><%=arr.get(i).getOrder_addr2() %></td>
				<td><%=arr.get(i).getOrder_recie() %></td>
				<td><%=arr.get(i).getOrder_req() %></td>
			</tr>
			<%
				}
			}
			%>
			</tbody>
		</table>
		</article>
	</section>
</div>
</body>
</html>