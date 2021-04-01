package co.finalproject.farm.app.shop.service.impl;

import java.util.List;

import co.finalproject.farm.app.shop.service.ShopVO;

public interface ShopMapper {
	// 건수
	public int getCount(ShopVO vo);

	// 리스트 · 검색 · 페이징
	public List<ShopVO> getListShop(ShopVO vo);

	// 총 개수
	public int allCount();

	// 카테고리 개수
	public List<ShopVO> cateCount(ShopVO vo);

	// 개별 상품 페이지
	public ShopVO getProduct(ShopVO vo);

	// 상품 등록
	public void insertProduct(ShopVO vo);

	// 상품 수정
	public int updateProduct(ShopVO vo);

	// 상품 삭제
	public int deleteProduct(ShopVO vo);

}
