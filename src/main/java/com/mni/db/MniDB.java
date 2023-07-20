package com.mni.db;

import java.sql.*;
import javax.sql.*;
import javax.naming.*;

public class MniDB {
	static DataSource ds;
	
	static {
		try {
			Context initContext = new InitialContext();
			Context envContext  = (Context)initContext.lookup("java:/comp/env");
			ds = (DataSource)envContext.lookup("jdbc/myoracle");
		} catch(Exception e) {}
	}
	
	public static Connection getConn() throws Exception {
		return ds.getConnection();
	}
}