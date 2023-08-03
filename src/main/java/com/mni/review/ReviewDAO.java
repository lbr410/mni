package com.mni.review;

import java.sql.*;
import java.util.*;
import com.mni.ord.*;
import com.oreilly.servlet.MultipartRequest;

public class ReviewDAO {
   private Connection conn;
   private PreparedStatement ps;
   private ResultSet rs;
   
   public ReviewDAO() {
      System.out.println("ReviewDAO() 생성자 호출");
   }
   
   /** 리뷰 보기 - BR */
   public ArrayList<ReviewDTO> reviewList(int prod_idx) {
      try {
         conn = com.mni.db.MniDB.getConn();
         
         String sql = "select user_id, review_date, review_content, review_img from userinfo, review "
               + "where userinfo.user_idx = review.user_idx "
               + "and prod_idx = ? order by review_date desc";
         
         ps = conn.prepareStatement(sql);
         ps.setInt(1, prod_idx);
         rs = ps.executeQuery();
         
         ArrayList<ReviewDTO> table = new ArrayList<ReviewDTO>();
         if(rs.next()) {
            do {
               String user_id = rs.getString("user_id");
               java.sql.Date review_date = rs.getDate("review_date");
               String review_content = rs.getString("review_content");
               String review_img = rs.getString("review_img");
               
               ReviewDTO dto = new ReviewDTO();
               dto.setUser_id(user_id);
               dto.setReview_date(review_date);
               dto.setReview_content(review_content);
               dto.setReview_img(review_img);
               
               table.add(dto);
            } while(rs.next());
         }
         return table;
      } catch(Exception e) {
         e.printStackTrace();
         return null;
      } finally {
         try {
            if(rs!=null) rs.close();
            if(ps!=null) ps.close();
            if(conn!=null) conn.close();
         } catch(Exception e) {}
      }
   }
   
   /** 총 리뷰수 - BR */
   public int reviewCnt(int prod_idx) {
      try {
         conn = com.mni.db.MniDB.getConn();
         
         String sql = "select count(*) from (select user_id, review_content, review_img, review_date from userinfo, review "
               + "where userinfo.user_idx = review.user_idx "
               + "and prod_idx = ?)";
         
         ps = conn.prepareStatement(sql);
         rs = ps.executeQuery();
         
         rs.next();
         int count = rs.getInt(1);
         
         return count==0 ? 1 : count;
      } catch(Exception e) {
         e.printStackTrace();
         return 1;
      } finally {
         try {
            if(rs!=null) rs.close();
            if(ps!=null) ps.close();
            if(conn!=null) conn.close();
         } catch(Exception e) {}
      }
   }
   
