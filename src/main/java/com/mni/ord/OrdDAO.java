package com.mni.ord;

import java.sql.*;
import com.mni.cart.*;
import java.util.*;

public class OrdDAO {
   private Connection conn;
   private PreparedStatement ps;
   private ResultSet rs;
   
   /** 상품 주문 - BR*/
    public int buyProduct(int sidx, OrdDTO dto, int count, int price, int prod_idx) {
       try {
          conn = com.mni.db.MniDB.getConn();
   
          String sql = "insert into ord values(order_idx.nextval,?,?,?,?,?,?,?,?,sysdate,'주문완료',?,?)";
          ps = conn.prepareStatement(sql);
          ps.setInt(1, sidx);
          ps.setInt(2, prod_idx);
          ps.setString(3, dto.getOrder_recie());
          ps.setInt(4, dto.getOrder_zip());
          ps.setString(5, dto.getOrder_addr1());
          ps.setString(6, dto.getOrder_addr2());
          ps.setString(7, dto.getOrder_type());
          ps.setString(8, dto.getOrder_req());
          if(dto.getOrder_req() == null) {
             ps.setString(8, "배송 전에 연락주세요.");
          } else {
              ps.setString(8, dto.getOrder_req());
          }
           ps.setInt(9, count);
           ps.setInt(10, price);
          
          int result = 0;
          if(ps.executeUpdate() == 1 ? true : false) {
             ps.close();
             CartDAO cdao = new CartDAO();
             result = cdao.userCartDelete(sidx);
          }
          
          return result;
       } catch(Exception e) {
            e.printStackTrace();
            return -1;
       } finally {
            try {
               if(conn!=null) conn.close();
            } catch(Exception e) {}
         }
      }
    
