package co.finalproject.farm.app.chat.service.impl;

import java.util.List;

import co.finalproject.farm.app.chat.service.ChatRoomVO;
import co.finalproject.farm.app.chat.service.MessageVO;

public interface ChatMapper {

		public ChatRoomVO getChatRoom(ChatRoomVO vo); 				//채팅방 조회
		public int insertChatRoom(ChatRoomVO vo); 			//채팅방 생성
		public List<ChatRoomVO> getChatRoomList(ChatRoomVO vo); 	//해당하는 id의 채팅방리스트 불러오기
		
		public int insertMessage(MessageVO vo); 			//메세지 보내기
		public MessageVO getRecentMessage(MessageVO vo); 	//최근 메세지 불러오기
		public int updateReadTime1(MessageVO vo); 			//읽은 시간 update
		
}
