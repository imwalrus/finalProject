package co.finalproject.farm.app.notice.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import co.finalproject.farm.app.notice.service.NoticeService;
import co.finalproject.farm.app.notice.service.NoticeVO;

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

}
