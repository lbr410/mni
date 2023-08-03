<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<%@page import="com.mni.brand.*" %>
<jsp:useBean id="bdao" class="com.mni.brand.BrandDAO"></jsp:useBean>
<%
String num_s=request.getParameter("brandNum");
if(num_s==null || num_s.equals("")){

	num_s="0";
	%>
	<script>
	window.alert('잘못된 접근입니다.');
	location.href='/mni/brand.jsp';
	</script>
	<%


int num=Integer.parseInt(num_s);

String brandName="";
String brandLogo="";
String brandBanner="";
switch(num){
case 100: brandName="오리젠"; brandLogo="/mni/img/orijen.jpg"; brandBanner="/mni/img/origen_banner.jpg"; break;
case 200: brandName="아카나"; brandLogo="/mni/img/acana.jpg"; brandBanner="/mni/img/acana_banner.jpg"; break;
case 300: brandName="로얄캐닌"; brandLogo="/mni/img/royalcanin.JPG"; brandBanner="/mni/img/royalcanin_banner.jpg"; break;
case 400: brandName="아투"; brandLogo="/mni/img/aatu.JPG"; brandBanner="/mni/img/aatu_banner.jpg"; break;
default : %><script> window.alert='잘못된..경로 입니다.'; location.href='brand_01_01.jsp';</script><%
}

%>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오리젠</title>
<link rel="stylesheet" type="text/css" href="/mni/css/brand_01_01.css">
</head>
<%
int totalCnt = bdao.getTotal(num);
int pageCnt = 9;
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

int proTotal=0;
if(totalCnt!=-1){
	proTotal=totalCnt;
}
%>
<body>
<%@ include file="header.jsp" %>
	<div class="bar">홈 > 브랜드 > <%=brandName %></div>
	<div class="top">
		<div class="brandlogo">
			<img class="brandlogo" src="<%=brandLogo %>" alt="logo">
		</div>
	</div>
    <div class="banner">
        <img class="imgslide" src="<%=brandBanner %>" alt="banner">
   	</div>
   	<div class="menu">
	<div class="category">
		<div class="list1"><a href="#">카테고리</a></div>
		<div class="list2"><a href="#">전체</a></div>
		<div class="list2"><a href="#">사료</a></div>
	</div>
	</div>
 	 <div class="head-title">전체
 	 <hr>
 	 </div>
   <div class="prodNum"><%=proTotal %>개의 상품</div>	
<div class="prodSection">

	<table>
		<tfoot>
			<tr>
            <td colspan="6" align="center">
         <%
         if(userGroup != 0){
            %><a href="brand_01_01.jsp?cp=<%=userGroup*pageButton%>">&lt;&lt;</a><%
         }
         for(int i = userGroup*pageButton+1; i<=(userGroup+1)*pageButton; i++){
            String button = i == cp ? "nowPage":"page";
            %>&nbsp;&nbsp;<button class="<%=button %>" onclick="javascript:location.href='brand_01_01.jsp?cp=<%=i%>&brandNum=<%=num %>'"><%=i %></button>&nbsp;&nbsp;<%
            if(i == totalPage){
               break;
            }
         }
         if(userGroup != (totalPage/pageButton-(totalPage%pageButton==0?1:0))){
            %><a href="brand_01_01.jsp?cp=<%=(userGroup+1)*pageButton+1%>">&gt;&gt;</a><%
         }
         %>
         </td>
         </tr>
		</tfoot>
		<tbody>
				<%
				ArrayList<BrandDTO> arr=bdao.brandNum(num,cp,pageCnt);
				if(arr==null || arr.size()==0){
					%>
					<tr>
						<td colspan="3">등록된 상품이 없습니다.</td>
					</tr>
					<%
				}else{
					%><tr><%
					for(int i=0;i<arr.size();i++){
						%>
							<td>
								<div class="brand-list-item">
	           						<div class="prodImg">
	               					 <a href="#"><img src="/mni/img/<%=arr.get(i).getProd_title_img() %>" alt="brand image" name="brand"></a>
	           						</div>
	               					<div class="description-section">
	               		 				<div class="prodName" id="title"><%=arr.get(i).getProd_name() %></div>
				           				<div class="prodTitle"><%=arr.get(i).getProd_title() %></div>
				             	    	<div class="prodPrice"><%=arr.get(i).getProd_price() %>원</div>
	          	 					</div>
	      		  				</div>		
							</td>	
						<%
						if(i%3==2 && i!=arr.size()){
							%></tr><tr><%	
							}					
					}
					%></tr><%
				}
}
				%>
		</tbody>
	</table>
</div>

<%@ include file="footer.jsp" %>
</body>
</html>