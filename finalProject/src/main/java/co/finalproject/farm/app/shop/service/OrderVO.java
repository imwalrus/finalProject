package co.finalproject.farm.app.shop.service;

import lombok.Data;

@Data
public class OrderVO {
	private String order_no;
	private String order_date;
	private String order_condition;
	private String orderlist_condition;
	private String order_invoice;
	private String order_payment;
	private String order_totalprice;
	private String order_zip;
	private String order_adr;
	private String order_detailadr;
	private String order_name;
	private String order_phone;
	private String user_id;
	private String pro_no;
	private String orderlist_pro_name;
	private String orderlist_pro_count;
	private String orderlist_pro_price;
	private String pro_name;
	private String pro_price;
	private String pro_dcompany;
	private String pro_dcost;
	private String account;	// 수량 * 개당가격
	private String buyer;// 구매자ID
	private String seller;// 판매자ID
	private String cart_count;
	private String orderlist_no;
	private String orderlist_invoice;
}
