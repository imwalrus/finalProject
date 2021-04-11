package co.finalproject.farm.app.myPage.service.impl;

import java.util.List;

import co.finalproject.farm.app.shop.service.OrderVO;

public interface OrderMapper {
	
	//구매내역
	public List<OrderVO> getOrderList(OrderVO vo);
	//상세내역
	public List<OrderVO> getOrder(OrderVO vo);
	
	public int insertOrder(OrderVO vo);
	
	public int updateOrder(OrderVO vo);
	
	public int deleteOrder(OrderVO vo);

	//판매내역
	public List<OrderVO> getSaleList(OrderVO vo);
	
}
