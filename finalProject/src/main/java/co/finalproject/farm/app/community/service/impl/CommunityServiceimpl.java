package co.finalproject.farm.app.community.service.impl;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import co.finalproject.farm.app.community.service.CommPagingVO;
import co.finalproject.farm.app.community.service.CommunityReplyVO;
import co.finalproject.farm.app.community.service.CommunityService;
import co.finalproject.farm.app.community.service.CommunityVO;

@Service
public class CommunityServiceimpl implements CommunityService {
	
	@Autowired CommunityMapper dao;

	@Override
	public void insertComm(CommunityVO vo) {
		dao.insertComm(vo);
		
	}

	@Override
	public void updateComm(CommunityVO vo) {
		dao.updateComm(vo);
		
	}

	@Override
	public void deleteComm(CommunityVO vo) {
		dao.deleteComm(vo);
		
	}

	@Override
	public CommunityVO getSchComm(CommunityVO vo) {
		
		return dao.getSchComm(vo);
	}

	@Override
	public List<CommunityVO> getComm(CommunityVO vo) {
	
		return dao.getComm(vo);
	}

	@Override
	public int getCount(CommPagingVO vo) {
		
		return dao.getCount(vo);
	}

	@Override
	public void updatereviewcnt(CommunityVO vo, HttpSession session) {
		long update_time = 0;
        if(session.getAttribute("update_time_"+vo.getComm_no()) != null){                  
            update_time = (long)session.getAttribute("update_time_"+vo.getComm_no());
        }
        long current_time = System.currentTimeMillis();
        if(current_time - update_time > 5){
            dao.updatereviewcnt(vo);
            session.setAttribute("update_time_"+vo.getComm_no(), current_time);
            
        }
	}

	@Override
	public List<CommunityReplyVO> getReplyList(CommunityReplyVO vo) {
		
		return dao.getReplyList(vo);
	}

	@Override
	public void insertReply(CommunityReplyVO vo) {
		dao.insertReply(vo);
		
	}

	@Override
	public int updateReply(CommunityReplyVO vo) {
		return dao.updateReply(vo);
		
	}

	@Override
	public void deleteReply(CommunityReplyVO vo) {
		dao.deleteReply(vo);
		
	}

	@Override
	public int deleteReplyAll(CommunityReplyVO vo) {
		
		return dao.deleteReplyAll(vo);
	}

	@Override
	public CommunityVO getPreDocNum(CommunityVO vo) {
		
		return dao.getPreDocNum(vo);
	}

	@Override
	public CommunityVO getNextDocNum(CommunityVO vo) {
		
		return dao.getNextDocNum(vo);
	}

	@Override
	public int getPageNum(CommunityVO vo) {
		
		return dao.getPageNum(vo);
		
	}

}
