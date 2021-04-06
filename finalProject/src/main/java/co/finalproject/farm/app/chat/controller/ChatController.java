package co.finalproject.farm.app.chat.controller;


import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


import co.finalproject.farm.app.chat.service.ChatRoomVO;
import co.finalproject.farm.app.chat.service.ChatService;
import co.finalproject.farm.app.chat.service.MessageVO;

@Controller
public class ChatController {
	
	@Autowired ChatService chatService;
	
		//마이페이지에서 쪽지 버튼 클릭 시...! 
		@RequestMapping("/showChat")
		public String showChatGet(Model model,HttpSession session) {
			model.addAttribute("user_id",session.getAttribute("user_id"));
			return "chat/chat/showChat";
		}
		
		//커뮤니티에서 1:1대화하기 버튼 클릭시
		@PostMapping("/showChat")
		public String showChatPost() {
			return "chat/chat/showChat";
		}

		@RequestMapping("/getMessageList")
		@ResponseBody
		public List<Map<String,Object>> getMessageList(MessageVO vo,Model model) {
			//메세지 list 불러오기 
			List<Map<String,Object>> msgList = chatService.getMessageList(vo);
			//메세지 리스트 불러오면서 해당하는 chatroom에 읽지않은 message 읽은 시간 update
			if(msgList != null) {
				chatService.updateReadTime1(vo);
			}
			return msgList;
		}
		
		@RequestMapping("/getChatRoom")
		@ResponseBody
		public String getChatRoom(ChatRoomVO vo) {
			//해당하는 아이디에 대해 
			ChatRoomVO crVO = chatService.getChatRoom(vo);
			String result = null;
			if(crVO != null) {
				result = "ok";
			} else {
				result = "no";
				chatService.insertChatRoom(vo);
			}
			return result;
		}
}
