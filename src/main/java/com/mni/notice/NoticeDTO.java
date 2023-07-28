package com.mni.notice;

import java.sql.*;

public class NoticeDTO {
	
	private int notice_idx;
	private String admin_id;
	private String notice_title;
	private String notice_content;
	private int notice_count;
	private Date notice_date;

	public NoticeDTO() {
		// TODO Auto-generated constructor stub
	}

	public NoticeDTO(int notice_idx, String admin_id, String notice_title, String notice_content, int notice_count,
			Date notice_date) {
		super();
		this.notice_idx = notice_idx;
		this.admin_id = admin_id;
		this.notice_title = notice_title;
		this.notice_content = notice_content;
		this.notice_count = notice_count;
		this.notice_date = notice_date;
	}


	public int getNotice_idx() {
		return notice_idx;
	}

	public void setNotice_idx(int notice_idx) {
		this.notice_idx = notice_idx;
	}

	public String getAdmin_id() {
		return admin_id;
	}

	public void setAdmin_id(String admin_id) {
		this.admin_id = admin_id;
	}

	public String getNotice_title() {
		return notice_title;
	}

	public void setNotice_title(String notice_title) {
		this.notice_title = notice_title;
	}

	public String getNotice_content() {
		return notice_content;
	}

	public void setNotice_content(String notice_content) {
		this.notice_content = notice_content;
	}

	public int getNotice_count() {
		return notice_count;
	}

	public void setNotice_count(int notice_count) {
		this.notice_count = notice_count;
	}

	public Date getNotice_date() {
		return notice_date;
	}

	public void setNotice_date(Date notice_date) {
		this.notice_date = notice_date;
	}
	
	
	
}
