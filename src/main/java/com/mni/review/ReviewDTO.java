package com.mni.review;

import java.sql.Date;

public class ReviewDTO {
   private int review_idx;
   private int prod_idx;
   private int user_idx;
   private String review_content;
   private String review_img;
   private Date review_date;
   private String user_id; // userInfo의 user_id
   private String prod_name; //product의 prod_name
   
   public ReviewDTO() {
      
   }

   public ReviewDTO(int review_idx, int prod_idx, int user_idx, String review_content, String review_img,
         Date review_date, String user_id, String prod_name) {
      super();
      this.review_idx = review_idx;
      this.prod_idx = prod_idx;
      this.user_idx = user_idx;
      this.review_content = review_content;
      this.review_img = review_img;
      this.review_date = review_date;
      this.user_id = user_id;
      this.prod_name = prod_name;
   }

   public int getReview_idx() {
      return review_idx;
   }

   public void setReview_idx(int review_idx) {
      this.review_idx = review_idx;
   }

   public int getProd_idx() {
      return prod_idx;
   }

   public void setProd_idx(int prod_idx) {
      this.prod_idx = prod_idx;
   }

   public int getUser_idx() {
      return user_idx;
   }

   public void setUser_idx(int user_idx) {
      this.user_idx = user_idx;
   }

   public String getReview_content() {
      return review_content;
   }

   public void setReview_content(String review_content) {
      this.review_content = review_content;
   }

   public String getReview_img() {
      return review_img;
   }

   public void setReview_img(String review_img) {
      this.review_img = review_img;
   }

   public Date getReview_date() {
      return review_date;
   }

   public void setReview_date(Date review_date) {
      this.review_date = review_date;
   }

   public String getUser_id() {
      return user_id;
   }

   public void setUser_id(String user_id) {
      this.user_id = user_id;
   }

   public String getProd_name() {
      return prod_name;
   }

   public void setProd_name(String prod_name) {
      this.prod_name = prod_name;
   }
}