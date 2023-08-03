<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.mni.review.*" %>
<jsp:useBean id="rdao" class="com.mni.review.ReviewDAO"></jsp:useBean>
<%
request.setCharacterEncoding("utf-8");
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
<title>멍냥이 관리자 : 리뷰내역</title>
<link rel="stylesheet" type="text/css" href="/mni/css/adminList.css">
<script>
function reviewDel(review_idx){
	let del = window.confirm('리뷰를 삭제하시겠습니까?');
	if(del){
	location.href='/mni/admin/reviewDelete.jsp?review_idx='+review_idx;
	}else{
	location.href='/mni/admin/reviewList.jsp';
	}
}
</script>
</head>
<%
int totalCnt = rdao.adminReviewCnt(); //총 게시물 수
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
<%@ include file="admin_header/admin_header_4.jsp" %>
<h1>리뷰 내역</h1>
<section>
<article>
	<form name="reviewList" action="/mni/admin/reviewListSearch.jsp" method="post">
	<div><input type="text" name="review_search" placeholder="상품명 입력" id="searchBox" required>
	<input type="submit" value="검색" class="seaBtnDeco">
	</div>
	</form>
		<table>
		<thead>
			<tr>
				<th>NO.</th>
				<th id="thup">상품번호</th>
				<th>상품명</th>
				<th>아이디</th>
				<th>리뷰사진</th>
				<th>리뷰내용</th>
				<th>작성일</th>
				<th></th>
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
            %>&nbsp;&nbsp;<button class="<%=button %>" onclick="javascript:location.href='/mni/admin/reviewList.jsp?cp=<%=i%>'"><%=i %></button>&nbsp;&nbsp;<%
            if(i == totalPage){
               break;
            }
         }
         if(userGroup != (totalPage/pageButton-(totalPage%pageButton==0?1:0))){
            %><a href="/mni/admin/reviewList.jsp?cp=<%=(userGroup+1)*pageButton+1%>">&gt;&gt;</a><%
         }
         %>
         </td>
         </tr>
		</tfoot>
		<tbody>
		<%ArrayList<ReviewDTO> arr = rdao.getReview(cp, pageCnt);
		if(arr == null || arr.size() == 0){
			 %>
	            <tr>
	               <td colspan="7" class="td">등록된 리뷰가 없습니다.</td>
	            </tr>
	            <%
		}else{
			for(int i=0; i<arr.size(); i++){
		%>
			<tr>
				<td><%=arr.get(i).getReview_idx() %></td>
				<td><%=arr.get(i).getProd_idx() %></td>
				<td><%=arr.get(i).getProd_name() %></td>
				<td><%=arr.get(i).getUser_id() %></td>
				<%System.out.println(arr.get(i).getReview_img()); %>

				<td><%if(arr.get(i).getReview_img() == null || arr.get(i).getReview_img().equals("-")){
					%>사진없음<%
					}else{%>
				<img alt="리뷰 사진" src="/mni/user/review_img/<%=arr.get(i).getReview_img() %>" class="title_img"></td>
				<%} %>

				<td><%=arr.get(i).getReview_content() %></td>
				<td><%=arr.get(i).getReview_date() %></td>
				<td><input type="button" value="삭제" class="reBtnDeco" onclick="reviewDel(<%=arr.get(i).getReview_idx()%>);"></td>
			</tr>
			<%
			}
			}%>
		</tbody>
		</table>
		</article>
	</section>
</div>
</body>
</html>