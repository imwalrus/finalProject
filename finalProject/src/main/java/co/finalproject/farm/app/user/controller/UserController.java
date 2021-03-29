package co.finalproject.farm.app.user.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
	@RequestMapping("/idCheck")
	@ResponseBody
	public int idCheck(UserVO vo) {
		int result= userService.idCheck(vo);
		return result;
	}
	
	//email 중복체크 및 인증번호 발송
	@RequestMapping("/emailCheck")
	public Map<String, Object> sendEmail(@RequestParam String mail , HttpSession session){
		Map<String, Object> map = new HashMap<>();

		return map;
	}
	
	//회원가입 완료 후 home으로 이동
	@PostMapping("/signUp")
	public String insertUser() {
		return "redirect:home";
	}
	
}
