package co.finalproject.farm.app.myPage.service.impl;

import java.util.List;

import co.finalproject.farm.app.intoTheFarm.service.IntoTheFarmVO;

public interface IntoFarmMapper {
	
	//농업인 농촌속으로 관리 내역
	public List<IntoTheFarmVO> farmerIntoList(IntoTheFarmVO vo);
	
	//봉사활동확인서 양식 open
	public String bongsaFile();
	
	//농촌속으로 신청 명단 불러오기
	//public List<IntoTheFarmVO> intoUserList(IntoTheFarmVO vo);
	public List<IntoTheFarmVO> intoUserList(IntoTheFarmVO vo);
	
	//신청명단삭제
	public int deleteUserList(IntoTheFarmVO vo);
	
	//나의 신청 내역
	public List<IntoTheFarmVO> myIntoList(IntoTheFarmVO vo);

}
