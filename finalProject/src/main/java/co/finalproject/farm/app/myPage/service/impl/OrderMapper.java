package co.finalproject.farm.app.myPage.service.impl;

import java.util.List;

import co.finalproject.farm.app.myPage.service.OrderListVO;
import co.finalproject.farm.app.myPage.service.OrderVO;

public interface OrderMapper {
	
	public List<OrderVO> getOrderList();
	
	public OrderVO getOrder(OrderVO vo);
	
	public int insertOrder(OrderVO vo);
	
	public int updateOrder(OrderVO vo);
	
	public int deleteOrder(OrderVO vo);

	//판매
	public List<OrderListVO> getSaleList();
}
