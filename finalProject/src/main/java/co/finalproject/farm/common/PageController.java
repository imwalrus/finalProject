package co.finalproject.farm.common;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class PageController {
	
	@GetMapping("/login")
	public String loginMove() {
		return "login";
	}

	@GetMapping("/admin")
	public String adminMove() {
		return "admin";
	}
	
	@GetMapping("/myPage")
	public String myPageMove() {
		return "myPage";
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

	@GetMapping("/shop")
	public String shopMove() {
		return "shop";
	}

	@GetMapping("/community")
	public String communityMove() {
		return "community";
	}
	
	@GetMapping("/faq")
	public String faqMove() {
		return "faq";
	}

}
