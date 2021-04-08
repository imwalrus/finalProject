package co.finalproject.farm.app.myPage.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import co.finalproject.farm.app.myPage.service.OrderListVO;
import co.finalproject.farm.app.myPage.service.OrderVO;
import co.finalproject.farm.app.myPage.service.impl.OrderMapper;

@Controller
public class OrderController {
	
	@Autowired OrderMapper orderMapper;
	
	Logger logger = LoggerFactory.getLogger(OrderController.class);
	
//전체조회
	@RequestMapping("/getOrderList")
	public String getOrderList(Model model) {
		model.addAttribute("list", orderMapper.getOrderList());
		return "mypage/getOrderList";
	}
	
//단건조회
	@RequestMapping("/getOrder")
	public String getOrder(Model model, OrderVO vo) {
		model.addAttribute("olist", orderMapper.getOrder(vo));
		return "notiles/mypage/getOrder";
		
	}
	
	
//판매내역조회
	@RequestMapping("/getSaleList")
	public String getSaleList(Model model, OrderListVO vo) {
		model.addAttribute("sale", orderMapper.getSaleList(vo));
		return "mypage/getSaleList";
	}


	
}
