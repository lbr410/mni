package com.mni.userInfo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class userInfoDAO {
	
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	
	public userInfoDAO() {
		System.out.println("userInfo()생성자 호출됨.");
	}
	
	//아이디 중복검사
	public Boolean userIdCheck(String user_id) {
		try {
			conn = com.mni.db.MniDB.getConn();
			String sql = "select user_id from userinfo "
					+ "where user_id = ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, user_id);
			rs = ps.executeQuery();
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
	
	//회원가입
	public int userjoin(userInfoDTO dto) {
		try {
			conn = com.mni.db.MniDB.getConn();
			String sql = "insert into userinfo "
					+ "values(userinfo_idx.nextval,?,?,?,?,?,?,?,?,?,?)";
			ps = conn.prepareStatement(sql);
			ps.setString(1, dto.getUser_id());
			ps.setString(2, dto.getUser_name());
			ps.setString(3, dto.getUser_pwd());
			ps.setString(4, dto.getUser_tel());
			ps.setInt(5, dto.getUser_jumin_front());
			ps.setInt(6, dto.getUser_jumin_back());
			ps.setInt(7, dto.getUser_zip());
			ps.setString(8, dto.getUser_addr1());
			ps.setString(9, dto.getUser_addr2());
			ps.setString(10, dto.getUser_email());
			int count = ps.executeUpdate();
			return count;
		}catch(Exception e) {
			e.printStackTrace();
			return -1;
		}finally {
			try {
				if(ps != null) ps.close();
				if(conn != null) conn.close();
			}catch(Exception e) {}
		}
	}
}
