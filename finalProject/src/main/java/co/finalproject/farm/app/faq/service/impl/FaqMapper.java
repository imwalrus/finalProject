package co.finalproject.farm.app.faq.service.impl;

import java.util.List;


import co.finalproject.farm.app.faq.service.FaqPagingVO;
import co.finalproject.farm.app.faq.service.FaqVO;


public interface FaqMapper {
	

	//등록
    public void insertFaq(FaqVO vo);

    //수정
    public void updateFaq(FaqVO vo);

    //삭제
    public void deleteFaq(FaqVO vo);

    //단건조회
    public FaqVO getSearchFaq(FaqVO vo);

    //전체조회
    public List<FaqVO> getFaq(FaqVO vo);
    
    //건수
  	public int getCount(FaqPagingVO vo);
  	
	   
}
