package co.finalproject.farm.app.user.controller;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import co.finalproject.farm.app.user.service.UserService;
import co.finalproject.farm.app.user.service.UserVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class UserController {
	
	@Autowired UserService userService;
	@Autowired BCryptPasswordEncoder pwdEncoder;
	
	//회원가입 페이지로 이동
	@GetMapping("/signUpForm")
	public String getSignUpForm() {
		return "nofooter/users/signUpForm";
	}
	
	//아이디, 비밀번호 찾기페이지로 이동
	@GetMapping("/findIdorPw")
	public String findIdorPw() {
		return "users/findIdorPw";
	}
	
	//ID 중복체크
	@RequestMapping("/idCheck")
	@ResponseBody
	public int idCheck(UserVO vo) {
		int result= userService.idCheck(vo);
		return result;
	}
	
	//이메일 중복체크
	@RequestMapping("/emailCheck")
	@ResponseBody
	public int emailCheck(UserVO vo) {
		int result= userService.emailCheck(vo);
		return result;
	}
	
	//주소 팝업
	@RequestMapping("/jusoPopup")
	public String jusoPopup() {
		return "notiles/popup/jusoPopup";
	}
	
	//회원가입 완료 후 home으로 이동
	@PostMapping("/signUp")
	public String insertUser(UserVO vo){
		//비밀번호 암호화해서 다시 vo에 저장
		vo.setUser_pwd(pwdEncoder.encode(vo.getUser_pwd()));
		userService.insertUser(vo);
		return "redirect:login";
	}
	
	
	//로그인 아이디 패스워드 체크 후 로그인 -> 홈으로 이동
	@PostMapping("/login")
	public String login(UserVO vo , HttpServletRequest request, RedirectAttributes redirectAttr) {
		//입력한 비밀번호와 db에 저장된 비밀번호 확인
		UserVO resultVO = userService.loginCheck(vo);
		HttpSession session = request.getSession();		
		if(resultVO != null && pwdEncoder.matches(vo.getUser_pwd(), resultVO.getUser_pwd()) && (resultVO.getUser_active()).equals("1")) {
			/* session.setAttribute("user", resultVO); */
			//로그인 체크에 성공하면 세션에 user_id, user_auth 담아두기
			session.setAttribute("user_id", resultVO.getUser_id());
			session.setAttribute("user_auth", resultVO.getUser_auth());
		} else {
			redirectAttr.addFlashAttribute("msg", "아이디 또는 비밀번호를 확인해주세요.");
			return "redirect:login";
		}

		return "redirect:/";
	}
	
	//id 찾기
	@PostMapping("/idFind")
	@ResponseBody
	public UserVO idFind(UserVO vo) {
		UserVO result = userService.idFind(vo);
		return result;
	}
	
	//비밀번호 찾기
	@PostMapping("/pwFind")
	@ResponseBody
	public int pwFind(UserVO vo) {
		int result = userService.pwFind(vo);
		log.info("====================비밀번호 찾기 결과==============="+result);
		return result;
	}
	
	//회원 권한 변경(user-> farmer)
	@GetMapping("/updateUserToFarmer")
	@ResponseBody
	public int updateUserToFarmer(UserVO vo) {
		int result = userService.updateUserToFarmer(vo);
		return result;
	}
	
	//회원정보 수정 폼
	@GetMapping("/updateUser")
	public String updateUser(Model model, UserVO vo) {
		model.addAttribute("list", userService.getUser(vo));
		return "mypageTiles/mypage/updateUser";
	}
	
	//회원정보 수정
	@PostMapping("/updateUser")
	public String updateUser(UserVO vo){
		//비밀번호 암호화해서 다시 vo에 저장
		if(vo.getUser_pwd() != null) {
			vo.setUser_pwd(pwdEncoder.encode(vo.getUser_pwd()));			
		}
		userService.updateUser(vo);
		return "redirect:/myPage";
	}
	
	
	//로그아웃
	@GetMapping("/logout")
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.invalidate();
		return "redirect:/";
	}
	
	//회원탈퇴폼
	@GetMapping("/memberOut")
	public String memberOut(Model model, UserVO vo) {
		model.addAttribute("out", userService.getUser(vo));
		return "mypageTiles/mypage/memberOut";
	}
	
	//회원탈퇴 시 아작스 패스워드 체크용
	@RequestMapping("/pwCheck")
	@ResponseBody
	public int memberOutPwCheck(UserVO vo) {
		int result = 0;
		UserVO resultVO = userService.loginCheck(vo);
		if(pwdEncoder.matches(vo.getUser_pwd(),resultVO.getUser_pwd())==true) {
			result = 1;
		}
		return result;
	}
	
	//회원탈퇴 처리
	@PostMapping("/memberOut")
	public String memberOutProc(UserVO vo , RedirectAttributes redirectAttr) {
		UserVO resultVO = userService.loginCheck(vo);
		log.info("회원탈퇴하려는 id ===========> "+ resultVO.getUser_id());
		if(pwdEncoder.matches(vo.getUser_pwd(),resultVO.getUser_pwd())) {
			userService.memberOut(vo);
			return "redirect:/memberOutSuccess";
		} else {
			redirectAttr.addFlashAttribute("msg", "비밀번호가 일치하지 않습니다.");
			return "redirect:/";
		}

	}
	
	//회원탈퇴 성공 후 로그아웃 후 탈퇴 페이지로 이동
	@GetMapping("/memberOutSuccess")
	public String memberOutSuccess(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.invalidate();
		return "mypage/memberOutSuccess";
	}
		
	
}
