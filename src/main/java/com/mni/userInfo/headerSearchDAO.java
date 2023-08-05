package com.mni.userInfo;

import java.sql.*;
import java.util.*;
import com.mni.product.*;

public class headerSearchDAO {
	
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	
	public headerSearchDAO() {
		System.out.println("headerSearchDAO()생성자 호출됨");
	}
	
	/*헤더 검색SM*/
	public ArrayList<ProductDTO> userProductSearch(String search, int cp, int pageCnt){
		try{
			conn = com.mni.db.MniDB.getConn();
			int start = (cp-1)*pageCnt+1;
	        int end = cp*pageCnt;
			int userSearch = 0;
			switch (search) {
			case "사료": userSearch = 1;break;
			case "간식": userSearch = 2;break; 
			case "용품": userSearch = 3;break;
			case "장난감": userSearch = 4;break;
			}
			ArrayList<ProductDTO> arr = new ArrayList<ProductDTO>();
			if(userSearch != 0) {
				String sql = "select * from "
						+ "(select rownum as rnum,a.* from "
						+ "(select prod_name,prod_title_img,prod_brand,prod_price,prod_idx,prod_title from product "
						+ "where prod_category = ?) a) b "
						+ "where rnum>=? and rnum<=?";
				ps = conn.prepareStatement(sql);
				ps.setInt(1, userSearch);
				ps.setInt(2, start);
				ps.setInt(3, end);
				rs = ps.executeQuery();
				if(rs.next()) {
					do {
						String prod_name = rs.getString("prod_name");
						String prod_title_img = rs.getString("prod_title_img");
						int prod_brand = rs.getInt("prod_brand");
						int prod_price = rs.getInt("prod_price");
						int prod_idx = rs.getInt("prod_idx");
						String prod_title = rs.getString("prod_title");
						ProductDTO dto = new ProductDTO(prod_name, prod_price, prod_title_img, prod_brand,prod_idx,prod_title);
						arr.add(dto);
					}while(rs.next());
				}
			}else {
				String sql = "select * from "
						+ "(select rownum as rnum,a.* from "
						+ "(select prod_name,prod_title_img,prod_brand,prod_price,prod_idx,prod_title from product "
						+ "where prod_name like ?) a) b "
						+ "where rnum>=? and rnum<=?";
				ps = conn.prepareStatement(sql);
				ps.setString(1,"%" + search + "%");
				ps.setInt(2, start);
				ps.setInt(3, end);
				rs = ps.executeQuery();
				if(rs.next()) {
					do {
						String prod_name = rs.getString("prod_name");
						String prod_title_img = rs.getString("prod_title_img");
						int prod_brand = rs.getInt("prod_brand");
						int prod_price = rs.getInt("prod_price");
						int prod_idx = rs.getInt("prod_idx");
						String prod_title = rs.getString("prod_title");
						ProductDTO dto = new ProductDTO(prod_name, prod_price, prod_title_img, prod_brand,prod_idx,prod_title);
						arr.add(dto);
					}while(rs.next());
				}
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
	
	/*헤더검색 총게시물수(페이징이용)SM*/
	public int searchProdCnt(String search) {
		try {
			conn = com.mni.db.MniDB.getConn();
			
			int userSearch = 0;
			int count = 0;
			switch (search) {
			case "사료": userSearch = 1;break;
			case "간식": userSearch = 2;break; 
			case "용품": userSearch = 3;break;
			case "장난감": userSearch = 4;break;
			}
			
			if(userSearch != 0) {
				String sql = "select count(*) from product "
						+ "where prod_category = ?";
				ps = conn.prepareStatement(sql);
				ps.setInt(1, userSearch);
				rs = ps.executeQuery();
				if(rs.next()) {
					count = rs.getInt(1);
				}
			}else {
				String sql = "select count(*) from product "
						+ "where prod_name like ?";
				ps = conn.prepareStatement(sql);
				ps.setString(1,"%" + search + "%");
				rs = ps.executeQuery();
				if(rs.next()) {
					count = rs.getInt(1);
				}
			}
			return count;
		}catch(Exception e){
			e.printStackTrace();
			return -1;
		}finally {
			try {
				if(rs != null) rs.close();
				if(ps != null) ps.close();
				if(conn != null) conn.close();
			}catch(Exception e) {}
		}
	}
}
