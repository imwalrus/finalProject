package co.finalproject.farm.app.myPage.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import co.finalproject.farm.app.myPage.service.impl.FarmDiaryMapper;

@Controller
public class FarmDiaryController {
	
	@Autowired FarmDiaryMapper fdiaryMapper;
	
	//전체조회
	@RequestMapping("/getFDiaryList")
	public String getFDiaryList(Model model) {
		
		model.addAttribute("list", fdiaryMapper.getFDiaryList());
		
		return "mypage/getFDiaryList";
	}
	

}
