package co.finalproject.farm.app.intoTheFarm.service.impl;

import java.util.List;

import co.finalproject.farm.app.intoTheFarm.service.IntoTheFarmVO;

public interface IntoTheFarmMapper {
	// 건수
	public int getCount(IntoTheFarmVO vo);
	public List<IntoTheFarmVO> getFarmList(IntoTheFarmVO vo);
	public IntoTheFarmVO getSearchFarm(IntoTheFarmVO vo);
	public int insertFarm(IntoTheFarmVO vo);
	public int togetEntry(IntoTheFarmVO vo); //유저가 체험신청시 남은인원수 업데이트
	public int updateFarm(IntoTheFarmVO vo);
	public int deleteFarm(IntoTheFarmVO vo);
	public int updateFarmExit(IntoTheFarmVO vo);
	
}

