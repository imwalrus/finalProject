package co.finalproject.farm.app.notice.service;

import lombok.Data;

@Data
public class FaqVO {
	private int faq_no;
	private String faq_title;
	private String faq_category;
	private String faq_date;
	private String faq_content;
}
