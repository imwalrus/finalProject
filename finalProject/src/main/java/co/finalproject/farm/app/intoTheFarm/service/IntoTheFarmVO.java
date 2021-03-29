package co.finalproject.farm.app.intoTheFarm.service;

import java.sql.Date;

import lombok.Data;

@Data
public class IntoTheFarmVO {
	private String into_no;
	private String into_title;
	private String into_phone;
	private String into_product;
	private Date into_date;
	private String into_entry;
	private String into_filename;
	private String into_info;
	private String user_id;
	private String into_city;
	
}
