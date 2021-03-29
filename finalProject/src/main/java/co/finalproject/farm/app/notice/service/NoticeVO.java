package co.finalproject.farm.app.notice.service;

import lombok.Data;

@Data
public class NoticeVO {
	private String notice_no;
	private String notice_title;
	private String notice_category;
	private String notice_date;
	private String notice_content;
	private String notice_hit;
	
}
