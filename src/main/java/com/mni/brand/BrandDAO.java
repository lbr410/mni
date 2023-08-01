package com.mni.brand;

import java.sql.*;
import java.util.ArrayList;

public class BrandDAO {
	
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	
	public BrandDAO() {
		System.out.println("BrandDAO() 생성자 호출됨");
	}

	/*브랜드 번호로 상품 조회*/
	public ArrayList<BrandDTO> brandNum(int num,int cp, int ls) {
		try {
			conn=com.mni.db.MniDB.getConn();
			//String sql="select * from product where prod_brand=?";
			int start=(cp-1)*ls+1;
			int end=cp*ls;
			String sql="select * from "
					+ "(select rownum as rnum,a.* from "
					+ "(select * from product where prod_brand=?) a) "
					+ "where rnum>=? and rnum<=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, num);
			ps.setInt(2, start);
			ps.setInt(3, end);
			rs=ps.executeQuery();
			
			ArrayList<BrandDTO> arr=new ArrayList<BrandDTO>();
			while(rs.next()) {
				String name=rs.getString("prod_name");
				String title=rs.getString("prod_title");
				int price=rs.getInt("prod_price");
				String img=rs.getString("prod_title_img");
				
				BrandDTO dto=new BrandDTO(name, title, price, img);
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
	
	/**페이징 관련 총 게시물수*/
	public int getTotal(int num) {
		try {
			conn=com.mni.db.MniDB.getConn();
			String sql="select count(*) from product where prod_brand=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, num);
			rs=ps.executeQuery();
			rs.next();
			int count=rs.getInt(1);
			return count==0?-1:count;
			
		}catch(Exception e) {
			e.printStackTrace();
			return -1;
		}finally {
			try {
				if(rs!=null)rs.close();
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			}catch(Exception e2) {}
		}
	}
	
}
