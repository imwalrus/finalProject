package co.finalproject.farm.app.myPage.service;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class puchasInqVO {

	private String pur_inq_no;
	private String pur_inq_date;
	private String pur_inq_title;
	private String pur_inq_content;
	private String pur_inq_check;
	private String pro_no;
	private String pur_inq_filename;
	private String user_id;
	private MultipartFile inqfile;
	
	
	
	
}
