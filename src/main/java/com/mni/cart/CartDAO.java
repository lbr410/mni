package com.mni.cart;

import java.sql.*;
import java.util.*;

public class CartDAO {
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	
	/** 장바구니 물건 추가 - BR */
	public int cartInsert(CartDTO dto) {
		try {
			conn = com.mni.db.MniDB.getConn();
			
			String sql = "insert into cart values(cart_idx.nextval, ?, ?, ?, ?, ?)";
			
			ps = conn.prepareStatement(sql);
			ps.setInt(1, dto.getUser_idx());
			ps.setInt(2, dto.getProd_idx());
			ps.setInt(3, dto.getCart_count());
			ps.setInt(4, dto.getCart_price());
			ps.setInt(5, dto.getCart_total_price());
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
	
	/** 장바구니 목록 출력 - BR */
	public ArrayList<CartDTO> cartList(int user_idx) {
		try {
			conn = com.mni.db.MniDB.getConn();
			

			//String sql = "select c.prod_idx prod_idx, cart_idx, prod_name, prod_title_img, user_idx, cart_count, cart_price, cart_price * cart_count cart_total_price from product p, cart c "

			String sql = "select c.prod_idx prod_idx, cart_idx, prod_name, "
					+ "prod_title_img, user_idx, cart_count, cart_price, "
					+ "cart_price * cart_count cart_total_price from product p, cart c "
					+ "where p.prod_idx = c.prod_idx "
					+ "and user_idx = ?";
			
			ps = conn.prepareStatement(sql);
			ps.setInt(1, user_idx);
			rs = ps.executeQuery();
			
			ArrayList<CartDTO> table = new ArrayList<CartDTO>();
			if(rs.next()) {
				do {
					int prod_idx = rs.getInt("prod_idx");
					int cart_idx = rs.getInt("cart_idx");
					String prod_name = rs.getString("prod_name");
					String prod_title_img = rs.getString("prod_title_img");
					int cart_count = rs.getInt("cart_count");
					int cart_price = rs.getInt("cart_price");
					int cart_total_price = rs.getInt("cart_total_price");
					
					CartDTO dto = new CartDTO();
					dto.setProd_idx(prod_idx);
					dto.setCart_idx(cart_idx);
					dto.setProd_name(prod_name);
					dto.setProd_title_img(prod_title_img);
					dto.setCart_count(cart_count);
					dto.setCart_price(cart_price);
					dto.setCart_total_price(cart_total_price);
					
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
	
	/** 장바구니 물건 삭제 - BR */
	public int cartDelete(int idx, int prod_idx) {
		try {
			conn = com.mni.db.MniDB.getConn();
			
			String sql = "delete from cart where user_idx = ? and prod_idx = ?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, idx);
			ps.setInt(2, prod_idx);
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
	
	/** 총 갯수, 총 가격 구하기 - BR */
	public int[] totalCntPrice(int user_idx) {
		try {
			conn = com.mni.db.MniDB.getConn();
			
			String sql = "select sum(cart_count) sum_count, sum(cart_price * cart_count) sum_price from cart where user_idx = ?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, user_idx);
			rs = ps.executeQuery();
			
			rs.next();
			int[] total = new int[2];
			total[0] = rs.getInt(1);
			total[1] = rs.getInt(2);
			
			return total;
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
	
	/** 장바구니 물건 수량 증가 - BR */
	public int totalCntPlus(int prod_idx) {
		try {
			conn = com.mni.db.MniDB.getConn();
			
			String sql = "update cart set cart_count = cart_count+1, cart_total_price = (cart_count+1)*cart_price where prod_idx = ?";
			//String sql = "update cart set cart_count = cart_count+1 where prod_idx = ?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, prod_idx);
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
	
	/** 장바구니 물건 수량 감소 - BR */
	public int totalCntMinus(int prod_idx) {
		try {
			conn = com.mni.db.MniDB.getConn();
			
			String sql = "update cart set cart_count = cart_count-1, cart_total_price = (cart_count-1)*cart_price where prod_idx = ?";
			//String sql = "update cart set cart_count = cart_count-1 where prod_idx = ?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, prod_idx);
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
	
	/** 상품 구매 후 장바구니 목록 삭제 */
	public int userCartDelete(int idx) {
		try {
			conn = com.mni.db.MniDB.getConn();
			
			String sql = "delete from cart where user_idx = ?";
			
			ps = conn.prepareStatement(sql);
			ps.setInt(1, idx);
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
}