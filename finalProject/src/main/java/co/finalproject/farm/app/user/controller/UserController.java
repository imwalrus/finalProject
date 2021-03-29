package co.finalproject.farm.app.user.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import co.finalproject.farm.app.user.service.UserService;
import co.finalproject.farm.app.user.service.UserVO;


@Controller
public class UserController {
	
	@Autowired UserService userService;
	
	//회원가입 페이지로 이동
	@GetMapping("/signUpForm")
	public String getSignUpForm() {
		return "users/signUpForm";
	}
	
	//ID 중복체크
	@GetMapping("/idCheck")
	public void idCheck(Model model, UserVO vo) {
		model.addAttribute("result",userService.idCheck(vo));
	}
	
	//회원가입 완료 후 home으로 이동
	@PostMapping("/signUp")
	public String insertUser() {
		return "redirect:home";
	}
	
}
