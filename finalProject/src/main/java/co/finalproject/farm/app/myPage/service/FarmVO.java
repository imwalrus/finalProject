package co.finalproject.farm.app.myPage.service;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class FarmVO {
	
	private String farm_no;
	private String farm_name;
	private String farm_adr;
	private String farm_area;
	private String farm_content;
	private String farm_filename;
	private String user_id;
	private MultipartFile uploadFile;	

}
