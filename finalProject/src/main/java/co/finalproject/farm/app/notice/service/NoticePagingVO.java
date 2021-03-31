package co.finalproject.farm.app.notice.service;

import lombok.Data;

@Data
public class NoticePagingVO extends NoticeVO {
	//페이징
    Integer page = 1;
	int start = 1;
	int end = 10;
}
