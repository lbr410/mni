<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>멍냥이 관리자 : 공지사항 등록</title>
</head>
<link rel="stylesheet" type="text/css" href="/mni/css/noticeWrite.css">
<body>
<div class="divSize">
<%@ include file="admin_header/admin_header_6.jsp" %>
	<section>
	<br><br>
		<article>
		<form name="noticeWrite" action="noticeWrite_ok.jsp" method="post">
			<div class="textFocus">
			<input type="text" name="notice_title"><label>글제목</label></div><br>
			<textarea name="notice_content"></textarea><br><br>
			<input type="reset" value="모두 지우기" class="buttonDeco">
			<input type="submit" value="작성" class="buttonDeco">
		</form>
		</article>
	</section>
</div>
</body>
</html>