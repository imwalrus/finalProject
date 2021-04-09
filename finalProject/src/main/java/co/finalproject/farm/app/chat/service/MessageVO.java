package co.finalproject.farm.app.chat.service;

import java.util.Date;

import com.google.gson.Gson;

import lombok.Data;

@Data
public class MessageVO {

	private int msg_no;
	private String msg_sender;
	private String  msg_receiver;
	private String  msg_content;
	private String msg_sendtime;
	private Date msg_readtime;
	private String msg_type;
	private int chatroom_no;
	private int msg_num;
	
}
