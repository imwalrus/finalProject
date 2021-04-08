package co.finalproject.farm.app.myPage.service.impl;

import java.util.List;

import co.finalproject.farm.app.shop.service.OrderVO;

public interface OrderMapper {
	
	public List<OrderVO> getOrderList(OrderVO vo);
		
	public List<OrderVO> getOrder(OrderVO vo);
	
	public int insertOrder(OrderVO vo);
	
	public int updateOrder(OrderVO vo);
	
	public int deleteOrder(OrderVO vo);

	//판매
	public List<OrderVO> getSaleList();
}
