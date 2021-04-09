package co.finalproject.farm.app.chat.service.impl;


import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.finalproject.farm.app.chat.service.ChatRoomVO;
import co.finalproject.farm.app.chat.service.ChatService;
import co.finalproject.farm.app.chat.service.MessageVO;

@Service
public class ChatServiceImpl implements ChatService {

		@Autowired ChatMapper chatDAO;
		
	public ChatRoomVO getChatRoom(ChatRoomVO vo) {
		return chatDAO.getChatRoom(vo);
	}

	public int insertChatRoom(ChatRoomVO vo) {
		int result = chatDAO.insertChatRoom(vo);
		return result;
	}

	public List<ChatRoomVO> getChatRoomList(ChatRoomVO vo) {
		return chatDAO.getChatRoomList(vo);
	}

	public int insertMessage(MessageVO vo) {
		int result = chatDAO.insertMessage(vo);
		return result;
	}

	public MessageVO getRecentMessage(MessageVO vo) {
		return chatDAO.getRecentMessage(vo);
	}

	public int updateReadTime1(MessageVO vo) {
		int result = chatDAO.updateReadTime1(vo);
		return result;
	}

	public List<MessageVO> getMessageList(MessageVO vo) {
		return chatDAO.getMessageList(vo);
	}

	public int deleteMessage(String chatroom_no) {
		int result = chatDAO.deleteMessage(chatroom_no);
		return result;
	}

	public int deleteChatRoom(String chatroom_no) {
		int result = chatDAO.deleteChatRoom(chatroom_no);
		return result;
	}

	public int getUnreadMessage(String user_id) {
		int result = chatDAO.getUnreadMessage(user_id);
		return result;
	}

}
