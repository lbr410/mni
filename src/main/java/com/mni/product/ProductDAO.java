package com.mni.product;

import java.sql.*;
import java.util.ArrayList;

public class ProductDAO {

	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;

	/** 상품 등록 메서드 */
	public int prodInsert(ProductDTO dto) {
		try {
			conn = com.mni.db.MniDB.getConn();
			String sql = "insert into product " + "values(prod_idx.nextval,?,?,?,?,sysdate,?,?,?,?,?,0)";
			ps = conn.prepareStatement(sql);
			ps.setString(1, dto.getProd_name());
			ps.setString(2, dto.getProd_title());
			ps.setInt(3, dto.getProd_price());
			ps.setInt(4, dto.getProd_count());
			ps.setString(5, dto.getProd_title_img());
			ps.setString(6, dto.getProd_pet());
			ps.setString(7, dto.getProd_info_img());
			ps.setInt(8, dto.getProd_brand());
			ps.setInt(9, dto.getProd_category());
			int count = ps.executeUpdate();
			return count;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		} finally {
			try {
				if (ps != null)
					ps.close();
				if (conn != null)
					conn.close();
			} catch (Exception e2) {
			}
		}
	}

	/** 상품 내역 출력 메서드 */
	public ArrayList<ProductDTO> prodList(int cp,int pageCnt) {
		try {
			conn = com.mni.db.MniDB.getConn();
			int start = (cp-1)*pageCnt+1;
			int end = cp*pageCnt;
			String sql = "select * from "
					+ "(select rownum as rnum,a.* from "
					+ "(select prod_idx,prod_name,prod_title,prod_price,prod_count,"
					+ "To_char(prod_date,'yyyy-MM-dd Hh24:mi:ss') as prod_date,prod_title_img,prod_pet,"
					+ "prod_info_img,prod_brand,prod_category from product order by prod_idx desc) a) b "
					+ "where rnum>=? and rnum<=?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, start);
			ps.setInt(2, end);
			rs = ps.executeQuery();
			ArrayList<ProductDTO> arr = new ArrayList<ProductDTO>();
			if (rs.next()) {
				do {
					int prod_idx = rs.getInt("prod_idx");
					String prod_name = rs.getString("prod_name");
					String prod_title = rs.getString("prod_title");
					int prod_price = rs.getInt("prod_price");
					int prod_count = rs.getInt("prod_count");
					String prod_date = rs.getString("prod_date");
					String prod_title_img = rs.getString("prod_title_img");
					String prod_pet = rs.getString("prod_pet");
					String prod_info_img = rs.getString("prod_info_img");
					int prod_brand = rs.getInt("prod_brand");
					int prod_category = rs.getInt("prod_category");
					ProductDTO dto = new ProductDTO(prod_idx, prod_name, prod_title, prod_price, prod_count, prod_date,
							prod_title_img, prod_pet, prod_info_img, prod_brand, prod_category);
					arr.add(dto);
				} while (rs.next());
			}
			return arr;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
				if (conn != null)
					conn.close();
			} catch (Exception e2) {
			}
		}
	}
	/**상품 총 개수 메서드*/
	public int prodCnt() {
		try {
			conn=com.mni.db.MniDB.getConn();
			String sql="select count(*) from product";
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
	/**상품 수정 클릭 시 해당 상품 출력 메서드*/
	public ProductDTO prodUpdate(int prod_idx) {
		try {
			conn=com.mni.db.MniDB.getConn();
			String sql="select prod_name,prod_title,prod_price,prod_count,"
					+ "To_char(prod_date,'yyyy-MM-dd Hh24:mi:ss') as prod_date,prod_title_img,prod_pet,"
					+ "prod_info_img,prod_brand,prod_category from product where prod_idx = ?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, prod_idx);
			rs=ps.executeQuery();
			ProductDTO dto = null;
			if(rs.next()) {
				String prod_name = rs.getString("prod_name");
				String prod_title = rs.getString("prod_title");
				int prod_price = rs.getInt("prod_price");
				int prod_count = rs.getInt("prod_count");
				String prod_date = rs.getString("prod_date");
				String prod_title_img = rs.getString("prod_title_img");
				String prod_pet = rs.getString("prod_pet");
				String prod_info_img = rs.getString("prod_info_img");
				int prod_brand = rs.getInt("prod_brand");
				int prod_category = rs.getInt("prod_category");
				dto = new ProductDTO(prod_name, prod_title, prod_price, prod_count, prod_date, prod_title_img, prod_pet, prod_info_img, prod_brand, prod_category);
			}return dto;
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
