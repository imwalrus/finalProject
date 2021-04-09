package co.finalproject.farm.app.notice.service;

import java.util.List;

import javax.servlet.http.HttpSession;


public interface NoticeService {
	
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
    
    //건수
  	public int getCount(NoticePagingVO vo);
  	
  	//조회수 올리기
	public void updatereviewcnt(NoticeVO vo, HttpSession session);
    
}
