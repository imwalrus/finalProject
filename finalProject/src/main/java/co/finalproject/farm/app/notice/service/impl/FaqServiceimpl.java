package co.finalproject.farm.app.notice.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.finalproject.farm.app.notice.service.FaqPagingVO;
import co.finalproject.farm.app.notice.service.FaqService;
import co.finalproject.farm.app.notice.service.FaqVO;

@Service	
public class FaqServiceimpl implements FaqService	{
	
	@Autowired FaqMapper dao;
	@Override
	public void insertFaq(FaqVO vo) {
		dao.insertFaq(vo);
		
	}

	@Override
	public void updateFaq(FaqVO vo) {
		dao.updateFaq(vo);
		
	}

	@Override
	public void deleteFaq(FaqVO vo) {
		dao.deleteFaq(vo);
	}
	
	@Override
	public FaqVO getSearchFaq(FaqVO vo) {
		return dao.getSearchFaq(vo);
	}

	@Override
	public List<FaqVO> getFaq(FaqVO vo) {
		return dao.getFaq(vo);
	}
	
	@Override
	public int getCount(FaqPagingVO vo) {
		return dao.getCount(vo);
	}

}
