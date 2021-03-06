package co.finalproject.farm.app.myPage.controller;

import java.util.List;

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

import co.finalproject.farm.app.myPage.service.IntoFarmInqVO;
import co.finalproject.farm.app.myPage.service.IntoFarmReplyVO;
import co.finalproject.farm.app.myPage.service.puchasInqVO;
import co.finalproject.farm.app.myPage.service.impl.IntoFarmInqMapper;

@Controller
public class IntoFarmInqController {
	
	@Autowired IntoFarmInqMapper ifiMapper; 
	
	Logger logger = LoggerFactory.getLogger(IntoFarmInqController.class);
	
//getintoFarmInqList
//getintoFarmInq
//insertintoFarmInq
//updateintoFarmInq
//deleteintoFarmInq
	
	//전체조회
	@RequestMapping("/getintoFarmInqList")
	public String getintoFarmInqList(Model model) {
		model.addAttribute("list", ifiMapper.getIntoFarmInqList());
		return "mypageTiles/mypage/getintoFarmInqList";
	}
	
	//자신이 남긴 농촌속으로 문의 전체조회(세션 아이디값으로 조회)
	@RequestMapping("/getIntoFarmInqOfUser")
	public String getIntoFarmInqOfUser(Model model, HttpSession session) {
		String user_id = (String) session.getAttribute("user_id");
		model.addAttribute("list", ifiMapper.getIntoFarmInqOfUser(user_id));
		return "mypageTiles/mypage/getintoFarmInqList";
	}
	
	//권한이 농업인일 경우, 자신이 등록한 농촌속으로에 들어온 문의 전체조회(세션아이디 값으로 조회)
	@RequestMapping("/getFarmInqofFarmer")
	public String getFarmInqofFarmer(Model model, HttpSession session) {
		String user_id = (String) session.getAttribute("user_id");
		model.addAttribute("list", ifiMapper.getFarmInqofFarmer(user_id));
		return "mypageTiles/mypage/getFarmInqofFarmer";
	}
	
	//단건조회
	@RequestMapping("/getintoFarmInq")
		public String getintoFarmInq(Model model,IntoFarmInqVO vo) {
			model.addAttribute("ilist", ifiMapper.getIntoFarmInq(vo));

			return "notiles/mypage/getintoFarmInq";
	}
	
	//등록폼
	@RequestMapping("/insertintoFarmInq")
	public String insertintoFarmInq(IntoFarmInqVO vo, Model model) {
		return "mypageTiles/mypage/insertintoFarmInq";
	}
	
	//등록처리
			@PostMapping("/insertintoFarmInq")
			public String insertintoFarmInqProc(IntoFarmInqVO vo){		
				logger.debug(vo.toString());
				ifiMapper.insertIntoFarmInq(vo);
				return "mypageTiles/mypage/getIntoFarmInqOfUser";
			}
			
			//수정
			// 수정폼
			@RequestMapping("/updateintoFarmInq")
			public String updateintoFarmInq(Model model,IntoFarmInqVO vo) {
				model.addAttribute("ulist", ifiMapper.getIntoFarmInq(vo));
				return "notiles/mypage/updateintoFarmInq";

	}
	
			// 수정처리
			@PostMapping("/updateintoFarmInq")
			public String updateintoFarmInqProc(IntoFarmInqVO vo) {
				logger.debug(vo.toString());
				ifiMapper.updateIntoFarmInq(vo);
				return "redirect:getIntoFarmInqOfUser";
			}

		//삭제
			@GetMapping("/deleteintoFarmInq")
			public String intoFarmInqVO(IntoFarmInqVO vo) {
				ifiMapper.deleteIntoFarmInq(vo);
				return "redirect:getIntoFarmInqOfUser";
			}

			//댓글
//			getintoFarmReplyList
//			insertintoFarmReply
//			deleteintoFarmReply

	//댓글
	//댓글조회
	@RequestMapping("/getintoFarmReplyList")
	public @ResponseBody List<IntoFarmReplyVO> getintoFarmReplyList(IntoFarmReplyVO vo){
		return ifiMapper.getintoFarmReplyList(vo);
		
	}
	
	//댓글등록
	@RequestMapping("/insertintoFarmReply")
	public @ResponseBody IntoFarmReplyVO insertIntoFarmReply(IntoFarmReplyVO vo) {
		ifiMapper.insertIntoFarmReply(vo);
		return vo;
	}
	
	//댓글 삭제
	@RequestMapping("/deleteintoFarmReply")
	public @ResponseBody IntoFarmReplyVO deleteintoFarmReply(IntoFarmReplyVO vo) {
		ifiMapper.deleteIntoFarmReply(vo);		
		return vo;
	}
			
}
