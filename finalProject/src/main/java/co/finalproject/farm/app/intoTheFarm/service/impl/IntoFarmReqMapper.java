package co.finalproject.farm.app.intoTheFarm.service.impl;


import java.util.List;

import co.finalproject.farm.app.intoTheFarm.service.IntoFarmReqVO;

public interface IntoFarmReqMapper {
	public List<IntoFarmReqVO> getReqFarmList(IntoFarmReqVO vo);
	public IntoFarmReqVO getSearchReqFarm(IntoFarmReqVO vo);
	public int insertReqFarm(IntoFarmReqVO vo);
	public int updateReqFarm(IntoFarmReqVO vo);
	public int deleteReqFarm(IntoFarmReqVO vo);
	
}
