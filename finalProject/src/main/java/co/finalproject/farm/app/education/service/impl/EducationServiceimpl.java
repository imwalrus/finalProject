package co.finalproject.farm.app.education.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.finalproject.farm.app.education.service.EduPagingVO;
import co.finalproject.farm.app.education.service.EducationService;
import co.finalproject.farm.app.education.service.EducationVO;

@Service	
public class EducationServiceimpl implements EducationService {
	
	@Autowired EducationMapper dao;

	@Override
	public void insertEdu(EducationVO vo) {
		dao.insertEdu(vo);
		
	}

	@Override
	public void updateEdu(EducationVO vo) {
		dao.updateEdu(vo);
		
	}

	@Override
	public void deleteEdu(EducationVO vo) {
		dao.deleteEdu(vo);
		
	}

	@Override
	public EducationVO getSchOffEdu(EducationVO vo) {

		return dao.getSchOffEdu(vo);
	}

	@Override
	public List<EducationVO> getOffEdu(EducationVO vo) {
		
		return dao.getOffEdu(vo);
	}

	@Override
	public int getCount(EduPagingVO vo) {

		return dao.getCount(vo);
	}

}
