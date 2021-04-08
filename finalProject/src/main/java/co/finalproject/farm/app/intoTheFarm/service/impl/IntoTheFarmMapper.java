package co.finalproject.farm.app.intoTheFarm.service.impl;

import java.util.List;

import co.finalproject.farm.app.intoTheFarm.service.IntoTheFarmVO;

public interface IntoTheFarmMapper {
	// 건수
	public int getCount(IntoTheFarmVO vo);
	public List<IntoTheFarmVO> getFarmList(IntoTheFarmVO vo);
	public IntoTheFarmVO getSearchFarm(IntoTheFarmVO vo);
	public int insertFarm(IntoTheFarmVO vo);
	public int updateFarm(IntoTheFarmVO vo);
	public int deleteFarm(IntoTheFarmVO vo);
	
}
