package co.finalproject.farm.common;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import co.finalproject.farm.app.chat.service.ChatRoomVO;
import co.finalproject.farm.app.chat.service.ChatService;
import co.finalproject.farm.app.chat.service.MessageVO;
import co.finalproject.farm.app.user.service.UserVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/chat") //servlet-context.xml에 설정한 것과 동일하게 적용
public class ChatHandler extends TextWebSocketHandler {
	
	@Autowired ChatService chatService;

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
	
	/*   < 메세지 전송 >
	* 클라이언트가 메시지를 전송했을 때 호출되는메소드
	* session은 메시지를 전송한 클라이언트
	* message는 클라이언트가 전송한 메시지 : getPayload()를 호출하면 전송한 메시지를 확인할 수 있음.
	* 클라이언트에게 메시지를 전송하고자 할 때는
	* session, sendMessage(new TextMessage("메시지"));*/
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		String msg = message.getPayload();
	}
	
	@Override
	public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
		log.info(session.getId() + " 익셉션 발생: " + exception.getMessage());
	}
	


	
	
	
}
