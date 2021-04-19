package co.finalproject.farm.app.shop.service.impl;

import java.util.List;
import java.util.Map;

import co.finalproject.farm.app.shop.service.CartVO;
import co.finalproject.farm.app.shop.service.OrderVO;
import co.finalproject.farm.app.shop.service.ShopVO;

public interface ShopMapper {
	// 페이징 건수(상품)
	public int getCount(ShopVO vo);
	
	// 페이징 건수(주문)
	public int getCountAdmin(OrderVO vo);
	
	// 리스트 · 검색 · 페이징
	public List<ShopVO> getListShop(ShopVO vo);

	// 총 개수
	public int allCount();

	// 카테고리 개수
	public List<ShopVO> cateCount(ShopVO vo);

	// 개별 상품 페이지
	public ShopVO getProduct(ShopVO vo);

	// 상품 관리 리스트
	public List<ShopVO> getListProd(ShopVO vo);

	// 상품 등록
	public void insertProduct(ShopVO vo);

	// 상품 수정
	public int updateProduct(ShopVO vo);

	// 상품 삭제
	public int deleteProduct(ShopVO vo);

	// 장바구니 페이지
	public List<CartVO> getCart(CartVO vo);

	// 장바구니 등록
	public void insertCart(CartVO vo);

	// 장바구니 수량 변경
	public int updateCart(CartVO vo);

	// 장바구니 삭제
	public int deleteCart(CartVO vo);

	// 장바구니 비우기
	public int deleteAllCart(CartVO vo);

	// 동일한 상품 체크
	public int cartCheck(CartVO vo);
	
	// 주문시 수량 변경
	public int productEditCount(OrderVO vo);
	
	// 재고 0일 경우 상태 품절 변경
	public int productEditCondition(ShopVO vo);
	
	// 주문 등록
	public void insertOrder(OrderVO vo);

	// 주문 상세등록
	public void insertOrderlist(OrderVO vo);
	
	// 주문 현황
	public List<OrderVO> adminOrder(OrderVO vo);

	// 요일별 차트
	public List<Map<String, Object>> weekChart();

	// 월별 판매량(차트)
	public List<Map<String, Object>> monthChart();
	
}
