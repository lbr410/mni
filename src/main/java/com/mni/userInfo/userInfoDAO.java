package com.mni.userInfo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

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
               + "values(user_idx.nextval,?,?,?,?,?,?,?,?,?,?,'n',sysdate,null)";
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
        if(dto.getUser_email() == null) {
           ps.setString(10, "x");
        }else {
           ps.setString(10, dto.getUser_email());
        }
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
   
   //사용자 정보 세션
   public userInfoDTO loginCheck(String id, String pwd){
         try {
            conn=com.mni.db.MniDB.getConn();
            String sql="select * from userinfo where user_id = ? and user_pwd = ?";
            ps=conn.prepareStatement(sql);
            ps.setString(1, id);
            ps.setString(2, pwd);
            rs=ps.executeQuery();
            userInfoDTO dto = null;      
            if(rs.next()) {
               int idx=rs.getInt("user_idx");
               String usrid=rs.getString("user_id");
               String name=rs.getString("user_name");
               String usrpwd=rs.getString("user_pwd");
               String tel=rs.getString("user_tel");
               int jumin_f=rs.getInt("user_jumin_front");
               int jumin_b=rs.getInt("user_jumin_back");
               int zip=rs.getInt("user_zip");
               String addr1=rs.getString("user_addr1");
               String addr2=rs.getString("user_addr2");
               String email=rs.getString("user_email");
               String del=rs.getString("user_delete");
               java.sql.Date joindate=rs.getDate("user_joindate");
               java.sql.Date ddate=rs.getDate("user_ddate");
            dto = new userInfoDTO(idx, usrid, name, usrpwd, tel, jumin_f, jumin_b, zip, addr1, addr2, email, del,joindate, ddate);
            
            }                  
               return dto;
            }catch(Exception e) {
               e.printStackTrace();
               return null;
            }finally {
               try {
                  if(rs!=null)rs.close();
                  if(ps != null) ps.close();
                  if(conn != null) conn.close();
               }catch(Exception e2) {}
                     }
               }
               
   //사용자 로그인? 
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

   //아이디 찾기
   public String getUserId(int juminfront, int juminback) {
      try {
         conn = com.mni.db.MniDB.getConn();
         String sql = "select user_id from userinfo "
               + "where user_jumin_front = ? and user_jumin_back = ?";
         ps = conn.prepareStatement(sql);
         ps.setInt(1, juminfront);
         ps.setInt(2, juminback);
         rs = ps.executeQuery();
         String user_id = null;
         if(rs.next()) {
            user_id = rs.getString(1);
         }
         return user_id;
      }catch(Exception e) {
         e.printStackTrace();
         return null;
      }finally {
         try {
            if(rs != null) rs.close();
            if(ps != null) ps.close();
            if(conn != null) conn.close();
         }catch(Exception e) {}
      }
   }
   
   //비밀번호 찾기
   public Boolean getUserPwd(String id, int juminfront, int juminback) {
      try {
         conn = com.mni.db.MniDB.getConn();
         String sql = "select user_pwd from userinfo "
               + "where user_id = ? and "
               + "user_jumin_front = ? and "
               + "user_jumin_back = ?";
         ps = conn.prepareStatement(sql);
         ps.setString(1, id);
         ps.setInt(2, juminfront);
         ps.setInt(3, juminback);
         rs = ps.executeQuery();
         if(rs.next()) {
            return true;
         }else {
            return false;
         }
         
      }catch(Exception e) {
         e.printStackTrace();
         return null;
      }finally {
         try {
            if(rs != null) rs.close();
            if(ps != null) ps.close();
            if(conn != null) conn.close();
         }catch(Exception e) {}
      }
   }
   
   //비밀번호 변경
   public int setUserUpdatePwd(String pwd,String id,int juminfront,int juminback) {
      try{
         conn = com.mni.db.MniDB.getConn();
         String sql = "update userinfo "
               + "set user_pwd = ? "
               + "where user_id = ? and "
               + "user_jumin_front = ? and "
               + "user_jumin_back = ?";
         ps = conn.prepareStatement(sql);
         ps.setString(1, pwd);
         ps.setString(2, id);
         ps.setInt(3, juminfront);
         ps.setInt(4, juminback);
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
   
   /**사용자 정보 수정*/
    public int setUserInfo(userInfoDTO dto) {
      try {
         conn=com.mni.db.MniDB.getConn();
         String sql="update userinfo set user_name=?, user_tel=?, "
               + "user_email=?, user_pwd=?, user_zip=?, user_addr1=?, user_addr2=? ";
         ps=conn.prepareStatement(sql);
         ps.setString(1, dto.getUser_name());
         ps.setString(2, dto.getUser_tel());
         ps.setString(3, dto.getUser_email());
         ps.setString(4, dto.getUser_pwd());
         ps.setInt(5, dto.getUser_zip());
         ps.setString(6, dto.getUser_addr1());
         ps.setString(7, dto.getUser_addr2());
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
    
    /**관리자 페이지 총 회원 수 메서드*/
   public int userCnt() {
      try {
         conn=com.mni.db.MniDB.getConn();
         String sql="select count(*) from userinfo";
         ps=conn.prepareStatement(sql);
         rs=ps.executeQuery();
         rs.next();
         int count=rs.getInt(1);
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
   
   /**관리자 페이지 검색 총 회원 수 메서드 -송준*/
   public int userSearchCnt(String user_id) {
      try {
         conn=com.mni.db.MniDB.getConn();
         String sql="select count(*) from userinfo where user_id = ?";
         ps=conn.prepareStatement(sql);
         ps.setString(1, user_id);
         rs=ps.executeQuery();
         rs.next();
         int count=rs.getInt(1);
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

/**관리자 페이지 회원목록 출력*/
   public ArrayList<userInfoDTO> userInfoSelect(int cp,int pageCnt) {
      try {
         conn=com.mni.db.MniDB.getConn();
         int start = (cp-1)*pageCnt+1;
         int end = cp*pageCnt;
         String sql="select * from "
               + "(select rownum as rnum,a.* from "
               + "(select * from userinfo order by user_idx desc) a) b "
               + "where rnum>=? and rnum<=?";
         ps=conn.prepareStatement(sql);
         ps.setInt(1, start);
         ps.setInt(2, end);
         rs=ps.executeQuery();
         ArrayList<userInfoDTO> arr=new ArrayList<userInfoDTO>();
         while(rs.next()) {
            int user_idx = rs.getInt("user_idx");
            String id = rs.getString("user_id");
            String name = rs.getString("user_name");
            String pwd = rs.getString("user_pwd");
            String tel = rs.getString("user_tel");
            int user_jumin_front = rs.getInt("user_jumin_front");
            int user_jumin_back = rs.getInt("user_jumin_back");
            int user_zip = rs.getInt("user_zip");
            String user_addr1 = rs.getString("user_addr1");
            String user_addr2 = rs.getString("user_addr2");
            String user_email = rs.getString("user_email");
            String user_delete = rs.getString("user_delete");
            java.sql.Date user_joindate = rs.getDate("user_joindate");
            java.sql.Date user_ddate = rs.getDate("user_ddate");
            userInfoDTO dto = new userInfoDTO(user_idx, id, name, pwd, tel, user_jumin_front, user_jumin_back, user_zip, user_addr1, user_addr2, user_email, user_delete, user_joindate, user_ddate);
            arr.add(dto);
         }
         return arr;
      }catch(Exception e) {
         e.printStackTrace();
         return null;
      }finally {
         try {
				if(rs != null) rs.close();
				if(ps != null) ps.close();
				if(conn != null) conn.close();
			}catch(Exception e) {}
		}
	}
	
	/**관리자 페이지 검색 회원목록 출력 -송준*/
	   public ArrayList<userInfoDTO> userInfoSearchSelect(String user_id,int cp,int pageCnt) {
	      try {
	         conn=com.mni.db.MniDB.getConn();
	         int start = (cp-1)*pageCnt+1;
	         int end = cp*pageCnt;
	         String sql="select * from "
	               + "(select rownum as rnum,a.* from "
	               + "(select * from userinfo where user_id = ? order by user_idx desc) a) b "
	               + "where rnum>=? and rnum<=?";
	         ps=conn.prepareStatement(sql);
	         ps.setString(1, user_id);
	         ps.setInt(2, start);
	         ps.setInt(3, end);
	         rs=ps.executeQuery();
	         ArrayList<userInfoDTO> arr=new ArrayList<userInfoDTO>();
	         while(rs.next()) {
	            int user_idx = rs.getInt("user_idx");
	            String user_name = rs.getString("user_name");
	            String user_pwd = rs.getString("user_pwd");
	            String user_tel = rs.getString("user_tel");
	            int user_jumin_front = rs.getInt("user_jumin_front");
	            int user_jumin_back = rs.getInt("user_jumin_back");
	            int user_zip = rs.getInt("user_zip");
	            String user_addr1 = rs.getString("user_addr1");
	            String user_addr2 = rs.getString("user_addr2");
	            String user_email = rs.getString("user_email");
	            String user_delete = rs.getString("user_delete");
	            java.sql.Date user_joindate = rs.getDate("user_joindate");
	            java.sql.Date user_ddate = rs.getDate("user_ddate");
	            userInfoDTO dto = new userInfoDTO(user_idx, user_id, user_name, user_pwd, user_tel, user_jumin_front, user_jumin_back, user_zip, user_addr1, user_addr2, user_email, user_delete, user_joindate, user_ddate);
	            arr.add(dto);
	         }
	         return arr;
	      }catch(Exception e) {
	         e.printStackTrace();
	         return null;
	      }finally {
	         try {

	            if(rs != null) rs.close();
	            if(ps != null) ps.close();
	            if(conn != null) conn.close();
	         }catch(Exception e) {}
	      }
	   }
    
   /** 결제 시 사용자 정보 출력 - BR */
   public userInfoDTO paymentUserInfo(int user_idx) {
      try {
         conn = com.mni.db.MniDB.getConn();
         
         String sql = "select * from userinfo where user_idx = ?";
         ps = conn.prepareStatement(sql);
         ps.setInt(1, user_idx);
         rs = ps.executeQuery();
         
         userInfoDTO dto = new userInfoDTO();
         rs.next();
         String user_name = rs.getString("user_name");
         String user_tel = rs.getString("user_tel");
         int user_zip = rs.getInt("user_zip");
         String user_addr1 = rs.getString("user_addr1");
         String user_addr2 = rs.getString("user_addr2");
         String user_email = rs.getString("user_email");
         
         dto.setUser_name(user_name);
         dto.setUser_email(user_email);
         dto.setUser_tel(user_tel);
         dto.setUser_zip(user_zip);
         dto.setUser_addr1(user_addr1);
         dto.setUser_addr2(user_addr2);
         
         return dto;
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
}