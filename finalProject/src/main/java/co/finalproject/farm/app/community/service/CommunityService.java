package co.finalproject.farm.app.community.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.http.HttpRequest;
import org.springframework.web.bind.annotation.RequestParam;

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
  	
    //조회 증가
    public void updatereviewcnt(CommunityVO vo, HttpSession session);
    
 	//이전글
  	public CommunityVO getPreDocNum(CommunityVO vo);
  	
  	//다음글
  	public CommunityVO getNextDocNum(CommunityVO vo);
  	
    //페이징 계산
  	public int getPageNum(CommunityVO vo); 
    
    //댓글 전체조회
    public List<CommunityReplyVO> getReplyList(CommunityReplyVO vo); 
    
    //댓글 등록
    public void insertReply(CommunityReplyVO vo);
    
    //댓글 수정
    public int updateReply(CommunityReplyVO vo);
    
    //댓글 삭제
    public void deleteReply(CommunityReplyVO vo);
    
    //댓글 전체 삭제
    public int deleteReplyAll(CommunityReplyVO vo);

}
