package com.company.temp;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class TestController {
	// GET, 커맨드 객체(VO)
	@GetMapping("/getTest1")
	public String getTest1(TestVO vo) {
		System.out.println("GET : " + vo);
		return "home";
	}
	
	// POST
	@PostMapping("/getTest2")
	public String getTest2(TestVO vo) {
		System.out.println("POST : " + vo);
		return "home";
	}
	
	// REQUEST (GET or POST)
	@RequestMapping("/getTest3")
	public String getTest3(TestVO vo) {
		System.out.println("REQUEST : " + vo);
		return "home";
	}
	
	// 파라미터
	@RequestMapping("/getTest4")
	public String getTest4(@RequestParam String firstName
						 , @RequestParam int salary) {
		System.out.println("firstName : " + firstName + " salary : " + salary);
		return "home";
	}	
	
	// 파라미터 (배열) - for
	@RequestMapping("/getTest5")
	public String getTest5(@RequestParam("hobby") String[] hobbies) {
		for(int i = 0; i < hobbies.length; i++) {
			System.out.println("hobby : " + hobbies[i]);
		}
		return "home";
	}
	
	// 파라미터 (배열) - asList
	@RequestMapping("/getTest6")
	public String getTest6(@RequestParam("hobby") String[] hobbies) {
		System.out.println("hobby : " + Arrays.asList(hobbies));
		return "home";
	}
	
	// JSON
	@RequestMapping("/getTest7")
	public String getTest7(@RequestBody List<Map> vo) {
		System.out.println(vo);
		return "home";
	}
	
	// ex : Kim/5000
	@RequestMapping("/getTest7/{firstName}/{salary}")
	public String getTest7(@PathVariable String firstName
						 , @PathVariable int salary) {
		System.out.println("firstName : " + firstName + " salary : " + salary);
		return "home";
	}
	
	// ex : Kim/5000 (Model)
	@RequestMapping("/getTest8/{firstName}/{salary}")
	public String getTest8(@PathVariable          String firstName
						 , @PathVariable 		  String salary
						 , @ModelAttribute("tvo") TestVO vo
						 			   			, Model model) {
		vo.setFirstName(firstName);
		vo.setSalary(salary);
		System.out.println(vo);
		model.addAttribute("firstName", firstName);
		return "test";
	}
	
	// ex : Kim/5000 (Model)
	@RequestMapping("/getTest9/{firstName}/{salary}")
	public ModelAndView getTest9(@PathVariable String firstName
						 , @PathVariable String salary
						 , @ModelAttribute("tvo") TestVO vo) {
		vo.setFirstName(firstName);
		vo.setSalary(salary);
//		ModelAndView mv = new ModelAndView();
//		mv.addObject("firstName", firstName);
//		mv.setViewName("test");
		return new ModelAndView("test", "firstName", firstName);
	}
	
	// ex : Kim/5000 (JSON)
	@RequestMapping("/getTest10/{firstName}/{salary}")
	@ResponseBody
	public TestVO getTest10(@PathVariable String firstName
  						  , @PathVariable String salary
						 			    , TestVO vo) {
		vo.setFirstName(firstName);
		vo.setSalary(salary);
		return vo;
	}
	
	// ex : Kim/5000 (JSON & List)
	@RequestMapping("/getTest11")
	@ResponseBody
	public List<Map> getTest11() {
		List list = new ArrayList<>();
		Map<String, String> map = new HashMap<>();
		map.put("name", "lee");
		map.put("sal", "1000");
		list.add(map);
		
		map = new HashMap<>();
		map.put("name", "park");
		map.put("sal", "1500");
		list.add(map);
		return list;
	}
}
