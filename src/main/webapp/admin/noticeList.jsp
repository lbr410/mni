<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.mni.notice.*" %>
<jsp:useBean id="ndao" class="com.mni.notice.NoticeDAO" ></jsp:useBean>
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
<div class="divSize">
<%@ include file="admin_header/admin_header_6.jsp" %>
<h1>공지사항</h1>
<section>
<article>
<div id="noticelist"><a href="notice.jsp">목록으로</a></div>
<table id="noticetable">
	<tr>
		<td id="noticetitle">글제목</td>
		<td id="noticeSub"><%=dto.getNotice_title() %></td>
	</tr>
	<tr>
		<td colspan="2" id="noticecontent">
		<div class="contentDiv"><%=dto.getNotice_content().replaceAll("\n", "<br>") %></div>
		</td>
	</tr>
	<tr>
		<td colspan="2" id="noticeBtn" align="right">
		<a href="noticeUpdate.jsp?idx=<%=dto.getNotice_idx()%>"><input type="button" value="수정" class="noticeBtnDeco"></a>
		<a href="noticeDelete.jsp?idx=<%=dto.getNotice_idx()%>"><input type="button" value="삭제" class="noticeBtnDeco"></a>
		</td>
	</tr>
</table>
</article>
</section>
</div>
</body>
</html>