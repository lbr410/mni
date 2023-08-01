<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="rdao" class="com.mni.review.ReviewDAO"></jsp:useBean>
<%
String review_idx_s = request.getParameter("review_idx");
if(review_idx_s == null || review_idx_s.equals("")){
	%><script>
	window.alert('잘못된 접근입니다.');
	location.href='/mni/admin/reviewList.jsp';
	</script>
	<%
}
int review_idx = Integer.parseInt(review_idx_s);
int result = rdao.adminReviewDelete(review_idx);
String msg = result > 0 ? "리뷰 삭제 완료" : "리뷰 삭제 실패";
%>
<script>
window.alert('<%=msg%>');
location.href='/mni/admin/reviewList.jsp';
</script>