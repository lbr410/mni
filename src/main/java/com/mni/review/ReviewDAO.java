package com.mni.review;

import java.sql.*;
import java.util.*;

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
	
	/** 리뷰 작성 - 작성중 */
//	public int reviewWrite(int prod_idx, int user_idx) {
//		try {
//			conn = com.mni.db.MniDB.getConn();
//			
//			// insert into review values(review_idx.nextval, 135, 41, '저희 뭉이가 좋아해요 ㅎㅎㅎㅎ', '9.jpg', sysdate) 
//			String sql = "insert into review values(review_idx.nextval, ?, ?, ?, ?, sysdate";
//			ps = conn.prepareStatement(sql);
//			ps.setInt(1, prod_idx);
//			ps.setInt(2, user_idx);
//		} catch(Exception e) {
//			
//		} finally {
//			try {
//				
//			} catch(Exception e) {}
//		}
//	}
}