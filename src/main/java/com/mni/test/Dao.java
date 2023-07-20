package com.mni.test;

import java.sql.*;

public class Dao {
	
	private Connection conn;
	
	public Connection daoTest() {
		try {
			conn = com.mni.db.MniDB.getConn();
			System.out.println("DB 연결 성공");
			return conn;
		} catch(Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			try {
				
			} catch(Exception e) {}
		}
	}
}