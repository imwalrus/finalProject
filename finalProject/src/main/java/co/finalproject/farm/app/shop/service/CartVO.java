package co.finalproject.farm.app.shop.service;

import lombok.Data;

@Data
public class CartVO {
	private String cart_no;
	private String user_id;
	private String pro_no;
	private String pro_name;
	private String pro_content;
	private String pro_filename;
	private String cart_count;
	private String cart_price;
	private String seller;
}
