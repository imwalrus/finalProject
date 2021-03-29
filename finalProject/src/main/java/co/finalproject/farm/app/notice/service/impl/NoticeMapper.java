package co.finalproject.farm.app.notice.service.impl;

import java.util.List;

import co.finalproject.farm.app.notice.service.NoticeVO;


public interface NoticeMapper {
	
	    //등록
		public void insertNotices(NoticeVO vo);
		
		//수정
		public void updateNotices(NoticeVO vo);
		
		//삭제
		public void deleteNotices(NoticeVO vo);
		
		//단건조회
		public NoticeVO getSearchNotices(NoticeVO vo);
		
		//전체조회
	    public List<NoticeVO> getNotices(NoticeVO vo);
	
}
