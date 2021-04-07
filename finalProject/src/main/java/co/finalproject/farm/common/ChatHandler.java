package co.finalproject.farm.common;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.fasterxml.jackson.databind.ObjectMapper;

import co.finalproject.farm.app.chat.service.ChatRoomVO;
import co.finalproject.farm.app.chat.service.ChatService;
import co.finalproject.farm.app.chat.service.MessageVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/chat") //servlet-context.xml에 설정한 것과 동일하게 적용
public class ChatHandler extends TextWebSocketHandler {
	
	@Autowired ChatService chatService;
	
	private final ObjectMapper objectMapper = new ObjectMapper();
	private List<WebSocketSession> connectUsers; //로그인한 전체 세션 리스트 담는 곳 
	private Map<String,WebSocketSession> users = new HashMap<String, WebSocketSession>();//1:1채팅

	public ChatHandler() {
		connectUsers = new ArrayList<WebSocketSession>();
	} 
	
	//클라이언트 연결 이후 시행되는 메서드
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		//웹소켓 세션이 intercept한 httpsession값을 사용.
		String user_id = (String) session.getAttributes().get("user_id");
		if(user_id!=null) 
			System.out.println("로그인한 아이디 : "+user_id);
			log.info("{} 연결됨", user_id);
			users.put(user_id,session);
			connectUsers.add(session);
	}
	
	//클라이언트 연결 해제 이후 시행되는 메서드
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		connectUsers.remove(session);
		users.remove(session.getId());
		log.info(session.getId()+" 연결 종료됨!!!! ");
	}
	
	/*   
	* < 메세지 전송 >
	* 클라이언트가 메시지를 전송했을 때 호출되는메소드
	* session은 메시지를 전송한 클라이언트
	* message는 클라이언트가 전송한 메시지 : getPayload()를 호출하면 전송한 메시지를 확인할 수 있음.
	* 클라이언트에게 메시지를 전송하고자 할 때는 ->
	* session, sendMessage(new TextMessage("메시지"));
	*/
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		System.out.println("현재 접속중인 유저==============> " + users);
		
		String msg = message.getPayload(); //사용자가 보낸 메세지
		MessageVO msgVO = objectMapper.readValue(msg, MessageVO.class);
		
		ChatRoomVO roomVO = new ChatRoomVO();
		roomVO.setUser_id_one(msgVO.getMsg_recevier());
		roomVO.setUser_id_two(msgVO.getMsg_sender());
		
		ChatRoomVO room = new ChatRoomVO();
		int createRoom =0;
		if(chatService.getChatRoom(roomVO) == null) {
			//채팅방 조회 후 채팅방 결과가 없을 경우
			room.setUser_id_one(roomVO.getUser_id_one());
			room.setUser_id_two(roomVO.getUser_id_two());
			createRoom = chatService.insertChatRoom(room);
			room = chatService.getChatRoom(room);
			msgVO.setChatroom_no(room.getChatroom_no());
		} else { 
			room = chatService.getChatRoom(roomVO);
		}
		
		String sm = msgVO.getMsg_sender()+","
				+ msgVO.getMsg_recevier()+","
				+ msgVO.getMsg_content()+","
				+ msgVO.getMsg_sendtime();
		
		WebSocketSession rs = users.get(msgVO.getMsg_recevier());
		if(rs != null) {
			rs.sendMessage(new TextMessage(sm));
		}
		session.sendMessage(new TextMessage(sm)); //클라이언트에게 보냄
		
		//DB에 message insert
		MessageVO insertVO = new MessageVO();
		insertVO.setMsg_sender(msgVO.getMsg_sender());
		insertVO.setMsg_recevier(msgVO.getMsg_recevier());
		insertVO.setMsg_content(msgVO.getMsg_content());
		insertVO.setMsg_sendtime(msgVO.getMsg_sendtime());
		insertVO.setChatroom_no(msgVO.getChatroom_no());
		int insertMessage = chatService.insertMessage(insertVO);
		
		if(createRoom + insertMessage == 2) {
			System.out.println("채팅방 생성 및 메세지 DB저장 성공");
		} else {
			System.out.println("채팅방 이미 존재! 메세지 DB저장 성공");
		}
	}
	
	@Override
	public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
		log.info(session.getId() + " 익셉션 발생: " + exception.getMessage());
	}
	


	
	
	
}
