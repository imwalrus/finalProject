package co.finalproject.farm.common;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class PageController {
	
	@GetMapping("/login")
	public String loginMove() {
		return "nofooter/login";
	}

	@GetMapping("/admin")
	public String adminMove() {
		return "adminTiles/admin";
	}
	
	@GetMapping("/myPage")
	public String myPageMove() {
		return "mypageTiles/myPage";
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
	

}
