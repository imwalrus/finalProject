package co.finalproject.farm.app.admin.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import co.finalproject.farm.app.admin.service.BannerVO;
import co.finalproject.farm.app.admin.service.impl.BannerMapper;
import co.finalproject.farm.app.community.service.CommPagingVO;
import co.finalproject.farm.app.community.service.CommunityVO;
import co.finalproject.farm.app.community.service.impl.CommunityMapper;
import co.finalproject.farm.app.education.service.EduPagingVO;
import co.finalproject.farm.app.education.service.impl.EducationMapper;
import co.finalproject.farm.app.intoTheFarm.service.IntoTheFarmVO;
import co.finalproject.farm.app.intoTheFarm.service.impl.IntoTheFarmMapper;
import co.finalproject.farm.app.shop.service.OrderVO;
import co.finalproject.farm.app.shop.service.ShopVO;
import co.finalproject.farm.app.shop.service.impl.ShopMapper;
import co.finalproject.farm.app.user.service.UserVO;
import co.finalproject.farm.app.user.service.impl.UserMapper;
import co.finalproject.farm.common.FileRenamePolicy;
import co.finalproject.farm.common.Paging;

@Controller
public class AdminController {
	@Autowired UserMapper 		 userMapper;
	@Autowired BannerMapper 	 bannerMapper;
	@Autowired EducationMapper   educationMapper;
	@Autowired IntoTheFarmMapper intoFarmMapper;
	@Autowired ShopMapper        shopMapper;
	@Autowired CommunityMapper   communityMapper;

	// 메인페이지
	@GetMapping("/admin")
	public String adminMove(Model model, UserVO uvo, EduPagingVO evo, IntoTheFarmVO ivo, ShopVO svo, CommPagingVO cvo) {
		model.addAttribute("user", userMapper.getCount(uvo));
		model.addAttribute("edu", educationMapper.getCount(evo));
		model.addAttribute("intoFarm", intoFarmMapper.getCount(ivo));
		model.addAttribute("prod", shopMapper.getCount(svo));
		model.addAttribute("comm", communityMapper.getCount(cvo));
		return "adminTiles/admin/admin";
	}
	
	// 차트 - 요일별
	@RequestMapping("/weekChart")
	@ResponseBody
	public List<Map<String, Object>> weekChart() {
		return shopMapper.weekChart();
	}
			
	// 차트 - 월별 매출액
	@RequestMapping("/monthChart")
	@ResponseBody
	public List<Map<String, Object>> monthChart() {
		return shopMapper.monthChart();
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
	
	// 배너 관리 - 전체 조회
	@GetMapping("/adminBanner")
	public String adminBanner(BannerVO vo, HttpServletRequest request) {
		request.getSession().getServletContext().setAttribute("banner", bannerMapper.getListBanner(vo));
		return "adminTiles/admin/adminBanner";
	}
	
	// 배너 관리 - 배너 수정
	@RequestMapping("/adminBannerUpt")
	public String adminBannerUpt(BannerVO vo, HttpServletRequest req) throws Exception, IOException {
		MultipartFile uploadFile = vo.getUploadFile();
		String banner_filename = "";
		if (uploadFile != null && !uploadFile.isEmpty() && uploadFile.getSize() > 0) {
			String filename = uploadFile.getOriginalFilename();
			String path = req.getSession().getServletContext().getRealPath("/resources/images/banner");
			File rename = FileRenamePolicy.rename(new File(path, filename));
			uploadFile.transferTo(new File(path, rename.getName())); // 임시폴더에서 업로드 폴더로 이동
			banner_filename += '@' + rename.getName();
			vo.setBanner_filename(rename.getName());
		}
		bannerMapper.updateBanner(vo);
		return "redirect:/adminBanner";
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
	public String adminOrder(OrderVO vo, Paging paging, Model model) {
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
    	model.addAttribute("order", shopMapper.adminOrder(vo));
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