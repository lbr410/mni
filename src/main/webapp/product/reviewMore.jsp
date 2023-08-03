<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@ page import="com.mni.review.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>멍냥이 : 리뷰 더 보기</title>
<link rel="stylesheet" type="text/css" href="/mni/css/reviewMore.css">
</head>
<body>
<jsp:useBean id="rdao" class="com.mni.review.ReviewDAO"></jsp:useBean>
<%@ include file="/header.jsp" %>
<% 
	String prod_idx_s = request.getParameter("idx");
	int prod_idx = Integer.parseInt(prod_idx_s);
	
	int totalCnt = rdao.prodReviewCnt(prod_idx);
	int pageCnt = 10;
	int pageButton = 10;
	
	String cp_s = request.getParameter("cp");
	if(cp_s == null || cp_s.equals("")) {
		cp_s = "1";
	}
	int cp = Integer.parseInt(cp_s);

	if(totalCnt == 0) {
		totalCnt = 1;
	}
	int totalPage = totalCnt / pageCnt + 1; //총 페이지 수
	if(totalCnt % pageCnt == 0) {
		totalPage--;
	}
	int userGroup = cp / pageButton; //유저 그룹 위치
	if(cp % pageButton == 0) {
		userGroup--;
	}
%>
	<h2><a>구매후기</a></h2>
	<hr class="hrStyle">
	<section>
	<article>
	<%
		ArrayList<ReviewDTO> table = rdao.prodReviewMore(prod_idx, cp, pageCnt);
		for(int i=0; i<table.size(); i++) {
	%>
	<div>
	<img src="/mni/img/orijen.jpg" alt="이미지" class="proImg">
		<span class="SpanMargin"><%=table.get(i).getUser_id() %></span><br>
		<span class="SpanMargin"><%=table.get(i).getReview_date() %></span>
	</div>
		<div class="contentMargin"><%=table.get(i).getReview_content() %></div>
	<div>
		<img src="/mni/user/review_img/<%=table.get(i).getReview_img() %>" alt="review image" onError="this.style.visibility='hidden'">
	</div>
	<hr class="hrStyle">
	<%
		}
	%>
	<div>
	<%
	if(userGroup != 0){
            %><a href="reviewMore.jsp?idx=<%=prod_idx %>&cp=<%=userGroup*pageButton%>">&lt;&lt;</a><%
         }
         for(int i = userGroup*pageButton+1; i<=(userGroup+1)*pageButton; i++){
            String button = i == cp ? "nowPage":"page";
            %>&nbsp;&nbsp;<button class="<%=button %>" onclick="javascript:location.href='/mni/product/reviewMore.jsp?idx=<%=prod_idx %>&cp=<%=i%>'"><%=i %></button>&nbsp;&nbsp;<%
            if(i == totalPage){
               break;
            }
         }
         if(userGroup != (totalPage/pageButton-(totalPage%pageButton==0?1:0))){
            %><a href="/mni/product/reviewMore.jsp?idx=<%=prod_idx %>&cp=<%=(userGroup+1)*pageButton+1%>">&gt;&gt;</a><%
         }
         %>
	</div>
</article>
</section>
<%@ include file="/footer.jsp" %>
</body>
</html>