package co.finalproject.farm.chat;


import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/chat") //servlet-context.xml에 설정한 것과 동일하게 적용
public class ChatHandler extends TextWebSocketHandler {
	
	private List<WebSocketSession> webSessions = new ArrayList<>();
	public Map<String, WebSocketSession> users = new ConcurrentHashMap<String, WebSocketSession>();

	//접속
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		String user_id = (String) session.getAttributes().get("user_id");
		if(user_id!=null) {
			users.put(user_id, session);
		}
		log.info(session.getId()+" 연결됨!!!!!!");
		webSessions.add(session);
	}
	
	//메세지 전송
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
	}
	
	//접속해제
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
	}
	
	
	
	
}
