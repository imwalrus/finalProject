package co.finalproject.farm.app.myPage.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import co.finalproject.farm.app.myPage.service.FarmVO;
import co.finalproject.farm.app.myPage.service.impl.FarmMapper;

@Controller
public class FarmController {
	
	@Autowired FarmMapper farmMapper;
	
//전체조회
	@RequestMapping("/getFarmList")
	public String getFarmList(Model model) {
		
		model.addAttribute("farmlist", farmMapper.getFarmList());
		
		return "mypage/getFarmList";
	}
//단건조회
	@RequestMapping("/getFarm")
	public String getFarm(Model model, FarmVO vo) {
		model.addAttribute("farm", farmMapper.getFarm(vo));
		
		return "mypage/getFarm";
	}

}
