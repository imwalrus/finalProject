package co.finalproject.farm.app.intoTheFarm.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import co.finalproject.farm.app.intoTheFarm.service.IntoTheFarmVO;
import co.finalproject.farm.app.intoTheFarm.service.impl.IntoTheFarmMapper;

@Controller
public class IntoTheFarmController {
	@Autowired IntoTheFarmMapper intoTheFarmMapper;
	
	//전체조회
	@RequestMapping("/getFarmList")
	public String getFarmList(IntoTheFarmVO vo, Model model) {
		model.addAttribute("list", intoTheFarmMapper.getFarmList(vo));
		System.out.println("list");
		return "intoTheFarm";
	}
	
	
	//단건조회
	//@RequestMapping("/getFarm")
	//수정
	//@RequestMapping("/insertFarm")
	//삭제
	//@RequestMapping("/deleteFarm")
}
