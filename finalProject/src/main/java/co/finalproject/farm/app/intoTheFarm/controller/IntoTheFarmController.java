package co.finalproject.farm.app.intoTheFarm.controller;

import java.io.File;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import co.finalproject.farm.app.intoTheFarm.service.IntoTheFarmVO;
import co.finalproject.farm.app.intoTheFarm.service.impl.IntoTheFarmMapper;
import co.finalproject.farm.app.user.service.UserService;
import co.finalproject.farm.app.user.service.UserVO;
import co.finalproject.farm.common.FileRenamePolicy;
import co.finalproject.farm.common.Paging;

@Controller
public class IntoTheFarmController {
	@Autowired
	IntoTheFarmMapper intoTheFarmMapper;
	
	@Autowired 
	UserService userService;
	
	Logger logger = LoggerFactory.getLogger(IntoTheFarmController.class);
	
	@InitBinder
	protected void initBinder0(WebDataBinder binder){
	DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat,true));//true null값 허용, false null값 불허
	}


	// 전체조회
	
	  @RequestMapping("/getFarmList") public String getFarmList(IntoTheFarmVO vo,
	  Paging paging, UserVO uservo, Model model, HttpSession session) {
	  
	  paging.setPageUnit(4); // 한 페이지에 표시되는 레코드 건 수 paging.setPageSize(5); // 표시되는
	  //페이지 번호
	  
	  // 페이징
	  
	 if (vo.getPage() == null) {
		 vo.setPage(1); 
		 } vo.setStart(paging.getFirst());
	  vo.setEnd(paging.getLast());
	  
	  paging.setTotalRecord(intoTheFarmMapper.getCount(vo));
	  
	  model.addAttribute("paging", paging); 
	  
	  // 로그인 아이디 가져오기 
	  String id = (String)session.getAttribute("user_id"); 
	  vo.setUser_id(id); 
	  uservo.setUser_id(id);
	  model.addAttribute("uservo", userService.loginCheck(uservo));
	  model.addAttribute("list", intoTheFarmMapper.getFarmList(vo));
	  
	  return "intoFarm/intoTheFarm"; 
	  }
	 
	//test
	/*
	 * @RequestMapping("/getFarmList") public String getFarmList() { return
	 * "intoFarm/calender"; }
	 */
	
	
	// 단건조회
	@RequestMapping("/getSearchFarm")
	public String getSearchFarm(IntoTheFarmVO vo, Model model) {

		model.addAttribute("getlist", intoTheFarmMapper.getSearchFarm(vo));
		return "notiles/intoFarm/applyModal";
	}

	// 등록
	@GetMapping("/insertFarm") // 등록 페이지
	public String insertFarm(IntoTheFarmVO vo, Model model) {
		return "intoFarm/insertIntoFarm";
	}

	//date null값 허용
	@InitBinder
    public void initBinder(WebDataBinder binder) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        binder.registerCustomEditor(java.util.Date.class,	
                new CustomDateEditor(dateFormat, false));
    }

		
	@PostMapping("/insertFarm") // 등록
	public String insertFarmProc(IntoTheFarmVO vo, HttpServletRequest req) throws Exception, IOException {
		// 파일 업로드
		MultipartFile[] files = vo.getUploadFile();
		for (MultipartFile file : files) {

			if (file != null && !file.isEmpty() && file.getSize() > 0) {
				String orgFile = file.getOriginalFilename();
				String path = req.getSession().getServletContext().getRealPath("image");

				File rename = FileRenamePolicy.rename(new File(path, orgFile));
				file.transferTo(new File(path, rename.getName()));
				// filename1 += '@'+rename.getName();
				vo.setInto_filename(rename.getName());
			}
		}
		intoTheFarmMapper.insertFarm(vo);
		return "redirect:/getFarmList";

	}

	// 수정

	@GetMapping("/updateFarm") // 수정 페이지
	public String updateFarm(IntoTheFarmVO vo, Model model) {
		model.addAttribute("upFarm", intoTheFarmMapper.getSearchFarm(vo));
		return "notiles/intoFarm/updateModal";
	}

	// ajax로 수정
	@PostMapping("/updateFarm") // 수정
	public @ResponseBody String updateFarmProc(IntoTheFarmVO vo) {
		logger.debug(vo.toString());
		intoTheFarmMapper.updateFarm(vo);
		return "redirect:/getFarmList";

	}

	// ajax로 삭제
	@RequestMapping("/deleteFarm")
	public @ResponseBody String deleteFarm(IntoTheFarmVO vo) {
		logger.debug(vo.toString());
		intoTheFarmMapper.deleteFarm(vo);
		return "redirect:/getFarmList";
	}
	
	// 체험 종료
	@RequestMapping("/updateFarmExit")
	public @ResponseBody String updateFarmExit(IntoTheFarmVO vo, Model model) {
		intoTheFarmMapper.updateFarmExit(vo);
		return "redirect:/getFarmList";
	}
	
	
}
