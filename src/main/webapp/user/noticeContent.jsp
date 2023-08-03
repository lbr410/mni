<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.mni.notice.*" %>
<jsp:useBean id="ndto" class="com.mni.notice.NoticeDTO"></jsp:useBean>
<jsp:setProperty property="*" name="ndto"/>
<jsp:useBean id="ndao" class="com.mni.notice.NoticeDAO"></jsp:useBean>
<%
String idx_s=request.getParameter("userNotice_idx");
int idx=Integer.parseInt(idx_s);
NoticeDTO dto=ndao.userNoticeContent(idx);

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 내용</title>
<style>
h2{
	text-align: center;
	padding-bottom: 20px;
}
table{
	width:800px;
	padding-top: 10px;
	border-spacing: 0px;
}
.th1{
	background-color: #ff7f50;
	color:white;
	height: 30px;
}
.th2{
	background-color: #ff7f50;
	color:white;
	height: 30px;
	border-bottom: 1px solid white;
}
.td1{
	border-bottom: 1px solid #ff7f50;
	padding-left: 10px;
}
.td2{
	border-top: 1px solid #ff7f50;
	border-bottom: 1px solid #ff7f50;
	padding-left: 10px;
}
.content{
	border-bottom: 1px solid #ff7f50;
}
#noticelist {
	display: inline-block;
	margin-left:750px;
	font-size: 12px;
	font-weight: normal;
}
.contentDiv{
	margin-top: 15px;
	margin-bottom: 15px;
	margin-right: 20px;
    width: 630px;
    text-align: left;
}
</style>
</head>
<%@include file = "/header.jsp" %>
<section>
	<article>
	<h2>공지사항</h2>
		<table>
			<thead>
				<tr>
					<th class="th2">번호</th>
					<td class="td2" ><%=dto.getNotice_idx()%></td>
					<th class="th2">작성날짜</th>
					<td class="td2"><%=dto.getNotice_date() %></td>
				</tr>
				<tr>
					<th class="th2">작성자</th>
					<td class="td1"><%=dto.getAdmin_id() %></td>
					<th class="th1">조회수</th>
					<td class="td1"><%=dto.getNotice_count()%></td>
				</tr>
				<tr>
					<th class="th1">제목</th>
					<td colspan="3" class="td1"><%=dto.getNotice_title() %></td>
				</tr>
				<tr>
					<td colspan="4" class="content">
					<div class="contentDiv"><%=dto.getNotice_content().replaceAll("\n", "<br>") %></div></td>
				</tr>
		</table>
		<div id="noticelist"><a href="/mni/user/noticeList.jsp">목록으로</a></div>
	</article>
</section>
<%@ include file="/footer.jsp" %>
</body>
</html>