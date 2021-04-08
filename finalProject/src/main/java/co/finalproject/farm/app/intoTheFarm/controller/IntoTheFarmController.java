package co.finalproject.farm.app.intoTheFarm.controller;

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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import co.finalproject.farm.app.intoTheFarm.service.IntoTheFarmVO;
import co.finalproject.farm.app.intoTheFarm.service.impl.IntoTheFarmMapper;
import co.finalproject.farm.common.FileRenamePolicy;
import co.finalproject.farm.common.Paging;

@Controller
public class IntoTheFarmController {
	@Autowired IntoTheFarmMapper intoTheFarmMapper;
	
	Logger logger = LoggerFactory.getLogger(IntoTheFarmController.class);
	
	//전체조회
	@RequestMapping("/getFarmList")
	public String getFarmList(IntoTheFarmVO vo, Paging paging,  Model model) {
		
		//paging.setPageUnit(4); // 한 페이지에 표시되는 레코드 건 수
		//paging.setPageSize(5); // 표시되는 페이지 번호
		
		// 페이징
		
		/*
		 * if (vo.getPage() == null) { vo.setPage(1); } vo.setStart(paging.getFirst());
		 * vo.setEnd(paging.getLast());
		 * paging.setTotalRecord(intoTheFarmMapper.getCount(vo));
		 * model.addAttribute("paging", paging);
		 */
		  model.addAttribute("list", intoTheFarmMapper.getFarmList(vo));
		  
		return "intoFarm/intoTheFarm";
	}
	
	//단건조회
	@RequestMapping("/getSearchFarm")
	public String getSearchFarm(IntoTheFarmVO vo, Model model) {
		model.addAttribute("getlist",intoTheFarmMapper.getSearchFarm(vo));
		return "notiles/intoFarm/applyModal";
	}
	//등록
	@GetMapping("/insertFarm") //등록 페이지
	public String insertFarm(IntoTheFarmVO vo,Model model) {
		return "intoFarm/insertIntoFarm";
	}
	
	
	@PostMapping("/insertFarm") //등록
	public String insertFarmProc(IntoTheFarmVO vo, MultipartHttpServletRequest request) throws Exception, IOException {
		//파일 업로드
		List<MultipartFile> files = vo.getUploadFile();
		String filename1=""; 
		for(MultipartFile file : files) {
			
			if(file != null && !file.isEmpty() && ((MultipartFile) file).getSize() > 0) {
				filename1 = ((MultipartFile) file).getOriginalFilename();
				File rename = FileRenamePolicy.rename(new File("c:/upload/"+filename1));
				filename1 += '@'+rename.getName();
				file.transferTo(rename);
			}
		}
		vo.setInto_filename(filename1);
		intoTheFarmMapper.insertFarm(vo);
		return "redirect:/getFarmList";
		
		}
	
	//수정
	
	@GetMapping("/updateFarm") //수정 페이지
	public String updateFarm(IntoTheFarmVO vo, Model model) {
		model.addAttribute("upFarm", intoTheFarmMapper.getSearchFarm(vo));
		return "notiles/intoFarm/updateModal";
	}
	
	//ajax로 수정
	@PostMapping("/updateFarm") //수정
	public @ResponseBody String updateFarmProc(IntoTheFarmVO vo) {
		logger.debug(vo.toString());
		intoTheFarmMapper.updateFarm(vo);
		return "redirect:/getFarmList";
		
	}
	
	//ajax로 삭제
	@RequestMapping("/deleteFarm")
	public @ResponseBody String deleteFarm(IntoTheFarmVO vo) {
		logger.debug(vo.toString());
		intoTheFarmMapper.deleteFarm(vo);
		return "redirect:/getFarmList";
	}
}
//file 테이블 만들어서 스케쥴 걸어서.. y/n으로 