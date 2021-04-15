package co.finalproject.farm.app.myPage.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import co.finalproject.farm.app.myPage.service.FarmDiaryVO;
import co.finalproject.farm.app.myPage.service.impl.FarmDiaryMapper;
import co.finalproject.farm.common.FileRenamePolicy;

@Controller
public class FarmDiaryController {

	@Autowired FarmDiaryMapper fdMapper;
	
	Logger logger = LoggerFactory.getLogger(FarmDiaryController.class);
	

//영농일지 첫화면, 캘린더 
		@RequestMapping("/fDiaryCalendar")
		public String fDiaryCalendar(Model model,FarmDiaryVO vo) {
			model.addAttribute("list", fdMapper.fDiaryCalendar());
			return "mypageTiles/mypage/fDiaryCalendar";
		}
	
//날짜 클릭시 일기 호출
	@RequestMapping("getfDiary")
	public String getfDiary(Model model,@RequestParam String fdiary_day) {
		model.addAttribute("fdiary_day", fdiary_day);
		return "notiles/mypage/getfDiary";
	}
	
//일기건당조회
	@RequestMapping("/ajaxgetfDiary")
	@ResponseBody
	public List<FarmDiaryVO> getfDiary(FarmDiaryVO vo){
		return fdMapper.getfDiary(vo);
	}

//다이어리 입력폼
	@RequestMapping("/insertFdiary")
	public String insertFdiary() {
		return "notiles/mypage/insertFdiary";
	}
	
	@PostMapping("insertFdiary")
	public String insertFdiaryProc(FarmDiaryVO vo,MultipartHttpServletRequest request) throws Exception,IOException {
		//파일 업로드
				MultipartFile file = vo.getUploadFile();
				String fdiary_filename="";
					
					if(file != null && !file.isEmpty() &&  file.getSize() > 0) {
						String filename = file.getOriginalFilename();

						File rename = FileRenamePolicy.rename(new File("C:\\upload", filename));
						fdiary_filename += rename.getName();
						file.transferTo(rename);//임시폴더에서 업로드 폴더로 이동
					}
				vo.setFdiary_filename(fdiary_filename);
		
		logger.debug(vo.toString());		
		fdMapper.insertFdiary(vo);
		return "mypageTiles/mypage/fDiaryCalendar";
		
	}
	

	
}
