package co.finalproject.farm.app.user.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class UserController {
	
	
	//회원가입 페이지로 이동
	@GetMapping("/signUpForm")
	public String getSignUpForm() {
		return "/user/signupForm";
	}
	
	//회원가입 완료 후 home으로 이동
	@GetMapping("/signUp")
	public String insertUser() {
		return "redirect:home";
	}
	
}
