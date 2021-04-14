package co.finalproject.farm.app.community.service;

import java.util.List;

import javax.servlet.http.HttpSession;

public interface CommunityService {

	//등록
    public void insertComm(CommunityVO vo);

    //수정
    public void updateComm(CommunityVO vo);

    //삭제
    public void deleteComm(CommunityVO vo);

    //단건조회
    public CommunityVO getSchComm(CommunityVO vo);

    //전체조회
    public List<CommunityVO> getComm(CommunityVO vo);
    
    //건수
  	public int getCount(CommPagingVO vo);
  	
    // 조회 증가
    public void updatereviewcnt(CommunityVO vo, HttpSession session);

}
