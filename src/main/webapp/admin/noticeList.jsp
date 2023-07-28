<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.mni.notice.*" %>
<jsp:useBean id="ndao" class="com.mni.notice.NoticeDAO" ></jsp:useBean>
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
<title>멍냥이 관리자 : 공지사항 보기</title>
<link rel="stylesheet" type="text/css" href="/mni/css/adminList.css">
</head>
<body>
<%@ include file="admin_header/admin_header_6.jsp" %>
<h1>공지사항</h1>
<section>
<div id="noticelist"><a href="notice.jsp">목록으로</a></div>
<table id="noticetable">
	<tr>
		<td id="noticetitle">글제목</td>
		<td id="noticeSub"><%=dto.getNotice_title() %></td>
	</tr>
	<tr>
		<td colspan="2" id="noticecontent">
		<%=dto.getNotice_content() %>
		</td>
	</tr>
	<tr>
		<td colspan="2" id="noticeBtn" align="right">
		<a href="noticeUpdate.jsp?idx=<%=dto.getNotice_idx()%>"><input type="button" value="수정" class="noticeBtnDeco"></a>
		<a href="noticeDelete.jsp?idx=<%=dto.getNotice_idx()%>"><input type="button" value="삭제" class="noticeBtnDeco"></a>
		</td>
	</tr>
</table>

</section>
</body>
</html>