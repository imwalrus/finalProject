package co.finalproject.farm.app.admin.service.impl;

import java.util.List;

import co.finalproject.farm.app.admin.service.BannerVO;

public interface BannerMapper {
	// 리스트
	public List<BannerVO> getListBanner(BannerVO vo);
	
	// 단건
	public BannerVO getBanner(BannerVO vo);
	
	// 수정
	public int updateBanner(BannerVO vo);
}
