package co.finalproject.farm.app.myPage.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import co.finalproject.farm.app.myPage.service.impl.CropMapper;

@Controller
public class CropController {
	
	@Autowired CropMapper cropMapper;
	
	@RequestMapping("/getCropList")
	public String getCropList(Model model) {
		
		model.addAttribute("croplist", cropMapper.getCropList());
		
		return "mypage/getCropList";
	}

}
