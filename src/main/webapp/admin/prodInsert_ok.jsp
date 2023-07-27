<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="javax.swing.DefaultBoundedRangeModel"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8"); //전송방식 때문에 인코딩 바꿈 %>
<%@ page import="com.oreilly.servlet.*"%>
<%@ page import="com.mni.product.*" %>
<jsp:useBean id="pdao" class="com.mni.product.ProductDAO"></jsp:useBean>
<%
File f1=new File(request.getRealPath("/admin/product_img"));
if(!f1.exists()){
	f1.mkdir();
}

String savepath=request.getRealPath("/admin/product_img");
int filesize=10485760;
MultipartRequest mr =
new MultipartRequest(request,savepath,filesize,"utf-8",new DefaultFileRenamePolicy());

String prod_name=mr.getParameter("prod_name");
String prod_title=mr.getParameter("prod_title");
String prod_price_s=mr.getParameter("prod_price");
String prod_count_s=mr.getParameter("prod_count");
String prod_title_img=mr.getFilesystemName("prod_title_img");
String prod_pet=mr.getParameter("prod_pet");
String prod_info_img=mr.getFilesystemName("prod_info_img");
String prod_brand_s=mr.getParameter("prod_brand");
String prod_category_s=mr.getParameter("prod_category");
int prod_price=Integer.parseInt(prod_price_s);
int prod_count=Integer.parseInt(prod_count_s);
int prod_brand=Integer.parseInt(prod_brand_s);
int prod_category=Integer.parseInt(prod_category_s);

ProductDTO pdto=new ProductDTO(prod_name,prod_title,prod_price,prod_count,prod_title_img,prod_pet,prod_info_img,prod_brand,prod_category);

int count=pdao.prodInsert(pdto);
String msg=count>0?"상품 등록 성공":"다시 시도해주세요";
%>
<script>
window.alert('<%=msg%>');
location.href='/mni/admin/productList.jsp';
</script>