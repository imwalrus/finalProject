package co.finalproject.farm.app.community.service;


import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class CommunityReplyVO {
	private int comm_rep_no; //댓글번호
	private String user_id; //유저 아이디
	private int comm_no; //글번호
	private String comm_rep_content; 
	@JsonFormat(pattern = "yyyy-MM-dd") //제이슨 타입으로 데이트타입 인설트 할 거니까 제이슨포맷 사용하면 된다.
	private Date comm_rep_date;
	
}
