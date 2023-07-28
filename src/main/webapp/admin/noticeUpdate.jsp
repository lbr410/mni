<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.mni.notice.*" %>
<jsp:useBean id="ndao" class="com.mni.notice.NoticeDAO"></jsp:useBean>
<%
	String idx_s=request.getParameter("idx");
	if(idx_s==null || idx_s.equals("")){
		idx_s="0";
	}
	int idx=Integer.parseInt(idx_s);
	NoticeDTO dto=ndao.noticeContent(idx);
	
	if(dto==null){
		%>
		<script>
		window.alert('잘못된 접근 또는 삭제된 게시글입니다.');
		location.href='/mni/admin/notice.jsp';
		</script>
		<%
		return;
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>멍냥이 관리자 : 공지사항 수정</title>
</head>
<link rel="stylesheet" type="text/css" href="/mni/css/noticeUpdate.css">
<body>
<div class="divSize">
<%@ include file="admin_header/admin_header_6.jsp" %>
	<section>
	<br><br>
		<article>
		<form name="noticeUpdate" action="noticeUpdate_ok.jsp?idx=<%=dto.getNotice_idx()%>" method="post">
			<div class="textFocus">
			<input type="text" name="notice_title" value="<%=dto.getNotice_title() %>"><label>글제목</label></div><br>
			<textarea name="notice_content"><%=dto.getNotice_content() %></textarea><br><br>
			<input type="reset" value="모두 지우기" class="buttonDeco">
			<input type="submit" value="수정" class="buttonDeco">
		</form>
		</article>
	</section>
</div>
</body>
</html>