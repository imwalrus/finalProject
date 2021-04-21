package co.finalproject.farm.app.myPage.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import co.finalproject.farm.app.myPage.service.FarmDiaryVO;
import co.finalproject.farm.app.myPage.service.impl.FarmDiaryMapper;
import co.finalproject.farm.common.FileRenamePolicy;

@Controller
public class FarmDiaryController {

	@Autowired
	FarmDiaryMapper fdMapper;

	Logger logger = LoggerFactory.getLogger(FarmDiaryController.class);

//영농일지 첫화면, 캘린더 
	@RequestMapping("/fDiaryCalendar")
	public String fDiaryCalendar() {
		return "mypageTiles/mypage/fDiaryCalendar";
	}
	
//일자별 다이어리 입력갯수
		@RequestMapping("/countDiary")
		@ResponseBody
		public List<FarmDiaryVO> countDiary(FarmDiaryVO vo){
			return fdMapper.countDiary(vo);
		}
		

//날짜 클릭시 일기 호출
	@RequestMapping("getfDiary")
	public String getfDiary(Model model, @RequestParam String fdiary_day){
		model.addAttribute("fdiary_day", fdiary_day);
		return "notiles/mypage/getfDiary";
	}

//일기건당조회
	@RequestMapping("/ajaxgetfDiary")
	@ResponseBody
	public List<FarmDiaryVO> getfDiary(FarmDiaryVO vo) {
		return fdMapper.getfDiary(vo);
	}

//다이어리 입력폼
	@RequestMapping("/insertFdiary")
	public String insertFdiary(Model model, FarmDiaryVO vo) {
		model.addAttribute("croplist", fdMapper.fDiaryCalendar());
		return "mypageTiles/mypage/insertFdiary";
	}
	//등록처리
	@PostMapping("insertFdiary")
	public String insertFdiaryProc(FarmDiaryVO vo,MultipartHttpServletRequest request) throws Exception, IOException {
		// 파일 업로드
				MultipartFile file = vo.getUploadFile();
				String fdiary_filename = "";
				String path = request.getSession().getServletContext().getRealPath("/resources/images/mypage/");

				if (file != null && !file.isEmpty() && file.getSize() > 0) {
					String filename = file.getOriginalFilename();

					File rename = FileRenamePolicy.rename(new File(path, filename));
					fdiary_filename += rename.getName();
					file.transferTo(rename);// 임시폴더에서 업로드 폴더로 이동
				}
				vo.setFdiary_filename(fdiary_filename);
				
					
		 logger.debug(vo.toString());
		 fdMapper.insertFdiary(vo);
		return "redirect:fDiaryCalendar";

	}
	
//작물추가 폼
	@RequestMapping("/insertCrop")
	public String insertCrop() {
		return "notiles/mypage/insertCrop";
	}

	//작물추가 처리
	@PostMapping("insertCrop")
	public String insertCropProc(FarmDiaryVO vo) {
		fdMapper.insertCrop(vo);
		return "redirect:insertFdiary";
	}
	
	
	
// 수정폼으로(fdiary_no 조회)
@RequestMapping("/diarySelect")
public String diarySelect(Model model, FarmDiaryVO vo) {
	model.addAttribute("list", fdMapper.diarySelect(vo));
	return "mypageTiles/mypage/updateFdiary";
}
	
//수정처리	
@PostMapping("/updateFdiary")
public String updateFdiaryProc(FarmDiaryVO vo,MultipartHttpServletRequest request) throws Exception, IOException{
	
	// 파일 업로드
	MultipartFile file = vo.getUploadFile();
	String fdiary_filename = "";
	String path = request.getSession().getServletContext().getRealPath("/resources/images/mypage/");

	if (file != null && !file.isEmpty() && file.getSize() > 0) {
		String filename = file.getOriginalFilename();

		File rename = FileRenamePolicy.rename(new File(path, filename));
		fdiary_filename += rename.getName();
		file.transferTo(rename);// 임시폴더에서 업로드 폴더로 이동
	}
	vo.setFdiary_filename(fdiary_filename);

	logger.debug(vo.toString());
	fdMapper.updateFdiary(vo);
	return "redirect:fDiaryCalendar";
}
	
//삭제
@GetMapping("/deleteFdiary")
public String deleteFdiary(FarmDiaryVO vo) {
	fdMapper.deleteFdiary(vo);	
	return "redirect:fDiaryCalendar";
}




}
