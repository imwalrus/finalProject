package co.finalproject.farm.app.community.service;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class CommunityVO {
	private String user_id;
	private int comm_no;
	private String comm_subject;
	private String comm_title;
	private String comm_content;
	private String comm_adr;
	private int comm_hit;
	private String comm_date;
	private String comm_filename;
	private MultipartFile uploadFile;
	
	
}
