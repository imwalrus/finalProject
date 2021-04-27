package co.finalproject.farm.app.myPage.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import co.finalproject.farm.app.myPage.service.FarmDiaryVO;
import co.finalproject.farm.app.myPage.service.FarmVO;
import co.finalproject.farm.app.myPage.service.impl.FarmDiaryMapper;
import co.finalproject.farm.app.myPage.service.impl.FarmMapper;
import co.finalproject.farm.app.notice.service.NoticeVO;
import co.finalproject.farm.common.FileRenamePolicy;

@Controller
public class FarmController {

	@Autowired
	FarmMapper farmMapper;

	Logger logger = LoggerFactory.getLogger(FarmController.class);

//전체조회
	@RequestMapping("/getFarmsList")
	public String getFarmList(Model model) {
		model.addAttribute("farmlist", farmMapper.getFarmList());
		return "mypageTiles/mypage/getFarmsList";
	}

//전체조회(id별)
	@RequestMapping("/getFarmsListofUser")
	public String getFarmsListofUser(Model model,HttpSession session) {
		String user_id = (String) session.getAttribute("user_id");
		model.addAttribute("farmlist", farmMapper.getFarmsListofUser(user_id));
		return "mypageTiles/mypage/getFarmsList";
		
	}
	
//단건조회
		@RequestMapping("/getFarms")
		public String getFarm(Model model, FarmVO vo) {
			model.addAttribute("farm", farmMapper.getFarm(vo));		
			return "notiles/mypage/getFarms";
		}

//등록폼
	@RequestMapping("/insertFarms")
	public String insertFarm(Model model) {
		return "notiles/mypage/insertFarms";
	}

//등록처리
	@PostMapping("/insertFarms")
	public String insertFarmProc(FarmVO vo, MultipartHttpServletRequest request) throws Exception,IOException{
		//파일 업로드
		MultipartFile file = vo.getUploadFile();
		String farm_filename="";
		String path = request.getSession().getServletContext().getRealPath("/resources/images/mypage/");
		
		if(file != null && !file.isEmpty() &&  file.getSize() > 0) {
			String filename = file.getOriginalFilename();
			
			File rename = FileRenamePolicy.rename(new File(path, filename));
			farm_filename += rename.getName();
			file.transferTo(rename);//임시폴더에서 업로드 폴더로 이동
		}
		vo.setFarm_filename(farm_filename);
			
		logger.debug(vo.toString());
		farmMapper.insertFarm(vo);
		return "redirect:getFarmsList";

	}

//수정
	// 수정폼
	@RequestMapping("/updateFarms")
	public String updateFarm(Model model,FarmVO vo) {
		model.addAttribute("ufarm", farmMapper.getFarm(vo));
		return "notiles/mypage/updateFarms";
	}

	// 수정처리
	@PostMapping("/updateFarms")
	public String updateFarmProc(FarmVO vo){
		logger.debug(vo.toString());
		farmMapper.updateFarm(vo);
		return "mypageTiles/mypage/myIntoList";
	}

//삭제
	@GetMapping("/deleteFarms")
	public String deleteFarm(FarmVO vo) {
		farmMapper.deleteFarm(vo);

		return "mypageTiles/mypage/myIntoList";
	}


}
