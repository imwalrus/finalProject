package co.finalproject.farm.common;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import co.finalproject.farm.app.chat.service.ChatService;

@Controller
public class PageController {
	
	@Autowired ChatService chatService;
	
	@GetMapping("/login")
	public String loginMove() {
		return "nofooter/login";
	}
	
	@GetMapping("/myPage")
	public String myPageMove(Model model,HttpSession session) {
		String user_id = (String) session.getAttribute("user_id");
		model.addAttribute("unreadNum", chatService.getUnreadMessageAll(user_id)); 
		return "mypageTiles/mypage/myPage";
	}

	@GetMapping("/notice")
	public String noticeMove() {
		return "notice";
	}

	@GetMapping("/education")
	public String educationMove() {
		return "education";
	}

	@GetMapping("/intoTheFarm")
	public String intoTheFarmMove() {
		return "intoTheFarm";
	}

	@GetMapping("/community")
	public String communityMove() {
		return "community";
	}

	
}

