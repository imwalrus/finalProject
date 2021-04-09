package co.finalproject.farm.app.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import co.finalproject.farm.app.user.service.UserVO;
import co.finalproject.farm.app.user.service.impl.UserMapper;
import co.finalproject.farm.common.Paging;

@Controller
public class AdminController {
	@Autowired UserMapper userMapper;

	// 메인페이지
	@GetMapping("/admin")
	public String adminMove() {
		return "adminTiles/admin/admin";
	}
	
	// 회원 관리 - 전체 조회
	@GetMapping("/adminUser")
	public String adminUserList(UserVO vo, Paging paging, Model model) {
		paging.setPageUnit(5); // 한 페이지에 표시되는 레코드 건 수
		paging.setPageSize(3); // 표시되는 페이지 번호
		// 페이징
		if (vo.getPage() == null) {
			vo.setPage(1);
		}
		vo.setStart(paging.getFirst());
		vo.setEnd(paging.getLast());
		paging.setTotalRecord(userMapper.getCount(vo));
		model.addAttribute("paging", paging); // 페이징
		model.addAttribute("user", userMapper.getUserList(vo));
		return "adminTiles/admin/adminUser";
	}
	
	// 회원 관리 - 단건 조회(Modal)
	@GetMapping("/adminUserSel")
	public String adminUserSel(UserVO vo, Model model) {
		model.addAttribute("user", userMapper.getUser(vo));
		return "notiles/admin/adminUserSel";
	}
	
	// 회원 관리 - 회원 삭제
	@PostMapping("/adminUserDel")
	public String adminUserDel(UserVO vo) {
		userMapper.deleteUser(vo);
		return "redirect:/adminUser";
	}
	
	// 농업인 신청 현황
	@GetMapping("/adminFarmer")
	public String getFarmerList(UserVO vo, Paging paging, Model model) {
		paging.setPageUnit(5); // 한 페이지에 표시되는 레코드 건 수
		paging.setPageSize(3); // 표시되는 페이지 번호
		// 페이징
		if (vo.getPage() == null) {
			vo.setPage(1);
		}
		vo.setStart(paging.getFirst());
		vo.setEnd(paging.getLast());
		paging.setTotalRecord(userMapper.getCountFarmer(vo));
		model.addAttribute("paging", paging); // 페이징
		model.addAttribute("farmer", userMapper.getFarmerList(vo));
		return "adminTiles/admin/adminFarmer";
	}
	
	// 농업인 신청 현황(단건)
	@GetMapping("/adminFarmerSel")
	public String getFarmerSel(UserVO vo, Model model) {
		model.addAttribute("farmer", userMapper.getFarmer(vo));
		return "notiles/admin/adminFarmerSel";
	}
	
	// 농업인 권한 수정
	@PostMapping("/updateFarmer")
	public String updateFarmer(UserVO vo) {
		userMapper.updateFarmer(vo);
		userMapper.updateFarmerCheck(vo);
		return "redirect:/adminFarmer";
	}
}
