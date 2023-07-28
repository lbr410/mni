package com.mni.notice;

import java.sql.*;
import java.util.*;

public class NoticeDAO {
	
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	
	public NoticeDAO() {
		System.out.println("NoticeDAO()생성자 호출됨");
	}
	
	/**공지사항 등록*/
	public int noticeWirte(String title, String content) {
		try {
			conn=com.mni.db.MniDB.getConn();
			String sql="insert into notice values(notice_idx.nextval,'admin',?,?,0,sysdate)";
			
			ps=conn.prepareStatement(sql);
			ps.setString(1, title);
			ps.setString(2, content);
		
			int count=ps.executeUpdate();
			return count;
		}catch(Exception e) {
			e.printStackTrace();
			return -1;
		}finally {
			try {
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			}catch(Exception e2) {}
		}
	}
	
	/**공지사항 본문 수정*/
	public int noticeUpdate(String title,String content,int idx) {
		try {
			conn=com.mni.db.MniDB.getConn();
			String sql="update notice set notice_title=?, notice_content=? where notice_idx=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, title);
			ps.setString(2, content);
			ps.setInt(3, idx);
			
			int count=ps.executeUpdate();
			return count;
			
		}catch(Exception e) {
			e.printStackTrace();
			return -1;
		}finally {
			try {
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			}catch (Exception e2) {
				
			}
		}
	}
	
	
	/**공지사항 본문 삭제*/
	public int noticeDelete(int idx) {
		try {
			conn=com.mni.db.MniDB.getConn();
			String sql="delete notice where notice_idx=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, idx);
			
			int count=ps.executeUpdate();
			return count;
			
		}catch(Exception e) {
			e.printStackTrace();
			return -1;
		}finally {
			try {
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			}catch(Exception e2) {}
		}
	}
	

	
	/**공지사항 목록 보기*/
	public ArrayList<NoticeDTO> noticeList(int cp, int ls) {
	      try {
	         conn=com.mni.db.MniDB.getConn();
	         /*String sql="select * from notice order by notice_idx desc";*/
	         int start=(cp-1)*ls+1;
				int end=cp*ls;
				String sql="select * from "
						+ "(select rownum as rnum,a.* from "
						+ "(select * from notice order by notice_idx desc) a) "
						+ "where rnum>=? and rnum<=?";
				ps=conn.prepareStatement(sql);
				ps.setInt(1, start);
				ps.setInt(2, end);
				rs=ps.executeQuery();
	         
	         ArrayList<NoticeDTO> arr=new ArrayList<NoticeDTO>();
	         while(rs.next()) {
	            int idx=rs.getInt("notice_idx");
	            String id=rs.getString("admin_id");
	            String title=rs.getString("notice_title");
	            String content=rs.getString("notice_content");
	            int count=rs.getInt("notice_count");
	            java.sql.Date noticedate=rs.getDate("notice_date");
	            
	            NoticeDTO dto=new NoticeDTO(idx, id, title, content, count, noticedate);
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
	
	
	/**공지사항 본문 보기*/
	public NoticeDTO noticeContent(int idx) {
		try {
			conn=com.mni.db.MniDB.getConn();
			String sql="select * from notice where notice_idx=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, idx);
			rs=ps.executeQuery();

			NoticeDTO dto=null;
			if(rs.next()) {
		         String id=rs.getString("admin_id");
		         String title=rs.getString("notice_title");
		         String content=rs.getString("notice_content");
		         int count=rs.getInt("notice_count");
		         java.sql.Date noticedate=rs.getDate("notice_date");	
		         dto=new NoticeDTO(idx, id, title, content, count, noticedate);
		        		 
			}
				return dto;
				
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
	
	/**사용자에 뿌릴 화면 공지사항 본문 보기*/
	public NoticeDTO userNoticeContent(int idx) {
		try {
			conn=com.mni.db.MniDB.getConn();
			String sql="select * from notice where notice_idx=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, idx);
			rs=ps.executeQuery();
			
			String sql2="update notice set notice_count=notice_count+1 where notice_idx=?";
	        ps=conn.prepareStatement(sql2);
	        ps.setInt(1, idx);
	        int count2=ps.executeUpdate();
			
			NoticeDTO dto=null;
			if(rs.next()) {
		         String id=rs.getString("admin_id");
		         String title=rs.getString("notice_title");
		         String content=rs.getString("notice_content");
		         int count=rs.getInt("notice_count");
		         java.sql.Date noticedate=rs.getDate("notice_date");	
		         dto=new NoticeDTO(idx, id, title, content, count, noticedate);
		        		 
			}
				return dto;
				
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
	
	
	/**페이징 관련 총 게시물수*/
	public int getTotal() {
		try {
			conn=com.mni.db.MniDB.getConn();
			String sql="select count(*) from notice";
			ps=conn.prepareStatement(sql);
			rs=ps.executeQuery();
			rs.next();
			int count=rs.getInt(1);
			return count==0?1:count;
			
		}catch(Exception e) {
			e.printStackTrace();
			return 1;
		}finally {
			try {
				if(rs!=null)rs.close();
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			}catch(Exception e2) {}
		}
	}
	
	
}
