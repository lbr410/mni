package com.mni.ord;

import java.sql.*;

public class OrdDTO {
   private int order_idx;
   private int user_idx;
   private int prod_idx;
   private String order_recie;
   private int order_zip;
   private String order_addr1;
   private String order_addr2;
   private String order_type;
   private String order_req;
   private java.sql.Date order_date;
   private String order_state;
   private int order_count;
   private int order_price;
    private String user_name;
    private String user_id;
    private String prod_title;
    private String prod_title_img;
    private String prod_name;

   
   public OrdDTO() {
      // TODO Auto-generated constructor stub
   }

   public OrdDTO(int order_idx, int user_idx, int prod_idx, String order_recie, int order_zip, String order_addr1,
            String order_addr2, String order_type, String order_req, Date order_date, String order_state,
            int order_count, int order_price, String prod_title_img, String prod_name) {
         super();
         this.order_idx = order_idx;
         this.user_idx = user_idx;
         this.prod_idx = prod_idx;
         this.order_recie = order_recie;
         this.order_zip = order_zip;
         this.order_addr1 = order_addr1;
         this.order_addr2 = order_addr2;
         this.order_type = order_type;
         this.order_req = order_req;
         this.order_date = order_date;
         this.order_state = order_state;
         this.order_count = order_count;
         this.order_price = order_price;
         this.prod_title_img = prod_title_img;
         this.prod_name = prod_name;
      }

   
      public OrdDTO(int order_idx, int user_idx, int prod_idx, String order_recie, int order_zip, String order_addr1,
               String order_addr2, String order_type, String order_req, Date order_date, String order_state,
               int order_count, int order_price, String user_name, String user_id, String prod_title) {
            super();
            this.order_idx = order_idx;
            this.user_idx = user_idx;
            this.prod_idx = prod_idx;
            this.order_recie = order_recie;
            this.order_zip = order_zip;
            this.order_addr1 = order_addr1;
            this.order_addr2 = order_addr2;
            this.order_type = order_type;
            this.order_req = order_req;
            this.order_date = order_date;
            this.order_state = order_state;
            this.order_count = order_count;
            this.order_price = order_price;
            this.user_name = user_name;
            this.user_id = user_id;
            this.prod_title = prod_title;
         }

         public OrdDTO(int order_idx, String order_type, Date order_date, int order_price, String prod_title_img,
                  String prod_name) {
               super();
               this.order_idx = order_idx;
               this.order_type = order_type;
               this.order_date = order_date;
               this.order_price = order_price;
               this.prod_title_img = prod_title_img;
               this.prod_name = prod_name;
            }


   public int getOrder_idx() {
      return order_idx;
   }

   public void setOrder_idx(int order_idx) {
      this.order_idx = order_idx;
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

   public String getOrder_recie() {
      return order_recie;
   }

   public void setOrder_recie(String order_recie) {
      this.order_recie = order_recie;
   }

   public int getOrder_zip() {
      return order_zip;
   }

   public void setOrder_zip(int order_zip) {
      this.order_zip = order_zip;
   }

   public String getOrder_addr1() {
      return order_addr1;
   }

   public void setOrder_addr1(String order_addr1) {
      this.order_addr1 = order_addr1;
   }

   public String getOrder_addr2() {
      return order_addr2;
   }

   public void setOrder_addr2(String order_addr2) {
      this.order_addr2 = order_addr2;
   }

   public String getOrder_type() {
      return order_type;
   }

   public void setOrder_type(String order_type) {
      this.order_type = order_type;
   }

   public String getOrder_req() {
      return order_req;
   }

   public void setOrder_req(String order_req) {
      this.order_req = order_req;
   }

   public java.sql.Date getOrder_date() {
      return order_date;
   }

   public void setOrder_date(java.sql.Date order_date) {
      this.order_date = order_date;
   }

   public String getOrder_state() {
      return order_state;
   }

   public void setOrder_state(String order_state) {
      this.order_state = order_state;
   }

   public int getOrder_count() {
      return order_count;
   }

   public void setOrder_count(int order_count) {
      this.order_count = order_count;
   }

   public int getOrder_price() {
      return order_price;
   }

   public void setOrder_price(int order_price) {
      this.order_price = order_price;
   }

   public String getUser_name() {
      return user_name;
   }

   public void setUser_name(String user_name) {
      this.user_name = user_name;
   }

   public String getUser_id() {
      return user_id;
   }

   public void setUser_id(String user_id) {
      this.user_id = user_id;
   }

   public String getProd_title() {
      return prod_title;
   }

   public void setProd_title(String prod_title) {
      this.prod_title = prod_title;
   }

   public String getProd_title_img() {
      return prod_title_img;
   }

   public void setProd_title_img(String prod_title_img) {
      this.prod_title_img = prod_title_img;
   }

   public String getProd_name() {
      return prod_name;
   }

   public void setProd_name(String prod_name) {
      this.prod_name = prod_name;
   }
   
   
}