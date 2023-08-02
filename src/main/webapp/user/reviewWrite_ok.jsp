<%
	request.setCharacterEncoding("UTF-8");
%>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*" %>
<%@ page import="org.apache.catalina.filters.ExpiresFilter.XServletOutputStream"%>
<%@ page import="com.oreilly.servlet.*"%>
<%@ page import="com.mni.review.*" %>
<jsp:useBean id="rdao" class="com.mni.review.ReviewDAO"></jsp:useBean>
<%	
	File f = new File(request.getRealPath("/user/review_img"));
	if(!f.exists()){
		f.mkdir();
	}
	
	String savePath = request.getRealPath("/user/review_img");
	int size = 10485760; // 10MB
	MultipartRequest mr = new MultipartRequest(request, savePath, size, "UTF-8", new DefaultFileRenamePolicy());
	String nfile = mr.getFilesystemName("review_img");
	
	int count = rdao.reviewWrite(mr);
	if(count>0) {
	%>
		<script>
			window.alert('리뷰 작성 성공!');
			location.href = '/mni/user/orderdetail.jsp';
		</script>
	<%
	} else {
	%>
		<script>
			window.alert('리뷰 작성 실패!');
			location.href = '/mni/user/orderdetail.jsp';
		</script>
	<%		
	}

%>