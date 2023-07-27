package com.mni.userInfo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class loginDAO {

		private Connection conn;
		private PreparedStatement ps;
		private ResultSet rs;
		
		final public static int NOT_ID=1;  //아이디가 틀렸을 때
		final public static int NOT_PWD=2;  //비밀번호가 틀렸을 때
		public static final int LOGIN_OK=3;  //로그인이 괜찮을 때
		public static final int ERROR=-1;  //에러.
		
		public loginDAO() {
			
		}
		
		/*사용자 정보 추출*/

		public int loginCheck(String id, String user_pwd){
				try {
					conn=com.mni.db.MniDB.getConn();
					String sql="select user_pwd from userinfo where user_id=?";
					ps=conn.prepareStatement(sql);
					ps.setString(1, id);
					rs=ps.executeQuery();
					if(rs.next()) {
						String pwd=rs.getString(1);
						if(pwd.equals(user_pwd)) {
							return LOGIN_OK;
						}else {
							return NOT_PWD;
						}
					}else {
						return NOT_ID;
					}
					
				}catch(Exception e) {
					e.printStackTrace();
					return ERROR;
				}finally {
					try {
						if(rs!=null)rs.close();
						if(ps != null) ps.close();
						if(conn != null) conn.close();
					}catch(Exception e2) {}
				}
		}
		public String getUserInfo(String user_id) {
			try {
				conn=com.mni.db.MniDB.getConn();
				String sql="select user_name from userinfo where user_id=?";
				ps=conn.prepareStatement(sql);
				ps.setString(1, user_id);
				rs=ps.executeQuery();
				rs.next();
				return rs.getString(1);
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

	}


