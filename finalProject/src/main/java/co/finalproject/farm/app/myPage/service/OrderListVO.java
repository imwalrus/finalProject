package co.finalproject.farm.app.myPage.service;

import lombok.Data;

@Data
public class OrderListVO {

	
	private String order_no;
	private String pro_no;
	private String orderlist_pro_name;
	private String orderlist_pro_count;
	private String orderlist_pro_price;
	private String pro_name;
	private String pro_price;
	private String pro_dcompany;
	private String pro_dcost;
	private String user_id;
	private String account;
	private String order_payment;
	private String client;
}
