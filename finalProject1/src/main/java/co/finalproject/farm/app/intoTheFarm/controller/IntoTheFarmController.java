package co.finalproject.farm.app.intoTheFarm.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import co.finalproject.farm.app.intoTheFarm.service.IntoTheFarmVO;
import co.finalproject.farm.app.intoTheFarm.service.impl.IntoTheFarmMapper;

@Controller
public class IntoTheFarmController {
	@Autowired IntoTheFarmMapper intoTheFarmMapper;
	
	
	//전체조회
	@RequestMapping("/getFarmList")
	public String getFarmList(IntoTheFarmVO vo, Model model) {
		model.addAttribute("list", intoTheFarmMapper.getFarmList(vo));
		System.out.println("list");
		return "intoTheFarm";
	}
	
	//단건조회
	@RequestMapping("/getSearchFarm")
	public String getSearchFarm(IntoTheFarmVO vo, Model model) {
		model.addAttribute("getlist",intoTheFarmMapper.getSearchFarm(vo));
		return "applyModal";
	}
	//등록
	@GetMapping("/insertFarm") //등록 페이지
	public String insertFarm(IntoTheFarmVO vo,Model model) {
		return "insertIntoFarm";
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
	
	//삭제
	@RequestMapping("/deleteFarm")
	public String deleteFarm(IntoTheFarmVO vo) {
		intoTheFarmMapper.updateFarm(vo);
		return "";
	}
}
//file 테이블 만들어서 스케쥴 걸어서.. y/n으로 