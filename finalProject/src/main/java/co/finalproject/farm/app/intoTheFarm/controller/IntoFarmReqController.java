package co.finalproject.farm.app.intoTheFarm.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import co.finalproject.farm.app.intoTheFarm.service.IntoFarmReqVO;
import co.finalproject.farm.app.intoTheFarm.service.impl.IntoFarmReqMapper;

@Controller
public class IntoFarmReqController {
	@Autowired 
	IntoFarmReqMapper intoFarmReqMapper;
	
	//체험신청 페이지
	@GetMapping("/insertReqFarm") // 등록 페이지
	public String insertReqFarm(IntoFarmReqVO vo, Model model) {
		return "intoFarm/insertIntoReqFarm";
	}
	
	//체험 신청
	@PostMapping("/insertReqFarm") 
	public String insertReqFarm(IntoFarmReqVO vo) {
		return null;
		
	}
}
