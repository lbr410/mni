package com.mni.product;
 
public class ProductDTO {

   private int prod_idx;
   private String prod_name;
   private String prod_title;
   private int prod_price;
   private int prod_count;
   private String prod_date;
   private String prod_title_img;
   private String prod_pet;
   private String prod_info_img;
   private int prod_brand;
   private int prod_category;
   private int prod_sale;
   
   public ProductDTO() {
      
   }

   public ProductDTO(String prod_name, String prod_title, int prod_price, int prod_count, String prod_date,
         String prod_title_img, String prod_pet, String prod_info_img, int prod_brand, int prod_category) {
      super();
      this.prod_name = prod_name;
      this.prod_title = prod_title;
      this.prod_price = prod_price;
      this.prod_count = prod_count;
      this.prod_date = prod_date;
      this.prod_title_img = prod_title_img;
      this.prod_pet = prod_pet;
      this.prod_info_img = prod_info_img;
      this.prod_brand = prod_brand;
      this.prod_category = prod_category;
   }

   public ProductDTO(int prod_idx, String prod_name, String prod_title, int prod_price, int prod_count, String prod_date,
         String prod_pet, int prod_brand, int prod_category) {
      super();
      this.prod_idx = prod_idx;
      this.prod_name = prod_name;
      this.prod_title = prod_title;
      this.prod_price = prod_price;
      this.prod_count = prod_count;
      this.prod_date = prod_date;
      this.prod_pet = prod_pet;
      this.prod_brand = prod_brand;
      this.prod_category = prod_category;
   }

   public ProductDTO(String prod_name, String prod_title, int prod_price, int prod_count,
         String prod_title_img, String prod_pet, String prod_info_img, int prod_brand, int prod_category) {
      super();
      this.prod_name = prod_name;
      this.prod_title = prod_title;
      this.prod_price = prod_price;
      this.prod_count = prod_count;
      this.prod_title_img = prod_title_img;
      this.prod_pet = prod_pet;
      this.prod_info_img = prod_info_img;
      this.prod_brand = prod_brand;
      this.prod_category = prod_category;
   }

   public ProductDTO(int prod_idx, String prod_name, String prod_title, int prod_price, int prod_count, String prod_date,
         String prod_title_img, String prod_pet, String prod_info_img, int prod_brand, int prod_category) {
      super();
      this.prod_idx = prod_idx;
      this.prod_name = prod_name;
      this.prod_title = prod_title;
      this.prod_price = prod_price;
      this.prod_count = prod_count;
      this.prod_date = prod_date;
      this.prod_title_img = prod_title_img;
      this.prod_pet = prod_pet;
      this.prod_info_img = prod_info_img;
      this.prod_brand = prod_brand;
      this.prod_category = prod_category;
   }
   
   
   public ProductDTO(String prod_name, int prod_price, String prod_title_img, int prod_brand, int prod_idx, String prod_title) {
      super();
      this.prod_name = prod_name;
      this.prod_price = prod_price;
      this.prod_title_img = prod_title_img;
      this.prod_brand = prod_brand;
      this.prod_idx = prod_idx;
      this.prod_title = prod_title;
   }
   
   public ProductDTO(String prod_name, String prod_title, int prod_price, String prod_title_img) {
      super();
      this.prod_name = prod_name;
      this.prod_title = prod_title;
      this.prod_price = prod_price;
      this.prod_title_img = prod_title_img;
   }

   public int getProd_idx() {
      return prod_idx;
   }

   public void setProd_idx(int prod_idx) {
      this.prod_idx = prod_idx;
   }

   public String getProd_name() {
      return prod_name;
   }

   public void setProd_name(String prod_name) {
      this.prod_name = prod_name;
   }

   public String getProd_title() {
      return prod_title;
   }

   public void setProd_title(String prod_title) {
      this.prod_title = prod_title;
   }

   public int getProd_price() {
      return prod_price;
   }

   public void setProd_price(int prod_price) {
      this.prod_price = prod_price;
   }

   public int getProd_count() {
      return prod_count;
   }

   public void setProd_count(int prod_count) {
      this.prod_count = prod_count;
   }

   public String getProd_date() {
      return prod_date;
   }

   public void setProd_date(String prod_date) {
      this.prod_date = prod_date;
   }

   public String getProd_title_img() {
      return prod_title_img;
   }

   public void setProd_title_img(String prod_title_img) {
      this.prod_title_img = prod_title_img;
   }

   public String getProd_pet() {
      return prod_pet;
   }

   public void setProd_pet(String prod_pet) {
      this.prod_pet = prod_pet;
   }

   public String getProd_info_img() {
      return prod_info_img;
   }

   public void setProd_info_img(String prod_info_img) {
      this.prod_info_img = prod_info_img;
   }

   public int getProd_brand() {
      return prod_brand;
   }

   public void setProd_brand(int prod_brand) {
      this.prod_brand = prod_brand;
   }

   public int getProd_category() {
      return prod_category;
   }

   public void setProd_category(int prod_category) {
      this.prod_category = prod_category;
   }

   public int getProd_sale() {
      return prod_sale;
   }

   public void setProd_sale(int prod_sale) {
      this.prod_sale = prod_sale;
   }
}