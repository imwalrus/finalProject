package co.finalproject.farm.app.myPage.service.impl;

import java.util.List;

import co.finalproject.farm.app.myPage.service.FarmVO;

public interface FarmMapper {

	public List<FarmVO> getFarmList();
	
	public FarmVO getFarm(FarmVO vo);
	
	public int insertFarm(FarmVO vo);
	
	public int updateFarm(FarmVO vo);
	
	public int deleteFarm(FarmVO vo);
	
}
