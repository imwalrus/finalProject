package co.finalproject.farm.app.community.service;

import lombok.Data;

@Data
public class CommPagingVO extends CommunityVO {
	//페이징
    Integer page = 1;
	int start = 1;
	int end = 10;
}
