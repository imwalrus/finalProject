package co.finalproject.farm.app.admin.service;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class BannerVO {
	private String banner_no;
	private String banner_title;
	private String banner_link;
	private String banner_filename;
	private String banner_check;
	private MultipartFile uploadFile;
}
