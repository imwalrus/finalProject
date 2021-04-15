package co.finalproject.farm.app.myPage.service;



import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class FarmerVO {

	
	private String farmer_no;
	private String farmer_filename;
	private String farmer_check;
	private String user_id;
	private MultipartFile uploadFile;
	private String farmer_date;
	
}
