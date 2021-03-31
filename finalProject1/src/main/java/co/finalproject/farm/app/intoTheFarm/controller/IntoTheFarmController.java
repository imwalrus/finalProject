package co.finalproject.farm.app.intoTheFarm.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.JsonObject;

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
		model.addAttribute("list",intoTheFarmMapper.getSearchFarm(vo));
		return "";
	}
	//등록
	@GetMapping("/insertFarm") //등록 페이지
	public String insertFarm(IntoTheFarmVO vo,Model model) {
		return "insertIntoFarm";
	}
	
	@PostMapping("/insertFarm") //등록
	public String insertFarmProc(IntoTheFarmVO vo) {
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
