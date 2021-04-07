package co.finalproject.farm.app.shop.service;

import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class ShopVO {	
	// 페이징
	Integer page = 1;
	int start = 1;
	int end = 10;
	int pro_count;
	private String pro_no;
	private String pro_name;
	private String pro_price;
	private String pro_dcompany;
	private String pro_quantity;
	private String pro_condition;
	private String pro_content;
	private String user_id;
	private String pro_filename;
	private MultipartFile uploadFile;
	private String pro_category;
	private String orderCond;
	private String user_name;
}
