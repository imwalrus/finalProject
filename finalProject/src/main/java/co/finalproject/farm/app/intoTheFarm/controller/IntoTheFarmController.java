package co.finalproject.farm.app.intoTheFarm.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
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
	@RequestMapping("/getSearchFarm")
	public String getSearchFarm(IntoTheFarmVO vo, Model model) {
		model.addAttribute("list",intoTheFarmMapper.getSearchFarm(vo));
		return "";
	}
	//등록
	@GetMapping("/insertFarm") //등록 페이지
	public String insertFarm(IntoTheFarmVO vo,Model model) {
		return "insertFarm";
	}
	
	@PostMapping("/insertFarm") //등록
	public String insertFarmProc(IntoTheFarmVO vo) {
		intoTheFarmMapper.insertFarm(vo);
		return "redirect:/getFarmList";
	}
	//수정
	@RequestMapping("/updateFarm")
	public String updateFarm(IntoTheFarmVO vo) {
		intoTheFarmMapper.updateFarm(vo);
		return "";
	}
	//삭제
	@RequestMapping("/deleteFarm")
	public String deleteFarm(IntoTheFarmVO vo) {
		intoTheFarmMapper.updateFarm(vo);
		return "";
	}
}
