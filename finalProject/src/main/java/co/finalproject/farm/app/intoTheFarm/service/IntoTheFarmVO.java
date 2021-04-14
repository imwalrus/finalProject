package co.finalproject.farm.app.intoTheFarm.service;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class IntoTheFarmVO {
	//페이징
	Integer page = 1;
	int start = 1;
	int end = 10;
	private String into_no;
	private String into_title;
	private String into_phone;
	private String into_product;
	//@DateTimeFormat(pattern="yyyy-MM-dd")
	private String into_date;
	//@DateTimeFormat(pattern="yyyy-MM-dd")
	private String s_date;
	//@DateTimeFormat(pattern="yyyy-MM-dd")
	private String e_date;
	private String into_entry;
	private String into_info;
	private String user_id;
	private String into_city;
	private String into_filename;
	private MultipartFile[] uploadFile;
	private String into_dates; //마이페이지-신청내역관리에서 사용
	
	public String getUploadFileName() {
		return into_filename;
	}
	public void setUploadFileName(String uploadFileName) {
		this.into_filename = uploadFileName;
	}
	public MultipartFile[] getUploadFile() {
		return uploadFile;
	}
	public void setUploadFile(MultipartFile[] uploadFile) {
		this.uploadFile = uploadFile;
	}
	
	//INTOFARM_REQ 테이블
	private String into_req_num;
	private String into_req_phone;
	private String into_req_entry;
	private String into_req_reward;
	private String into_req_date;
	private String into_req_dates; //yyyy-mm-dd 
	private String user_name;
	private String req_user;
}