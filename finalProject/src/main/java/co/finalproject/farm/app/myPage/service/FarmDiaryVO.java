package co.finalproject.farm.app.myPage.service;

import java.util.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class FarmDiaryVO {
	
	//farmdiary
	private String fdiary_no;
	private String fdiary_day;
	private String fdiary_crop;
	private String fdiary_stime;
	private String fdiary_etime;
	private String fdiary_worker;
	private String fdiary_weather;
	private String fdiary_content;
	private String fdiary_filename;
	private String fday;
	private String ssi;
	private String sbun;
	private String esi;
	private String ebun;
	private String crop_name;
	private MultipartFile uploadFile;
	
	//crop
	private String crop_no;
	private String user_id;
}
