package co.finalproject.farm.app.myPage.controller;

import java.io.File;
import java.io.IOError;
import java.io.IOException;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
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
	
//전체조회
	@RequestMapping("/listFarmer")
	public String listFarm(Model model) {
		model.addAttribute("farmerlist" , farMapper.listFarmer());
		return "#";
	}
	
//등록
	
	@GetMapping("/insertFarmer")
	public String insertFarmer(FarmerVO vo,Model model) {
		return "mypageTiles/mypage/insertFarmer";
	}
	
	@PostMapping("insertFarmer")
	public String insertFarmerProc(FarmerVO vo,MultipartHttpServletRequest request) throws Exception,IOException {
		//파일 업로드
		MultipartFile file = vo.getUploadFile();
		String farmer_filename="";
			
			if(file != null && !file.isEmpty() &&  file.getSize() > 0) {
				String filename = file.getOriginalFilename();

				File rename = FileRenamePolicy.rename(new File("C:\\upload", filename));
				farmer_filename += rename.getName();
				file.transferTo(rename);//임시폴더에서 업로드 폴더로 이동
			}
		vo.setFarmer_filename(farmer_filename);
		
		farMapper.insertFarmer(vo);
		return "mypage/insertFarmerWait";
	}
	
//수정
	// 수정폼
	@RequestMapping("/updateFarmer")
	public String updateFarm(FarmVO vo) {
		return "#";
	}

	// 수정처리
	@PostMapping("/updateFarmer")
	public String updateFarmerProc(FarmerVO vo) {
		logger.debug(vo.toString());
		farMapper.updateFarmer(vo);
		return "#";
	}

	

}
