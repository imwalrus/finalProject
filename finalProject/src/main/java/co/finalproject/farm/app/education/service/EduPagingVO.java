package co.finalproject.farm.app.education.service;

import lombok.Data;

@Data
public class EduPagingVO extends EducationVO {
	//페이징
    Integer page = 1;
	int start = 1;
	int end = 10;
}
