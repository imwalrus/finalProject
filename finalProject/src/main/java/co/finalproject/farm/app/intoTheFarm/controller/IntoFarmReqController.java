package co.finalproject.farm.app.intoTheFarm.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import co.finalproject.farm.app.intoTheFarm.service.IntoFarmReqVO;
import co.finalproject.farm.app.intoTheFarm.service.impl.IntoFarmReqMapper;
import co.finalproject.farm.app.user.service.UserService;
import co.finalproject.farm.app.user.service.UserVO;

@Controller
public class IntoFarmReqController {
	@Autowired 
	IntoFarmReqMapper intoFarmReqMapper;
	@Autowired UserService userService;
	
	Logger logger = LoggerFactory.getLogger(IntoTheFarmController.class);
	
	//전체조회
	@RequestMapping("/getReqFarmList")
	public String getReqFarmList(IntoFarmReqVO vo, Model model) {
		
		model.addAttribute("reqList", intoFarmReqMapper.getReqFarmList(vo));
		return "intoFarm/intoTheFarm"; //마이페이지로 이동??
		
	}
	
	//단건조회
	@RequestMapping("/getSearchReqFarm")
	public String getSearchReqFarm(IntoFarmReqVO vo, Model model) {
		
		model.addAttribute("reqSearchList", intoFarmReqMapper.getSearchReqFarm(vo));
		return "intoFarm/intoTheFarm";
		
	}
	 
	//체험신청 페이지
	@GetMapping("/insertReqFarm") // 등록 페이지
	public String insertReqFarm(IntoFarmReqVO vo, UserVO uservo,Model model, HttpSession session) {
		
		//로그인 아이디 가져오기
		String id = (String)session.getAttribute("user_id");
		vo.setUser_id(id);
		uservo.setUser_id(id);
		model.addAttribute("uservo",userService.loginCheck(uservo));
		return "intoFarm/intoTheFarm";
	}
	
	//체험 신청
	@PostMapping("/insertReqFarm") 
	public @ResponseBody String insertReqFarm(IntoFarmReqVO vo) {
		intoFarmReqMapper.insertReqFarm(vo);
		return "redirect:/getFarmList";
		//마이페이지로 이동??
		
	}
	
	//수정
	
}
