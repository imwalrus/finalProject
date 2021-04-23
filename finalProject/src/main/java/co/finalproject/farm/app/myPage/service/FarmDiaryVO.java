package co.finalproject.farm.app.myPage.service;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class FarmDiaryVO {
	//farmdiary
	private String fdiary_no;
	private String fdiary_day;
	private String fday;
	private String fdiary_stime;
	private String fdiary_etime;
	private String fdiary_worker;
	private String fdiary_weather;
	private String fdiary_content;
	private String fdiary_filename;
	private String crop_name;
	private MultipartFile uploadFile;	
	private String dcount;
	private String f_year;
	private String f_month;
	private String f_day;
	//crop
	private String crop_no;
	private String user_id;
}
