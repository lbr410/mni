<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="javax.swing.DefaultBoundedRangeModel"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%@ page import="com.oreilly.servlet.*" %>
<%@ page import="com.mni.product.*"%>
<jsp:useBean id="pdao" class="com.mni.product.ProductDAO"></jsp:useBean>
<%
File f1 = new File(request.getRealPath("/admin/product_img"));
if(!f1.exists()){
   f1.mkdir();
}

String savepath = request.getRealPath("/admin/product_img");
int filesize = 10485760;
MultipartRequest mr = new MultipartRequest(request,savepath,filesize,"utf-8",new DefaultFileRenamePolicy());

String prod_idx_s = mr.getParameter("prod_idx");
String prod_name = mr.getParameter("prod_name");
String prod_pet = mr.getParameter("prod_pet");
String prod_category_s = mr.getParameter("prod_category");
String prod_brand_s = mr.getParameter("prod_brand");
String prod_price_s = mr.getParameter("prod_price");
String prod_count_s = mr.getParameter("prod_count");
String prod_title = mr.getParameter("prod_title");
String prod_title_img = mr.getFilesystemName("prod_title_img");
String prod_info_img = mr.getFilesystemName("prod_info_img");

int prod_idx = Integer.parseInt(prod_idx_s);
int prod_category = Integer.parseInt(prod_category_s);
int prod_brand = Integer.parseInt(prod_brand_s);
int prod_price = Integer.parseInt(prod_price_s);
int prod_count = Integer.parseInt(prod_count_s);

ProductDTO dto = new ProductDTO(prod_name,prod_title,prod_price,prod_count,prod_title_img,prod_pet,prod_info_img,prod_brand,prod_category);
int count = pdao.prodUpdate(prod_idx,dto);
String msg = count>0?"수정 완료":"수정 실패";
%>
<script>
window.alert('<%=msg%>');
location.href='/mni/admin/productList.jsp';
</script>