   /** 리뷰 작성 - BR */
   public int reviewWrite(MultipartRequest mr) {
      try {
         conn = com.mni.db.MniDB.getConn();
          
         String sql = "insert into review values(review_idx.nextval, ?, ?, ?, ?, ?, sysdate)";
         ps = conn.prepareStatement(sql);
         
         ps.setInt(1, Integer.parseInt(mr.getParameter("prod_idx")));
         ps.setInt(2, Integer.parseInt(mr.getParameter("order_idx")));
         ps.setInt(3, Integer.parseInt(mr.getParameter("user_idx")));
         ps.setString(4, mr.getParameter("review_content"));
         if(mr.getFilesystemName("review_img")!=null) {
        	 ps.setString(5, mr.getFilesystemName("review_img"));
         } else {
        	 ps.setString(5, "-");
         }
         int count = ps.executeUpdate();
         
         return count;
      } catch(Exception e) {
         e.printStackTrace();
         return -1;
      } finally {
         try {
            if(ps!=null) ps.close();
            if(conn!=null) conn.close();
         } catch(Exception e) {}
      }
   }
   /**관리자 리뷰 검색 메서드 -송준*/
   public ArrayList<ReviewDTO> reviewSearch(String prod_name,int cp,int pageCnt){
	   try {
		   conn=com.mni.db.MniDB.getConn();
		   int start = (cp-1)*pageCnt+1;
			int end = cp*pageCnt;
		   String sql = "select * from "
		   		+ "(select rownum as rnum,a.* from "
		   		+ "(select u.user_id,r.review_idx,p.prod_idx,p.prod_name,r.review_content,r.review_date from review r,product p,userinfo u where r.prod_idx = p.prod_idx and u.user_idx = r.user_idx and p.prod_name = ? order by review_idx desc) a) b "
		   		+ "where rnum>=? and rnum<=?";
		   ps=conn.prepareStatement(sql);
		   ps.setString(1, prod_name);
		   ps.setInt(2, start);
			ps.setInt(3, end);
		   rs=ps.executeQuery();
		   ArrayList<ReviewDTO> arr = new ArrayList<ReviewDTO>();
		   while(rs.next()) {
			   int review_idx = rs.getInt("review_idx");
			   int prod_idx = rs.getInt("prod_idx");
			   String user_id = rs.getString("user_id");
			   String review_content = rs.getString("review_content");
			   java.sql.Date review_date = rs.getDate("review_date");
			   ReviewDTO dto = new ReviewDTO();
			   dto.setReview_idx(review_idx);
			   dto.setProd_idx(prod_idx);
			   dto.setUser_id(user_id);
			   dto.setProd_name(prod_name);
			   dto.setReview_content(review_content);
			   dto.setReview_date(review_date);
			   arr.add(dto);
		   }
		   return arr;
	   }catch(Exception e) {
		   e.printStackTrace();
		   return null;
	   }finally {
		try {
			if(rs!=null)rs.close();
			if(ps!=null)ps.close();
			if(conn!=null)conn.close();
		}catch(Exception e2) {}
	}
   }
   /**관리자 리뷰 출력 메서드 -송준*/
   public ArrayList<ReviewDTO> getReview(int cp,int pageCnt){
	   try {
		   conn = com.mni.db.MniDB.getConn();
		   int start = (cp-1)*pageCnt+1;
			int end = cp*pageCnt;
		   String sql = "select * from "
		   		+ "(select rownum as rnum,a.* from "
		   		+ "(select u.user_id,r.review_idx,p.prod_idx,p.prod_name,r.review_content,r.review_date from review r,product p,userinfo u where r.prod_idx = p.prod_idx and u.user_idx = r.user_idx order by review_idx desc) a) b "
		   		+ "where rnum>=? and rnum<=?";
		   ps=conn.prepareStatement(sql);
		   ps.setInt(1, start);
			ps.setInt(2, end);
		   rs=ps.executeQuery();
		   ArrayList<ReviewDTO> arr = new ArrayList<ReviewDTO>();
		   while(rs.next()) {
			   int review_idx = rs.getInt("review_idx");
			   int prod_idx = rs.getInt("prod_idx");
			   String prod_name = rs.getString("prod_name");
			   String user_id = rs.getString("user_id");
			   String review_content = rs.getString("review_content");
			   java.sql.Date review_date = rs.getDate("review_date");
			   ReviewDTO dto = new ReviewDTO();
			   dto.setReview_idx(review_idx);
			   dto.setProd_idx(prod_idx);
			   dto.setProd_name(prod_name);
			   dto.setUser_id(user_id);
			   dto.setReview_content(review_content);
			   dto.setReview_date(review_date);
			   arr.add(dto);
		   }
		   return arr;
	   }catch(Exception e) {
		   e.printStackTrace();
		   return null;
	   }finally {
		try {
			if(rs!=null)rs.close();
			if(ps!=null)ps.close();
			if(conn!=null)conn.close();
		}catch(Exception e2) {}
	}
   }
   /**관리자 리뷰 총 개수 메서드*/
   public int adminReviewCnt() {
	   try {
		   conn = com.mni.db.MniDB.getConn();
		   String sql = "select count(*) from review";
		   ps = conn.prepareStatement(sql);
		   rs = ps.executeQuery();
		   rs.next();
		   int count = rs.getInt(1);
		   return count;
	   }catch(Exception e) {
		   e.printStackTrace();
		   return 0;
	   }finally {
		try {
			if(rs!=null)rs.close();
			if(ps!=null)ps.close();
			if(conn!=null)conn.close();
		}catch(Exception e2) {}
	}
   }
   /**관리자 리뷰 검색 개수 메서드*/
   public int reviewSearchCnt(String prod_name) {
	   try {
		   conn = com.mni.db.MniDB.getConn();
		   String sql = "select count(*) from review r,product p where r.prod_idx = p.prod_idx and p.prod_name = ?";
		   ps = conn.prepareStatement(sql);
		   ps.setString(1, prod_name);
		   rs = ps.executeQuery();
		   rs.next();
		   int count = rs.getInt(1);
		   return count;
	   }catch(Exception e) {
		   e.printStackTrace();
		   return 0;
	   }finally {
		try {
			if(rs!=null)rs.close();
			if(ps!=null)ps.close();
			if(conn!=null)conn.close();
		}catch(Exception e2) {}
	}
   }
   /**관리자 리뷰 삭제 */
   public int adminReviewDelete(int review_idx) {
	   try {
		   conn = com.mni.db.MniDB.getConn();
		   String sql = "delete from review where review_idx = ?";
		   ps=conn.prepareStatement(sql);
		   ps.setInt(1, review_idx);
		   int count = ps.executeUpdate();
		   return count;
	   }catch(Exception e) {
		   e.printStackTrace();
		   return 0;
	   }finally {
		try {
			if(ps!=null)ps.close();
			if(conn!=null)conn.close();
		}catch(Exception e2) {}
	}
   }
   
