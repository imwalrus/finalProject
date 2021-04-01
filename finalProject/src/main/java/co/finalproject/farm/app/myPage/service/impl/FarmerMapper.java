package co.finalproject.farm.app.myPage.service.impl;

import java.util.List;

import co.finalproject.farm.app.myPage.service.FarmerVO;

public interface FarmerMapper {
	
	public List<FarmerVO> listFarmer();
	
	public int insertFarmer(FarmerVO vo);
	
	public int updateFarmer(FarmerVO vo);

}
