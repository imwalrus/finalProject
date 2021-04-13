package co.finalproject.farm.app.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import co.finalproject.farm.app.community.service.CommPagingVO;
import co.finalproject.farm.app.community.service.CommunityVO;
import co.finalproject.farm.app.community.service.impl.CommunityMapper;
import co.finalproject.farm.app.intoTheFarm.service.IntoTheFarmVO;
import co.finalproject.farm.app.intoTheFarm.service.impl.IntoTheFarmMapper;
import co.finalproject.farm.app.shop.service.OrderVO;
import co.finalproject.farm.app.shop.service.impl.ShopMapper;
import co.finalproject.farm.app.user.service.UserVO;
import co.finalproject.farm.app.user.service.impl.UserMapper;
import co.finalproject.farm.common.Paging;

@Controller
public class AdminController {
	@Autowired UserMapper userMapper;
	@Autowired IntoTheFarmMapper intoFarmMapper;
	@Autowired ShopMapper shopMapper;
	@Autowired CommunityMapper communityMapper;

	// 메인페이지
	@GetMapping("/admin")
	public String adminMove(Model model) {
		model.addAttribute("user", userMapper.getCount());
		model.addAttribute("intoFarm", intoFarmMapper.getCount());
		model.addAttribute("order", shopMapper.getCount());
		model.addAttribute("comm", communityMapper.getCount());
		return "adminTiles/admin/admin";
	}
	
	// 회원 관리 - 전체 조회
	@GetMapping("/adminUser")
	public String adminUser(UserVO vo, Paging paging, Model model) {
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
	
	// 농업인 신청 현황 - 전체 조회
	@GetMapping("/adminFarmer")
	public String adminFarmer(UserVO vo, Paging paging, Model model) {
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
	
	// 농업인 신청 현황 - 단건 보기
	@GetMapping("/adminFarmerSel")
	public String adminFarmerSel(UserVO vo, Model model) {
		model.addAttribute("farmer", userMapper.getFarmer(vo));
		return "notiles/admin/adminFarmerSel";
	}
	
	// 농업인 신청 현황 - 권한 수정
	@PostMapping("/adminFarmerUpt")
	public String adminFarmerUpt(UserVO vo) {
		userMapper.updateFarmer(vo);
		userMapper.updateFarmerCheck(vo);
		return "redirect:/adminFarmer";
	}
	
	// 농촌속으로 현황 - 전체 조회
	@GetMapping("/adminIntoFarm")
	public String adminIntoFarm(IntoTheFarmVO vo, Paging paging, Model model) {
		paging.setPageUnit(5); // 한 페이지에 표시되는 레코드 건 수
		paging.setPageSize(3); // 표시되는 페이지 번호
		// 페이징
		if (vo.getPage() == null) {
			vo.setPage(1);
		}
		vo.setStart(paging.getFirst());
		vo.setEnd(paging.getLast());
		paging.setTotalRecord(intoFarmMapper.getCount(vo));
		model.addAttribute("paging", paging); // 페이징
		model.addAttribute("intoFarm", intoFarmMapper.getFarmList(vo));
		return "adminTiles/admin/adminIntoFarm";
		
	}
	
	// 농촌속으로 현황 - 단건 보기
	@GetMapping("/adminIntoFarmSel")
	public String adminIntoFarmSel(IntoTheFarmVO vo, Model model) {
		model.addAttribute("intoFarm", intoFarmMapper.getSearchFarm(vo));
		return "notiles/admin/adminIntoFarmSel";
	}
	
	// 농촌속으로 현황 - 삭제
	@PostMapping("/adminIntoFarmDel")
	public String adminIntoFarmDel(IntoTheFarmVO vo) {
		intoFarmMapper.deleteFarm(vo);
		return "redirect:/adminIntoFarm";
	}
	
	// 판매 현황 - 전체 조회
	@GetMapping("/adminOrder")
	public String adminShop(OrderVO vo, Paging paging, Model model) {
		paging.setPageUnit(5); // 한 페이지에 표시되는 레코드 건 수
		paging.setPageSize(3); // 표시되는 페이지 번호
		// 페이징
		if (vo.getPage() == null) {
			vo.setPage(1);
		}
		vo.setStart(paging.getFirst());
		vo.setEnd(paging.getLast());
		paging.setTotalRecord(shopMapper.getCountAdmin(vo));
		model.addAttribute("paging", paging); // 페이징
    	model.addAttribute("order", shopMapper.adminShop(vo));
		return "adminTiles/admin/adminOrder";
	}
	
	// 커뮤니티 현황 - 전체 조회
    @GetMapping("/adminCommunity")
    public String adminCommunity(CommPagingVO vo, Paging paging, Model model) {
    	paging.setPageUnit(5); //한 페이지에 표시되는 레코드 건수
		paging.setPageSize(3); //페이지 번호수
		//페이징
		if(vo.getPage() == null) {
			vo.setPage(1);
		}
		vo.setStart(paging.getFirst());
		vo.setEnd(paging.getLast());
		paging.setTotalRecord(communityMapper.getCount(vo)); 
		model.addAttribute("paging", paging);
    	model.addAttribute("community", communityMapper.getComm(vo) );
    	return "adminTiles/admin/adminCommunity";
    }
    
    // 커뮤니티 현황 - 단건 보기
	@GetMapping("/adminCommunitySel")
	public String adminCommunitySel(CommunityVO vo, Model model) {
		model.addAttribute("community", communityMapper.getSchComm(vo));
		return "notiles/admin/adminCommunitySel";
	}
    
    // 커뮤니티 현황 - 삭제
    @PostMapping("/adminCommunityDel")
    public String adminCommunityDel(CommPagingVO vo) {
    	communityMapper.deleteComm(vo);
    	return "redirect:/adminCommunity";
    }
}
