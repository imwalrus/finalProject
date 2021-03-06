package co.finalproject.farm.app.education.service;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class EducationVO {
	private int edu_no;
	private String edu_title;
	private String edu_time;
	private String edu_organ;
	private String edu_check;
	private String edu_person;
	private String edu_phone;
	private String edu_content;
	private String edu_filename;
	private String edu_adr;
	private String edu_startdate;
	private String edu_enddate;
	private String edu_place;
	private MultipartFile uploadFile;
}
