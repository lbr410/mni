package com.mni.admin;

import java.sql.*;

public class AdminDAO {

	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	
	public AdminDAO() {
		
	}
	/**관리자 로그인 메서드*/
	public boolean adminLogin(String admin_id,String admin_pwd) {
		try {
			conn=com.mni.db.MniDB.getConn();
			String sql="select * from adminis where admin_id=? and admin_pwd=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, admin_id);
			ps.setString(2, admin_pwd);
			rs=ps.executeQuery();
			return rs.next();
		}catch(Exception e) {
			e.printStackTrace();
			return false;
		}finally {
			try {
				if(rs!=null)rs.close();
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			}catch(Exception e2) {}
		}
	}
}
