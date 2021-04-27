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
import co.finalproject.farm.app.intoTheFarm.service.IntoTheFarmVO;
import co.finalproject.farm.app.intoTheFarm.service.impl.IntoFarmReqMapper;
import co.finalproject.farm.app.intoTheFarm.service.impl.IntoTheFarmMapper;
import co.finalproject.farm.app.myPage.service.impl.IntoFarmMapper;
import co.finalproject.farm.app.user.service.UserService;
import co.finalproject.farm.app.user.service.UserVO;

@Controller
public class IntoFarmReqController {
	@Autowired IntoFarmReqMapper intoFarmReqMapper;
	@Autowired UserService userService;
	@Autowired IntoTheFarmMapper intoTheFarmMapper;
	@Autowired IntoFarmMapper intoFarmMapper;
	
	Logger logger = LoggerFactory.getLogger(IntoTheFarmController.class);
	
	
	//단건조회
	@RequestMapping("/getSearchReqFarm")
	public String getSearchReqFarm(IntoFarmReqVO vo, Model model) {
		
		model.addAttribute("reqSearchList", intoFarmReqMapper.getSearchReqFarm(vo));
		return "intofarmTiles/intoFarm/intoTheFarm";
		
	}
	 
	//체험신청 페이지
	@GetMapping("/insertReqFarm") // 등록 페이지
	public @ResponseBody String insertReqFarm(IntoFarmReqVO vo, IntoTheFarmVO intoFarmVO, UserVO uservo,Model model, HttpSession session) {
		
		//로그인 아이디 가져오기
		String id = (String)session.getAttribute("user_id");
		vo.setUser_id(id);
		uservo.setUser_id(id);
		System.out.println(userService.loginCheck(uservo));
		model.addAttribute("uservo",userService.loginCheck(uservo));
		model.addAttribute("list", intoTheFarmMapper.getFarmList(intoFarmVO));
		return "intofarmTiles/intoFarm/intoTheFarm";
		
	}
	
	//체험 신청(개인)
	@PostMapping("/insertReqFarm") 
	public @ResponseBody String insertReqFarmProc(IntoFarmReqVO vo,IntoTheFarmVO intoFarmVO, Model model) {
		intoFarmReqMapper.insertReqFarm(vo);
		//insert한 into_req_num을 intofarmVO에 담기
		String no = vo.getInto_req_num();
		intoFarmVO.setInto_req_num(no);
		
		model.addAttribute("intoFarmVO",intoTheFarmMapper.getSearchFarm(intoFarmVO));
		System.out.println(intoFarmVO);
		model.addAttribute("togetEntry",intoTheFarmMapper.togetEntry(intoFarmVO));
		
		return "redirect:/myIntoList";
		
	}
	
	//체험신청(그룹)
	@PostMapping("/insertGroupFarm") 
	public @ResponseBody String insertReqFarmProc1(IntoFarmReqVO vo,IntoTheFarmVO intoFarmVO, Model model) {
		intoFarmReqMapper.insertGroupFarm(vo);
		//insert한 into_req_num을 intofarmVO에 담기
		String no = vo.getInto_req_num();
		intoFarmVO.setInto_req_num(no);
		
		model.addAttribute("togetEntry",intoTheFarmMapper.togetEntry(intoFarmVO));
		
		return "redirect:/myIntoList";
		
	}
	
	
	
}
