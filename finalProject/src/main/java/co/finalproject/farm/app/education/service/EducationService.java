package co.finalproject.farm.app.education.service;

import java.util.List;


public interface EducationService {
	
	//등록
    public void insertEdu(EducationVO vo);

    //수정
    public void updateEdu(EducationVO vo);

    //삭제
    public void deleteEdu(EducationVO vo);

    //단건조회
    public EducationVO getSchOffEdu(EducationVO vo);

    //전체조회
    public List<EducationVO> getOffEdu(EducationVO vo);
    
    //건수
  	public int getCount(EduPagingVO vo);

}
