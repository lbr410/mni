package com.mni.ord;

import java.sql.*;

public class OrdDAO {
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	
	/** 상품 주문 - BR*/
//	public int buyProduct() {
//		try {
//			conn = com.mni.db.MniDB.getConn();
//			
//			String sql = "insert into ord(order_idx, user_idx, prod_idx, order_recie, order_zip, order_addr1, order_addr2, order_type, order_req, order_state, order_count, order_price) "
//					+ "values(order_idx.nextval, 21, 3, '홍길순', 12345, '서울시 동작구', '행복한 우리집', '신용카드', '집 앞에 놔주세요.',  '주문완료', 8, 100000)  ";
//		} catch(Exception e) {
//			e.printStackTrace();
//			return -1;
//		} finally {
//			try {
//				
//			} catch(Exception e) {}
//		}
//	}
}