<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>멍냥이 관리자 : 매출집계</title>
<link rel="stylesheet" type="text/css" href="/mni/css/sales.css">
<script>
	function dateCheck() {
		if(document.sales.startDate.valueAsDate>document.sales.endDate.valueAsDate) {
			window.alert('시작 날짜가 끝나는 날짜보다 클 수 없습니다.');
			return false;
		}
		<%
		String startDate = request.getParameter("startDate");
		String endDate = request.getParameter("endDate");
		%>
	}
</script>
</head>
<body>
<div class="divSize">
<%@ include file="admin_header/admin_header_5.jsp" %>
	<section>
	<br><br><br>
	<span>매출집계</span><br><br><br><br><br>
		<article>
			<form name="sales" action="sales.jsp" method="post" onsubmit="return dateCheck()">
				<input type="date" class="date_size" name="startDate" min="1970-01-01">&nbsp;~
				<input type="date" class="date_size" name="endDate" min="1970-01-01">
				<script>
					document.sales.startDate.valueAsDate = new Date();
					document.sales.endDate.valueAsDate = new Date();
				</script>
				<input type="submit" value="조회"><br><br><br>
				<div class="font_Deco">조회기간 : 2023-01-01 ~ 2023-07-25</div>
				<div class="font_Deco2"><label>매출 : ?원</label></div>
			</form>
		</article>
	</section>
</div>
</body>
</html>