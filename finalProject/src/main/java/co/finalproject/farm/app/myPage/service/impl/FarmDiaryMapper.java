package co.finalproject.farm.app.myPage.service.impl;

import java.util.List;

import co.finalproject.farm.app.myPage.service.FarmDiaryVO;

public interface FarmDiaryMapper {
	
	//영농일지 작물선택화면
	public List<FarmDiaryVO> fDiaryCalendar();
	
	//작물, 아이디로 일기조회
	public List<FarmDiaryVO> getfDiary(FarmDiaryVO vo);
	
	//다이어리 입력
	public int insertFdiary(FarmDiaryVO vo);
		
	//작물조회
	public List<FarmDiaryVO> cropList();

}
