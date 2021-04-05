package co.finalproject.farm.app.chat.controller;


import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ChatController {
	
	
		//마이페이지에서 쪽지 버튼 클릭 시...! 
		@RequestMapping("/showChat")
		public String showChatGet(Model model,HttpSession session) {
			model.addAttribute("user_id",session.getAttribute("user_id"));
			return "notiles/chat/showChat";
		}
		
		//커뮤니티에서 1:1대화하기 버튼 클릭시
		@PostMapping("/showChat")
		public String showChatPost() {
			return "notiles/chat/showChat";
		}

}
