<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<%
	String prod_idx_s = request.getParameter("idx");
	int prod_idx = Integer.parseInt(prod_idx_s);
%>
<%@ include file="/header.jsp" %>
	<br><div>
	<h2 class="titleMargin"><a>구매후기</a></h2>
	<hr class="hrStyle titleMargin">
	</div>
	<section>
	<article>
	<%
		int totalCnt = rdao.productReviewCnt(prod_idx); // 총 게시물 수
		int pageCnt = 10;// 한 페이지당 게시물 개수
		int pageButton = 10; // 페이지 버튼 개수
	
		String cp_s = request.getParameter("cp");
		if(cp_s==null || cp_s.equals("")){
			cp_s = "1";
		}
	
		int cp = Integer.parseInt(cp_s);
		if(totalCnt==0) {
			totalCnt = 1;
		}
		
		int totalPage = totalCnt/pageCnt+1;
		if(totalCnt%pageCnt==0) {
			totalPage--;
		}
		
		int userGroup = cp / pageButton;
		if(cp % pageButton == 0){
			userGroup--;
		}
		
		ArrayList<ReviewDTO> table = rdao.productReview(prod_idx, cp, pageCnt);
		for(int i=0; i<table.size(); i++) {
	%>
	
	<div>
	<img src="/mni/img/logo.png" alt="이미지" class="proImg">
		<span class="SpanMargin"><%=table.get(i).getUser_id() %></span><br>
		<span class="SpanMargin"><%=table.get(i).getReview_date() %></span>
	</div>
		<div class="contentDesign"><%=table.get(i).getReview_content() %></div>
	<div>
		<img src="/mni/user/review_img/<%=table.get(i).getReview_img() %>" alt="review image" class="reviewImg" onError="this.style.visibility='hidden'">
	</div>
	<hr class="hrStyle">
	<div>
	<%
		}
		if(userGroup!=0) {
	%>		<a href="reviewMore.jsp?prod_idx=<%=prod_idx %>&cp=<%=userGroup*pageButton%>">&lt;&lt;</a><%
		}
	    for(int i = userGroup*pageButton+1; i<=(userGroup+1)*pageButton; i++) {
			String button = i == cp ? "nowPage":"page";
			%>&nbsp;&nbsp;<button class="<%=button %>" onclick="javascript:location.href='/mni/product/reviewMore.jsp?idx=<%=prod_idx %>&cp=<%=i%>'"><%=i %></button>&nbsp;&nbsp;<%
			if(i == totalPage){ 
				break;
			}
		}
		if(userGroup!=(totalPage/pageButton-(totalPage%pageButton == 0 ? 1 : 0))) {
			%><a href="/mni/product/reviewMore.jsp?idx=<%=prod_idx %>cp=<%=(userGroup+1)*pageButton+1%>">&gt;&gt;</a><%
		}
         %>
	</div>
</article>
</section>
<%@ include file="/footer.jsp" %>
</body>
</html>