   /** 해당 상품에 대한 리뷰 더 보기 - BR */
   public ArrayList<ReviewDTO> prodReviewMore(int prod_idx, int cp, int pageCnt) {
	   try {
		   conn = com.mni.db.MniDB.getConn();
		   
		   String sql = "select * from "
		   		+ "(select rownum as rnum, a.* from "
		   		+ "(select u.user_id, r.review_idx, r.review_content, r.review_img, r.review_date from review r, userinfo u where u.user_idx = r.user_idx and r.prod_idx = ? order by review_idx desc) a) b "
		   		+ "where rnum >= ? and rnum <= ?";
		   int start = (cp-1)*pageCnt+1;
		   int end = cp*pageCnt;
		   ps = conn.prepareStatement(sql);
		   ps.setInt(1, prod_idx);
		   ps.setInt(2, start);
		   ps.setInt(3, end);
		   rs = ps.executeQuery();
		   
		   ArrayList<ReviewDTO> table = new ArrayList<ReviewDTO>();
		   while(rs.next()) {
			   int review_idx = rs.getInt("review_idx");
			   String user_id = rs.getString("user_id");
			   String review_content = rs.getString("review_content");
			   java.sql.Date review_date = rs.getDate("review_date");
			   String review_img = rs.getString("review_img");
			   ReviewDTO dto = new ReviewDTO();
			   dto.setReview_idx(review_idx);
			   dto.setUser_id(user_id);
			   dto.setReview_content(review_content);
			   dto.setReview_date(review_date);
			   dto.setReview_img(review_img);
			   table.add(dto);
		   }
		   return table;
	   } catch(Exception e) {
		   e.printStackTrace();
		   return null;
	   } finally {
		   try {
			   if(rs!=null) rs.close();
			   if(ps!=null) ps.close();
			   if(conn!=null) conn.close();
		   } catch(Exception e) {}
	   }
   }
   
   /** 해당 상품에 대한 전체 리뷰 개수(리뷰 더 보기) - BR */
   public int prodReviewCnt(int prod_idx) {
	      try {
	         conn = com.mni.db.MniDB.getConn();
	         
	         String sql = "select count(*) from review where prod_idx = ?";
	         
	         ps = conn.prepareStatement(sql);
	         ps.setInt(1, prod_idx);
	         rs = ps.executeQuery();
	         
	         rs.next();
	         int count = rs.getInt(1);
	         
	         return count==0 ? 1 : count;
	      } catch(Exception e) {
	         e.printStackTrace();
	         return 1;
	      } finally {
	         try {
	            if(rs!=null) rs.close();
	            if(ps!=null) ps.close();
	            if(conn!=null) conn.close();
	         } catch(Exception e) {}
	      }
	   }
   
   /*사용자 주문내역 리뷰 작성시 버튼안보이게 하는 조건 메서드 SM*/
   public Boolean prodReview(ArrayList<OrdDTO> arr, int index, int idx) {
	   try {
		   conn = com.mni.db.MniDB.getConn();
		   String sql = "select * from review "
		   		+ "where user_idx = ? and prod_idx = ? and order_idx = ?";
		   ps = conn.prepareStatement(sql);
		   ps.setInt(1, idx);
		   System.out.println(idx);
		   ps.setInt(2, arr.get(index).getProd_idx());
		   System.out.println(arr.get(index).getProd_idx());
		   ps.setInt(3, arr.get(index).getOrder_idx());
		   System.out.println(arr.get(index).getOrder_idx());
		   rs = ps.executeQuery();
		   System.out.println(rs.next());
		   return rs.next();
	   }catch(Exception e) {
		   e.printStackTrace();
		   return false;
	   }finally {
		   try {
			   if(rs != null) rs.close();
			   if(ps != null) ps.close();
			   if(conn != null) conn.close();
		   }catch(Exception e) {}
	   }
   }
}