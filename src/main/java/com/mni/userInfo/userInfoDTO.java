package com.mni.userInfo;

import java.sql.*;

public class userInfoDTO {
	private int user_idx;
	private String user_id;
	private String user_name;
	private String user_pwd;
	private String user_tel;
	private long user_jumin;
	private int user_zip;
	private String user_addr1;
	private String user_addr2;
	private String user_email;
	private String user_delete;
	private Date user_joindate;
	private Date user_ddate;
	
	public userInfoDTO() {
		System.out.println("userDTO()생성자 호출됨");
	}
		
	/**회원정보 수정*/
	public userInfoDTO(String user_name, String user_pwd, String user_tel, int user_zip, String user_addr1,
			String user_addr2, String user_email) {
		super();
		this.user_name = user_name;
		this.user_pwd = user_pwd;
		this.user_tel = user_tel;
		this.user_zip = user_zip;
		this.user_addr1 = user_addr1;
		this.user_addr2 = user_addr2;
		this.user_email = user_email;
	}
	
	
	
	public userInfoDTO(int user_idx, String user_id, String user_name, String user_pwd, String user_tel, long user_jumin,
			int user_zip, String user_addr1, String user_addr2, String user_email, String user_delete,
			Date user_joindate, Date user_ddate) {
		super();
		this.user_idx = user_idx;
		this.user_id = user_id;
		this.user_name = user_name;
		this.user_pwd = user_pwd;
		this.user_tel = user_tel;
		this.user_jumin = user_jumin;
		this.user_zip = user_zip;
		this.user_addr1 = user_addr1;
		this.user_addr2 = user_addr2;
		this.user_email = user_email;
		this.user_delete = user_delete;
		this.user_joindate = user_joindate;
		this.user_ddate = user_ddate;
	}
	
	
	/*회원가입SM*/
	public userInfoDTO(String user_id, String user_name, String user_pwd, String user_tel, long user_jumin, int user_zip,
			String user_addr1, String user_addr2, String user_email) {
		super();
		this.user_id = user_id;
		this.user_name = user_name;
		this.user_pwd = user_pwd;
		this.user_tel = user_tel;
		this.user_jumin = user_jumin;
		this.user_zip = user_zip;
		this.user_addr1 = user_addr1;
		this.user_addr2 = user_addr2;
		this.user_email = user_email;
	}

	public int getUser_idx() {
		return user_idx;
	}

	public void setUser_idx(int user_idx) {
		this.user_idx = user_idx;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getUser_pwd() {
		return user_pwd;
	}

	public void setUser_pwd(String user_pwd) {
		this.user_pwd = user_pwd;
	}

	public String getUser_tel() {
		return user_tel;
	}

	public void setUser_tel(String user_tel) {
		this.user_tel = user_tel;
	}

	public long getUser_jumin() {
		return user_jumin;
	}

	public void setUser_jumin(long user_jumin) {
		this.user_jumin = user_jumin;
	}

	public int getUser_zip() {
		return user_zip;
	}

	public void setUser_zip(int user_zip) {
		this.user_zip = user_zip;
	}

	public String getUser_addr1() {
		return user_addr1;
	}

	public void setUser_addr1(String user_addr1) {
		this.user_addr1 = user_addr1;
	}

	public String getUser_addr2() {
		return user_addr2;
	}

	public void setUser_addr2(String user_addr2) {
		this.user_addr2 = user_addr2;
	}

	public String getUser_email() {
		return user_email;
	}

	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}

	public String getUser_delete() {
		return user_delete;
	}

	public void setUser_delete(String user_delete) {
		this.user_delete = user_delete;
	}

	public Date getUser_joindate() {
		return user_joindate;
	}

	public void setUser_joindate(Date user_joindate) {
		this.user_joindate = user_joindate;
	}

	public Date getUser_ddate() {
		return user_ddate;
	}

	public void setUser_ddate(Date user_ddate) {
		this.user_ddate = user_ddate;
	}

	



	
	
}
