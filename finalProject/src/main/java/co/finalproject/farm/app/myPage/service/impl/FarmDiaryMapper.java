package co.finalproject.farm.app.myPage.service.impl;

import java.util.List;

import co.finalproject.farm.app.myPage.service.FarmDiaryVO;

public interface FarmDiaryMapper {
		
	//영농일지 작물선택화면
	public List<FarmDiaryVO> fDiaryCalendar();
	
	//영농일지 작물입력
	public int insertCrop(FarmDiaryVO vo);
	
	//작물, 아이디로 일기조회
	public List<FarmDiaryVO> getfDiary(FarmDiaryVO vo);
	
	//다이어리 입력
	public int insertFdiary(FarmDiaryVO vo);
	
	//fdiary_no로 조회
	public FarmDiaryVO diarySelect(FarmDiaryVO vo);
	
	//수정
	public int updateFdiary(FarmDiaryVO vo);
			
	//삭제
	public int deleteFdiary(FarmDiaryVO vo);
	
	//다이어리 전체리스트
	public List<FarmDiaryVO> mypageList1(FarmDiaryVO vo);

	//일지 입력 갯수 조회
	public List<FarmDiaryVO> countDiary(FarmDiaryVO vo);
}
