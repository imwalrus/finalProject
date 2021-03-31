package co.finalproject.farm.app.notice.service;

import lombok.Data;

@Data
public class NoticeVO {
	private int notice_no;
	private String notice_title;
	private String notice_category;
	private String notice_date;
	private String notice_content;
	private int notice_hit;
}
