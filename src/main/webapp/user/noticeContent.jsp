<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.mni.notice.*" %>
<jsp:useBean id="ndto" class="com.mni.notice.NoticeDTO"></jsp:useBean>
<jsp:setProperty property="*" name="ndto"/>
<jsp:useBean id="ndao" class="com.mni.notice.NoticeDAO"></jsp:useBean>
<%
String idx_s=request.getParameter("notice_idx");
int idx=Integer.parseInt(idx_s);
NoticeDTO dto=ndao.userNoticeContent(idx);

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 내용</title>
<link rel="stylesheet" type="text/css" href="/mni/css/noticeContent.jsp">
</head>
<%@ include file="/header.jsp" %>
<div class="bar">공지사항</div>
<section>
	<article>
	<h2>공지사항</h2>
		<table >
			<thead>
				<tr>
					<th>번호</th>
					<td><%=dto.getNotice_idx()%></td>
					<th>작성날짜</th>
					<td><%=dto.getNotice_date() %></td>
				</tr>
				<tr>
					<th>작성자</th>
					<td><%=dto.getAdmin_id() %></td>
					<th>조회수</th>
					<td><%=dto.getNotice_count() %></td>
				</tr>
				<tr>
					<th>제목</th>
					<td colspan="3"><%=dto.getNotice_title() %></td>
				</tr>
				<tr height="250">
				<td colspan="3"><%=dto.getNotice_content() %></td>
				</tr>
		</table>
		<input type="button" value="목록" onclick = "javascript:location.href='/mni/user/noticeList.jsp'">
	</article>
</section>
<%@ include file="/footer.jsp" %>
</body>
</html>