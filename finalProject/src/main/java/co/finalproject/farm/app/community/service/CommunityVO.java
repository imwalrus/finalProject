package co.finalproject.farm.app.community.service;

import lombok.Data;

@Data
public class CommunityVO {
	private String user_id;
	private String comm_no;
	private String comm_subject;
	private String comm_title;
	private String comm_content;
	private String comm_adr;
	private int comm_hit;
	private String comm_date;
	
	
}
