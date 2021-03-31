package co.finalproject.farm.app.notice.service.impl;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.finalproject.farm.app.notice.service.NoticePagingVO;
import co.finalproject.farm.app.notice.service.NoticeService;
import co.finalproject.farm.app.notice.service.NoticeVO;

@Service	
public class NoticeServiceimpl implements NoticeService	{
	
	@Autowired NoticeMapper dao;
	@Override
	public void insertNotices(NoticeVO vo) {
		dao.insertNotices(vo);
		
	}

	@Override
	public void updateNotices(NoticeVO vo) {
		dao.updateNotices(vo);
		
	}

	@Override
	public void deleteNotices(NoticeVO vo) {
		dao.deleteNotices(vo);
	}
	
	@Override
	public NoticeVO getSearchNotices(NoticeVO vo) {
		return dao.getSearchNotices(vo);
	}

	@Override
	public List<NoticeVO> getNotices(NoticeVO vo) {
		return dao.getNotices(vo);
	}
	
	@Override
	public int getCount(NoticePagingVO vo) {
		return dao.getCount(vo);
	}

	@Override
	public void updatereviewcnt(NoticeVO vo, HttpSession session) {
		long update_time = 0;
        if(session.getAttribute("update_time_"+vo.getNotice_no()) != null){                  
            update_time = (long)session.getAttribute("update_time_"+vo.getNotice_no());
        }
        long current_time = System.currentTimeMillis();
        if(current_time - update_time > 5){
            dao.updatereviewcnt(vo);
            session.setAttribute("update_time_"+vo.getNotice_no(), current_time);
            
        }
	}

}
