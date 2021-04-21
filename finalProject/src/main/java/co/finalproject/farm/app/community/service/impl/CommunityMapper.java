package co.finalproject.farm.app.community.service.impl;

import java.util.List;

import co.finalproject.farm.app.community.service.CommPagingVO;
import co.finalproject.farm.app.community.service.CommunityReplyVO;
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
  	
    // 조회 증가
    public void updatereviewcnt(CommunityVO vo);
	
    //댓글 전체조회
    public List<CommunityReplyVO> getReplyList(CommunityReplyVO vo); 
    
    //댓글 등록
    public void insertReply(CommunityReplyVO vo);
    
    //댓글 수정
    public int updateReply(CommunityReplyVO vo);
    
    //댓글 삭제
    public void deleteReply(CommunityReplyVO vo);

}
