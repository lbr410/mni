<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.mni.notice.*" %>
<jsp:useBean id="ndao" class="com.mni.notice.NoticeDAO"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<link rel="stylesheet" type="text/css" href="/mni/css/content.css">
<style>
.page{
   font-size: 20px;
   background-color:white;
   text-decoration: none;
   border: 0.5px solid;
   border-color: #ff7f50;
   cursor: pointer;
}
.nowPage{
   font-size: 20px;
   background-color:#ff7f50;
   text-decoration: none;
   border: 0.5px solid;
   border-color: white;
}
</style>
</head>
<%
int totalCnt = ndao.getTotal();
int pageCnt = 5;
int pageButton = 10;

String cp_s = request.getParameter("cp");
if(cp_s == null || cp_s.equals("")){
   cp_s = "1";
}
int cp = Integer.parseInt(cp_s);

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
<%@ include file="/header.jsp" %>
<div class="bar">공지사항</div>
   <h1>공지사항</h1>
   <section>
      <table>
      <thead>
         <tr>
            <th>NO.</th>
            <th>제목</th>
            <th>글쓴이</th>
            <th>작성일</th>
            <th>조회수</th>
         </tr>
         <tr>
      </thead>
      <tfoot>
         <tr>
            <td colspan="10" align="center">
         <%
         if(userGroup != 0){
            %><a href="productList.jsp?cp=<%=userGroup*pageButton%>">&lt;&lt;</a><%
         }
         for(int i = userGroup*pageButton+1; i<=(userGroup+1)*pageButton; i++){
            String button = i == cp ? "nowPage":"page";
            %>&nbsp;&nbsp;<button class="<%=button %>" onclick="javascript:location.href='productList.jsp?cp=<%=i%>'"><%=i %></button>&nbsp;&nbsp;<%
            if(i == totalPage){
               break;
            }
         }
         if(userGroup != (totalPage/pageButton-(totalPage%pageButton==0?1:0))){
            %><a href="productList.jsp?cp=<%=(userGroup+1)*pageButton+1%>">&gt;&gt;</a><%
         }
         %>
         </td>
         </tr>
         </tfoot>
      <tbody>
      <%
      ArrayList<NoticeDTO> arr = ndao.noticeList(cp,pageCnt);
      if(arr == null || arr.size() == 0){
      %>
         <tr>
            <td colspan="5" align="center">등록된 게시물이 없습니다.
         </tr>
      <%
      }else{
         for(int i=0;i<arr.size();i++){
      %>
         <tr>
            <td><%=arr.get(i).getNotice_idx() %></td>
            <td>
            <a href="noticeContent.jsp?notice_idx=<%=arr.get(i).getNotice_idx() %>"><%=arr.get(i).getNotice_title() %></a></td>
            <td><%=arr.get(i).getAdmin_id() %></td>
            <td><%=arr.get(i).getNotice_date() %></td>
            <td><%=arr.get(i).getNotice_count() %></td>
         </tr>
      <%
      }
      }
      %>
      </tbody>
      </table>
   </section>
</body>
</html>