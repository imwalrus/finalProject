package co.finalproject.farm.app.user.service;


import lombok.Data;

@Data
public class UserVO {
	// 페이징
	Integer page = 1;
	int start = 1;
	int end = 10;
	int pro_count;
	
	private String user_id;
	private String user_pwd;
	private String user_name;
	private String user_email;
	private String user_birth;
	private String user_phone;
	private String user_zip;
	private String user_adr;
	private String user_detailadr;
	private String user_auth;
	private String farmer_check;
	
	// 농업인 신청 관련 VO
	private String farmer_no;
	private String farmer_date;
	private String farmer_filename;
	
}
