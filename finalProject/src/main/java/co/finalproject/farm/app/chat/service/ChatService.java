package co.finalproject.farm.app.chat.service;

import java.util.List;
import java.util.Map;

public interface ChatService {

	public ChatRoomVO getChatRoom(ChatRoomVO vo); 				//채팅방 조회
	public int insertChatRoom(ChatRoomVO vo); 					//채팅방 생성
	public List<ChatRoomVO> getChatRoomList(ChatRoomVO vo); 	//해당하는 id의 채팅방리스트 불러오기
	public List<Map<String,Object>> getMessageList(MessageVO vo);			//chatroom_no에 해당하는 메세지 내용 list 불러오기

	public int insertMessage(MessageVO vo); 			//메세지 보내기
	public MessageVO getRecentMessage(MessageVO vo); 	//최근 메세지 불러오기
	public int updateReadTime1(MessageVO vo); 			//읽은 시간 update
	
}
