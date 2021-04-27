package co.finalproject.farm.app.myPage.controller;

import java.io.File;
import java.io.IOError;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import co.finalproject.farm.app.myPage.service.FarmVO;
import co.finalproject.farm.app.myPage.service.FarmerVO;
import co.finalproject.farm.app.myPage.service.impl.FarmerMapper;
import co.finalproject.farm.common.FileRenamePolicy;

@Controller
public class FarmerController {
	
	@Autowired FarmerMapper farMapper;
	
	Logger logger = LoggerFactory.getLogger(FarmerController.class);
	
	//농업인 권한신청 - 페이지 이동
	@RequestMapping("/getFarmerlist")
	public String getFarmerlist() {
		return "mypageTiles/mypage/insertFarmer";
	}
	
	//농업인 권한 신청 조회
	@RequestMapping("/ajaxgetFarmerlist")
	@ResponseBody
	public List<FarmerVO> getFarmerlist(FarmerVO vo){
		return farMapper.getFarmerlist(vo);
	}
		
	//농업인 신청하기 (insert)
	@PostMapping("insertFarmer")
	public String insertFarmerProc(FarmerVO vo,MultipartHttpServletRequest request) throws Exception,IOException {
		//파일 업로드
		MultipartFile file = vo.getUploadFile();
		String farmer_filename="";
		String path = request.getSession().getServletContext().getRealPath("/resources/images/mypage/");
			
			if(file != null && !file.isEmpty() &&  file.getSize() > 0) {
				String filename = file.getOriginalFilename();

				File rename = FileRenamePolicy.rename(new File(path, filename));
				farmer_filename += rename.getName();
				file.transferTo(rename);//임시폴더에서 업로드 폴더로 이동
			}
		vo.setFarmer_filename(farmer_filename);
		
		farMapper.insertFarmer(vo);
		return "mypageTiles/mypage/insertFarmerWait";
	}
	
	
	//승인 거절시 기존신청건 삭제
		@GetMapping("/deleteFarmer")
		public String deleteFarmer(FarmerVO vo) {
			farMapper.deleteFarmer(vo);

			return "redirect:/getFarmerlist";
		}

}
