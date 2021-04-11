package co.finalproject.farm.app.myPage.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import co.finalproject.farm.app.intoTheFarm.service.IntoTheFarmVO;
import co.finalproject.farm.app.myPage.service.impl.IntoFarmMapper;

@Controller
public class IntoFarmController {
	
	@Autowired IntoFarmMapper intoMapper;
///////농업인 권한 //////////////	
//농업인 농촌속으로 관리 리스트 이동
	@RequestMapping("/farmerIntoList")
	public String farmerIntoList() {
		return "mypageTiles/mypage/farmerIntoList";
	}

//관리 리스트 불러오기
	@RequestMapping("/ajaxfarmerIntoList")
	@ResponseBody
	public List<IntoTheFarmVO> farmerIntoList(IntoTheFarmVO vo){
		return intoMapper.farmerIntoList(vo);
	}

//봉사활동 양식 pdf 열기
	@RequestMapping("/bongsaFile")
	public String bongsaFile() {
		return "notiles/mypage/bongsaFile";
	}
	
//신청 명단 폼
	@RequestMapping("/intoUserList")
	public String intoUserList(Model model, @RequestParam String into_no) {
		model.addAttribute("into_no",into_no);
		return "notiles/mypage/intoUserList";
		
	}
//신청 명단 조회
	@RequestMapping("/ajaxintoUserList")
	@ResponseBody
	public List<IntoTheFarmVO> intoUserList(IntoTheFarmVO vo) {
		return intoMapper.intoUserList(vo);
	}

//신청 명단 삭제
	@GetMapping("/deleteUserList")
	public String delteUserList(IntoTheFarmVO vo) {
		intoMapper.deleteUserList(vo);
		
		return "redirect:farmerIntoList";
	}
	
///////유저 권한/////////////
//나의 신청내역 폼
	@RequestMapping("/myIntoList")
	public String myIntoList() {
		return "mypageTiles/mypage/myIntoList";
	}

//나의 신청내역 조회
		@RequestMapping("/ajaxmyIntoList")
		@ResponseBody
		public List<IntoTheFarmVO> myIntoList(IntoTheFarmVO vo){
			return intoMapper.myIntoList(vo);
		}

}