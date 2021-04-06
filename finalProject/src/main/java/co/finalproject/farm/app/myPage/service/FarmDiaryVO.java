package co.finalproject.farm.app.myPage.service;

import java.util.Date;

import lombok.Data;

@Data
public class FarmDiaryVO {
	
	private int fdiary_no;
	private Date fdiary_day;
	private String fdiary_crop;
	private Date fdiary_stime;
	private Date fdiary_etime;
	private int fdiary_worker;
	private String fdiary_weather;
	private String fdiary_content;
	private String user_id;
	private int crop_no;
	private String fdiary_filename;
	private String fday;
	private String sampm;
	private String ssi;
	private String sbun;
	private String eampm;
	private String esi;
	private String ebun;
	
}
