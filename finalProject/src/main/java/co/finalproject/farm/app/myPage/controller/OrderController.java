package co.finalproject.farm.app.myPage.controller;


import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import co.finalproject.farm.app.shop.service.OrderVO;
import oracle.jdbc.proxy.annotation.Post;
import co.finalproject.farm.app.myPage.service.impl.OrderMapper;

@Controller
public class OrderController {
	
	@Autowired OrderMapper orderMapper;
	
	Logger logger = LoggerFactory.getLogger(OrderController.class);

//구매내역 뷰페이시 이동
	@RequestMapping("/getOrderList")
	public String getOrderList(){
		return "mypageTiles/mypage/getOrderList";
	}
	
//아작스로 리스트 조회
	@RequestMapping("/ajaxgetOrderList")
	@ResponseBody
	public List<OrderVO> getOrderlist(OrderVO vo){
		return orderMapper.getOrderList(vo);
	}

//상세내역 뷰페이지 이동
	@RequestMapping("/getOrder")
	public String getOrder() {
		return "notiles/mypage/getOrder";
	}
		
// 주문상세내역 조회
	@RequestMapping("/ajaxgetOrder")
	@ResponseBody
	public List<OrderVO> getOrder(OrderVO vo){
		return orderMapper.getOrder(vo);
		
	}
//판매내역 뷰페이지 이동
	@RequestMapping("/getSaleList")
	public String getSaleList() {
		return "mypageTiles/mypage/getSaleList";
	}
	
//판매내역조회
	@RequestMapping("/ajaxgetSaleList")
	@ResponseBody
	public List<OrderVO> getSaleList(OrderVO vo){		
		return orderMapper.getSaleList(vo);
	}

//수정 - 송장번호, 주문상태
	
	
	//수정폼
	@RequestMapping("/updateOrder")
	public String updateOrder(OrderVO vo) {
		return "notiles/mypage/updateOrder";
	}
	
	@PostMapping("/updateOrder")
	public String updateOrderProc(OrderVO vo) {
		orderMapper.updateOrder(vo);
		return "redirect:getSaleList";
	}


	
}
