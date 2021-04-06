package co.finalproject.farm.app.intoTheFarm.service;

import java.sql.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class IntoTheFarmVO {
	private String into_no;
	private String into_title;
	private String into_phone;
	private String into_product;
	private Date into_date;
	private String into_entry;
	private String into_info;
	private String user_id;
	private String into_city;
	private String into_filename;
	private List<MultipartFile> uploadFile;
	
	public String getUploadFileName() {
		return into_filename;
	}
	public void setUploadFileName(String uploadFileName) {
		this.into_filename = uploadFileName;
	}
	public List<MultipartFile> getUploadFile() {
		return uploadFile;
	}
	public void setUploadFile(List<MultipartFile> uploadFile) {
		this.uploadFile = uploadFile;
	}
}