    /**관리자 주문 내역 출력 메서드*/
    public ArrayList<OrdDTO> prodSelect(){
       try {
          conn=com.mni.db.MniDB.getConn();
          String sql="select u.user_idx,u.user_name,u.user_id,p.prod_title,p.prod_idx,order_idx,order_date,order_type,order_zip,order_addr1,order_addr2,order_state,order_recie,order_req,order_count,order_price "
                + "from userinfo u,ord o,product p where u.user_idx = o.user_idx and p.prod_idx = o.prod_idx order by order_date desc";
          ps=conn.prepareStatement(sql);
          rs=ps.executeQuery();
          ArrayList<OrdDTO> arr = new ArrayList<OrdDTO>();
          while(rs.next()) {
             int order_idx = rs.getInt("order_idx");
             java.sql.Date order_date = rs.getDate("order_date");
             String user_id = rs.getString("user_id");
             String user_name = rs.getString("user_name");
             String prod_title = rs.getString("prod_title");
             int order_count = rs.getInt("order_count");
             String order_state = rs.getString("order_state");
             String order_type = rs.getString("order_type");
             int order_price = rs.getInt("order_price");
             int order_zip = rs.getInt("order_zip");
             String order_addr1 = rs.getString("order_addr1");
             String order_addr2 = rs.getString("order_addr2");
             String order_recie = rs.getString("order_recie");
             String order_req = rs.getString("order_req");
             OrdDTO dto = new OrdDTO();
             dto.setOrder_idx(order_idx);
             dto.setOrder_date(order_date);
             dto.setUser_id(user_id);
             dto.setUser_name(user_name);
             dto.setProd_title(prod_title);
             dto.setOrder_count(order_count);
             dto.setOrder_state(order_state);
             dto.setOrder_type(order_type);
             dto.setOrder_price(order_price);
             dto.setOrder_zip(order_zip);
             dto.setOrder_addr1(order_addr1);
             dto.setOrder_addr2(order_addr2);
             dto.setOrder_recie(order_recie);
             dto.setOrder_req(order_req);
             
             arr.add(dto);
          }return arr;
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
    /**관리자 총 주문개수 메서드*/
    public int getProductCnt() {
       try {
          conn=com.mni.db.MniDB.getConn();
          String sql = "select count(*) from ord";
          ps=conn.prepareStatement(sql);
          rs=ps.executeQuery();
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
    
    /**관리자 검색 결과 총 주문 개수 메서드 -송준*/
    public int getSearchCnt(String user_id) {
       try {
          conn=com.mni.db.MniDB.getConn();
          String sql = "select count(*) from ord o,userinfo u where user_id = ? and u.user_idx = o.user_idx order by o.order_date";
          ps=conn.prepareStatement(sql);
          ps.setString(1, user_id);
          rs=ps.executeQuery();
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
    
    /**관리자 주문 내역 승인 메서드*/
    public int orderSign(int order_idx) {
       try {
          conn=com.mni.db.MniDB.getConn();
          String sql = "update ord set order_state = '상품준비중' where order_idx = ?";
          ps=conn.prepareStatement(sql);
          ps.setInt(1, order_idx);
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
    /**관리자 주문 내역 거절 메서드*/
    public int orderDeclined(int order_idx) {
       try {
          conn=com.mni.db.MniDB.getConn();
          String sql = "update ord set order_state = '승인거절' where order_idx = ?";
          ps=conn.prepareStatement(sql);
          ps.setInt(1, order_idx);
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
    /**사용자 주문내역 출력 메서드*/
    public ArrayList<OrdDTO> UserOrderSelect(int idx){
        try {
           conn = com.mni.db.MniDB.getConn();
           String sql = "select order_date, prod_title_img, p.prod_idx, prod_name,o.order_idx,order_type,(order_price*order_count) as order_total_price,order_state "
                   + "from ord o ,product p "
                   + "where o.user_idx = ? and o.prod_idx = p.prod_idx order by order_date";

           ps = conn.prepareStatement(sql);
           ps.setInt(1, idx);
           rs = ps.executeQuery();
           ArrayList<OrdDTO> arr = new ArrayList<OrdDTO>();
           while(rs.next()) {
              java.sql.Date order_date = rs.getDate("order_date");
              String prod_title_img = rs.getString("prod_title_img");
              String prod_name = rs.getString("prod_name");
              int order_idx = rs.getInt("order_idx");
              String order_type = rs.getString("order_type");
              String order_state = rs.getString("order_state");
              int prod_idx = rs.getInt("prod_idx");
              int order_total_price = rs.getInt("order_total_price");
              OrdDTO dto = new OrdDTO(order_idx, order_type, order_date, prod_title_img, prod_name, order_state, prod_idx, order_total_price);
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
  
    /**관리자 페이지 매출 메서드*/
    public int adminSales(String startDate,String endDate) {
       try {
          conn=com.mni.db.MniDB.getConn();
          String sql="select sum(order_price) from ord where to_char(order_date,'YYYY-MM-DD')>=? and to_char(order_date,'YYYY-MM-DD')<=? and order_state = '배송완료'";
          ps=conn.prepareStatement(sql);
          ps.setString(1, startDate);
          ps.setString(2, endDate);
          rs=ps.executeQuery();
          rs.next();
          int price = rs.getInt(1);
          return price;
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
    
    /**관리자 주문 내역 검색 메서드-송준*/
    public ArrayList<OrdDTO> ordSearch(String user_id,int cp,int pageCnt){
       try {
          conn=com.mni.db.MniDB.getConn();
          int start = (cp-1)*pageCnt+1;
          int end = cp*pageCnt;
          String sql = "select * from "
                + "(select rownum as rnum,a.* from (select u.user_idx,u.user_name,u.user_id,p.prod_title,p.prod_idx,order_idx,order_date,order_type,order_zip,order_addr1,order_addr2,order_state,order_recie,order_req,order_count,order_price "
                + "from userinfo u,product p,ord o where u.user_idx = o.user_idx and p.prod_idx = o.prod_idx and u.user_id like '%'||?||'%' order by order_date desc) a) b "
                + "where rnum>=? and rnum<=?";
          ps=conn.prepareStatement(sql);
          ps.setString(1, user_id);
          ps.setInt(2, start);
          ps.setInt(3, end);
          rs=ps.executeQuery();
          ArrayList<OrdDTO> arr = new ArrayList<OrdDTO>();
          while(rs.next()) {
             int order_idx = rs.getInt("order_idx");
                 java.sql.Date order_date = rs.getDate("order_date");
                 String user_name = rs.getString("user_name");
                 String prod_title = rs.getString("prod_title");
                 int order_count = rs.getInt("order_count");
                 String order_state = rs.getString("order_state");
                 String order_type = rs.getString("order_type");
                 int order_price = rs.getInt("order_price");
                 int order_zip = rs.getInt("order_zip");
                 String order_addr1 = rs.getString("order_addr1");
                 String order_addr2 = rs.getString("order_addr2");
                 String order_recie = rs.getString("order_recie");
                 String order_req = rs.getString("order_req");
                 OrdDTO dto = new OrdDTO();
                 dto.setOrder_idx(order_idx);
                 dto.setOrder_date(order_date);
                 dto.setUser_id(user_id);
                 dto.setUser_name(user_name);
                 dto.setProd_title(prod_title);
                 dto.setOrder_count(order_count);
                 dto.setOrder_state(order_state);
                 dto.setOrder_type(order_type);
                 dto.setOrder_price(order_price);
                 dto.setOrder_zip(order_zip);
                 dto.setOrder_addr1(order_addr1);
                 dto.setOrder_addr2(order_addr2);
                 dto.setOrder_recie(order_recie);
                 dto.setOrder_req(order_req);
                 
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
   
      /*사용자 주문내역에서 주문취소*/
      public int userOrderCancel(int order_idx) {
         try {
            conn = com.mni.db.MniDB.getConn();
            String sql = "update ord set order_state = '주문취소' "
                  + "where order_idx = ?";
            ps = conn.prepareStatement(sql);
            ps.setInt(1, order_idx);
            int result = ps.executeUpdate();
            return result;
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
      
      /*사용자 주문내역에서 수취확인*/
      public int userReceiptConfirmation(int order_idx) {
         try {
            conn = com.mni.db.MniDB.getConn();
            String sql = "update ord set order_state = '배송완료' "
                  + "where order_idx = ?";
            ps = conn.prepareStatement(sql);
            ps.setInt(1, order_idx);
            int result = ps.executeUpdate();
            return result;
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