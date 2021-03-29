package co.finalproject.farm.app.user.service;

import java.util.Date;

import lombok.Data;

@Data
public class UserVO {
	private String user_id;
	private String user_pwd;
	private String user_name;
	private String user_email;
	private int user_zip;
	private Date user_birth;
	private String user_phone;
	private String user_adr;
	private String user_detailadr;
	private String user_auth;
	
}
