package co.finalproject.farm.app.myPage.service.impl;

import java.util.List;

import co.finalproject.farm.app.myPage.service.CropVO;

public interface CropMapper {
	
	public List<CropVO> getCropList();
	
	public CropVO getCrop(CropVO vo);
	
	public int insertCrop(CropVO vo);
	
}
