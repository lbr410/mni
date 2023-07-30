package com.mni.cart;

public class CartDTO {
	private int cart_idx;
	private int user_idx;
	private int prod_idx;
	private int cart_count;
	private int cart_total_price;
	private String prod_name;
	private String prod_title_img;
	
	public CartDTO() {
		// TODO Auto-generated constructor stub
	}

	public CartDTO(int cart_idx, int user_idx, int prod_idx, int cart_count, int cart_total_price, String prod_name, String prod_title_img) {
		super();
		this.cart_idx = cart_idx;
		this.user_idx = user_idx;
		this.prod_idx = prod_idx;
		this.cart_count = cart_count;
		this.cart_total_price = cart_total_price;
		this.prod_name = prod_name;
		this.prod_title_img = prod_title_img;
	}

	public int getCart_idx() {
		return cart_idx;
	}

	public void setCart_idx(int cart_idx) {
		this.cart_idx = cart_idx;
	}

	public int getUser_idx() {
		return user_idx;
	}

	public void setUser_idx(int user_idx) {
		this.user_idx = user_idx;
	}

	public int getProd_idx() {
		return prod_idx;
	}

	public void setProd_idx(int prod_idx) {
		this.prod_idx = prod_idx;
	}

	public int getCart_count() {
		return cart_count;
	}

	public void setCart_count(int cart_count) {
		this.cart_count = cart_count;
	}

	public int getCart_total_price() {
		return cart_total_price;
	}

	public void setCart_total_price(int cart_total_price) {
		this.cart_total_price = cart_total_price;
	}

	public String getProd_name() {
		return prod_name;
	}

	public void setProd_name(String prod_name) {
		this.prod_name = prod_name;
	}

	public String getProd_title_img() {
		return prod_title_img;
	}

	public void setProd_title_img(String prod_title_img) {
		this.prod_title_img = prod_title_img;
	}
}