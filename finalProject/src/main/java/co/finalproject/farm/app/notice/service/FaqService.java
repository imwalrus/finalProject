package co.finalproject.farm.app.notice.service;

import java.util.List;




public interface FaqService {
	
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
