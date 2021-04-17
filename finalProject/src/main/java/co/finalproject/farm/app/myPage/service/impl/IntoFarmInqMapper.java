package co.finalproject.farm.app.myPage.service.impl;

import java.util.List;

import co.finalproject.farm.app.myPage.service.IntoFarmInqVO;
import co.finalproject.farm.app.myPage.service.IntoFarmReplyVO;


public interface IntoFarmInqMapper {
	
	public List<IntoFarmInqVO>getIntoFarmInqList();
	
	public IntoFarmInqVO getIntoFarmInq(IntoFarmInqVO vo);
	
	public int insertIntoFarmInq(IntoFarmInqVO vo);
	
	public int updateIntoFarmInq(IntoFarmInqVO vo);
	
	public int deleteIntoFarmInq(IntoFarmInqVO vo);
	
	public List<IntoFarmInqVO> getIntoFarmInqOfUser(String user_id);
	
	//댓글
	public List<IntoFarmReplyVO> getintoFarmReplyList(IntoFarmReplyVO vo);
	public int insertIntoFarmReply(IntoFarmReplyVO vo);
	public int deleteIntoFarmReply(IntoFarmReplyVO vo);

}
