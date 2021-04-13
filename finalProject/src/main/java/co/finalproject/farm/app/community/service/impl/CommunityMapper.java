package co.finalproject.farm.app.community.service.impl;

import java.util.List;

import javax.servlet.http.HttpSession;

import co.finalproject.farm.app.community.service.CommPagingVO;
import co.finalproject.farm.app.community.service.CommunityVO;
public interface CommunityMapper {
	
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
  	
    // 전체 건수(관리자 페이지서 활용)
	public int getCount();
  	
    // 조회 증가
    public void updatereviewcnt(CommunityVO vo);
	
}
