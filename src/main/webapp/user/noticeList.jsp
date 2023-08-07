<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<%@page import="com.mni.notice.*" %>
<jsp:useBean id="ndao" class="com.mni.notice.NoticeDAO"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>

<style>
.page{   
    width: 22px;
    height: 22px;
    font-size: 12px;
    color: black;
    border: 0;
    background-color: white;
    border: 1px #ff7f50 solid;
    border-radius: 5px;
    cursor: pointer; 
   
}
.nowPage{
    width: 22px;
    height: 22px;
    background-color:#ff7f50;
    color:white;
    border: 0;
    outline: none;
    border-radius: 5px;
}
body{
   width: 1000px;
   margin: 0px auto;
   height: 100%;
}
h1{
   margin: 0 auto;
   padding-bottom:20px;
   padding-top:20px;
   text-align: center;
}
.misord{
   width:920px;
   text-align:right;
   margin: 0px auto;
   display: inline-block;
}
table{
   width:1150px;
   padding-top: 10px;
   border-spacing:0px;
}
th{
   font-size: 14px;
   border-top: 3px double #ff7f50;
   border-bottom: 3px double #ff7f50;
   padding-top: 6px;
   padding-bottom: 6px;

}
tfoot{
   height:50px;
}
tfoot td{
	border: none;
}
td{
   text-align: center;
   font-size: 12.8px;
   padding-top: 9px;
   padding-bottom: 9px;
   padding-left :6px;
   padding-right: 6px;
   border-bottom: 1px solid #cccccc;
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
<h1>공지사항</h1>
<section>
      <table>
      <thead>
         <tr>
            <th>NO.</th>
            <th>제목</th>
            <th>작성자</th>
            <th>등록일</th>
            <th>조회수</th>
         </tr>
      </thead>
      <tfoot>
         <tr>
            <td colspan="5" align="center">
         <%
         if(userGroup != 0){
            %><a href="notice.jsp?cp=<%=userGroup*pageButton%>">&lt;&lt;</a><%
         }
         for(int i = userGroup*pageButton+1; i<=(userGroup+1)*pageButton; i++){
            String button = i == cp ? "nowPage":"page";
            %>&nbsp;&nbsp;<button class="<%=button %>" onclick="javascript:location.href='/mni/user/noticeList.jsp?cp=<%=i%>'"><%=i %></button>&nbsp;&nbsp;<%
            if(i == totalPage){
               break;
            }
         }
         if(userGroup != (totalPage/pageButton-(totalPage%pageButton==0?1:0))){
            %><a href="notice.jsp?cp=<%=(userGroup+1)*pageButton+1%>">&gt;&gt;</a><%
         }
         %>
         </td>
         </tr>
      </tfoot>
      <tbody>
            <%
            ArrayList<NoticeDTO> arr=ndao.noticeList(cp,pageCnt);
            if(arr==null || arr.size()==0){
               %>
               <tr>
                  <td colspan="6">등록된 공지사항이 없습니다.</td>
               </tr>
               <%
            }else{
               for(int i=0;i<arr.size();i++){
                  NoticeDTO dto=arr.get(i);
                  %>
                  <tr>
                     <td><%=dto.getNotice_idx() %></td>
                     <td><a href="/mni/user/noticeContent.jsp?userNotice_idx=<%=arr.get(i).getNotice_idx()%>"><%=dto.getNotice_title() %></a></td>
                     <td><%=dto.getAdmin_id() %></td>
                     <td><%=dto.getNotice_date() %></td>
                     <td><%=dto.getNotice_count() %></td>
                  </tr>
                  <%
               }
            }
            %>
      </tbody>
      </table>
   </section>
<%@include file="/footer.jsp" %>
</body>
</html>