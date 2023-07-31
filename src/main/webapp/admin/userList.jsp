<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.mni.userInfo.*" %>
<jsp:useBean id="udao" class="com.mni.userInfo.userInfoDAO"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>멍냥이 관리자 : 회원목록</title>
<link rel="stylesheet" type="text/css" href="/mni/css/adminList.css">
</head>
<%
/**페이징*/
int totalCnt = udao.userCnt();
int pageCnt = 15;
int pageButton = 10;

String cp_s = request.getParameter("cp");
if(cp_s == null || cp_s.equals("")){
   cp_s = "1";
}
int cp = Integer.parseInt(cp_s);

if(totalCnt == 0){
	totalCnt=1;
}
int totalPage = totalCnt / pageCnt +1;
if(totalCnt % pageCnt == 0){
   totalPage--;
}

int userGroup = cp / pageButton;
if(cp % pageButton == 0){
   userGroup--;
}
%>
<body>
<%@ include file="admin_header/admin_header_3.jsp" %>
<h1>회원 목록</h1>
<section>
	<div><input type="text" name="user_search" placeholder="검색어 입력" id="searchBox">
	<input type="button" value="검색" class="seaBtnDeco">
	</div>
		<table>
		<thead>
			<tr>
				<th>NO.</th>
				<th>아이디</th>
				<th id="thup">비밀번호</th>
				<th>이름</th>
				<th>주민번호</th>
				<th>이메일</th>
				<th>연락처</th>
				<th>주소</th>
				<th>가입일자</th>
				<th id="thup">탈퇴여부</th>
			</tr>
			</thead>
			<tfoot>
         <tr>
            <td colspan="10" align="center">
         <%
         /**페이징*/
         if(userGroup != 0){
            %><a href="userList.jsp?cp=<%=userGroup*pageButton%>">&lt;&lt;</a><%
         }
         for(int i = userGroup*pageButton+1; i<=(userGroup+1)*pageButton; i++){
            String button = i == cp ? "nowPage":"page";
            %>&nbsp;&nbsp;<button class="<%=button %>" onclick="javascript:location.href='userList.jsp?cp=<%=i%>'"><%=i %></button>&nbsp;&nbsp;<%
            if(i == totalPage){
               break;
            }
         }
         if(userGroup != (totalPage/pageButton-(totalPage%pageButton==0?1:0))){
            %><a href="userList.jsp?cp=<%=(userGroup+1)*pageButton+1%>">&gt;&gt;</a><%
         }
         %>
         </td>
         </tr>
         </tfoot>
			<tbody>
			<%
			ArrayList<userInfoDTO> arr = udao.userInfoSelect(cp, pageCnt);//회원 목록 메서드
			if(arr == null || arr.size() == 0){
				%>
				<tr>
				<td colspan="10" class="td">등록된 회원이 없습니다.</td>
			</tr>
			<%
			}
			for(int i=0; i<arr.size(); i++){
			%>
			<tr>
				<td><%=arr.get(i).getUser_idx() %></td>
				<td><%=arr.get(i).getUser_id() %></td>
				<td><%=arr.get(i).getUser_pwd() %></td>
				<td><%=arr.get(i).getUser_name() %></td>
				<td><%=arr.get(i).getUser_jumin_front() %>-<%=arr.get(i).getUser_jumin_back() %></td>
				<td><%=arr.get(i).getUser_email() %></td>
				<td><%=arr.get(i).getUser_tel() %></td>
				<td><%=arr.get(i).getUser_addr1() %>&nbsp;<%=arr.get(i).getUser_addr2() %></td>
				<td><%=arr.get(i).getUser_joindate() %></td>
				<td><%=arr.get(i).getUser_delete() %></td>
			</tr>
			<%} %>
			</tbody>
		</table>
	</section>
</body>
</html>