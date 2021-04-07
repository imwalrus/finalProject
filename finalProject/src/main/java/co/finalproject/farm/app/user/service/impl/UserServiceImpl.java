package co.finalproject.farm.app.user.service.impl;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.finalproject.farm.app.user.service.UserService;
import co.finalproject.farm.app.user.service.UserVO;

@Service
public class UserServiceImpl implements UserService {
	
	@Autowired UserMapper userDAO;
	
	//아이디 중복체크
	public int idCheck(UserVO vo) {
		int result = userDAO.idCheck(vo);
		return result;
	}
	
	//이메일 중복체크
	public int emailCheck(UserVO vo) {
		int result = userDAO.emailCheck(vo);
		return result;
	}

	//로그인
	public UserVO loginCheck(UserVO vo) {
		return userDAO.loginCheck(vo);
	}
	
	//아이디 찾기
	public UserVO idFind(UserVO vo) {
		return userDAO.idFind(vo);
	}
	
	//비밀번호 찾기
	public int pwFind(UserVO vo) {
		int result = userDAO.pwFind(vo);
		return result;
	}

	//회원 단건조회(아이디로 조회)
	public UserVO getUser(UserVO vo) {
		return userDAO.getUser(vo);
	}

	//회원 전체조회
	public List<UserVO> getUserList(UserVO vo) {
		return userDAO.getUserList(vo);
	}

	//회원가입
	public int insertUser(UserVO vo) {
		int result = userDAO.insertUser(vo);
		return result;
	}
	
	//회원 정보수정
	public int updateUser(UserVO vo) {
		int result = userDAO.updateUser(vo);
		return result;
	}
	
	//회원 권한 변경(user-> farmer)
	public int updateUserToFarmer(UserVO vo) {
		int result = userDAO.updateUserToFarmer(vo);
		return result;
	}
	
	//회원탈퇴 또는 관리자 페이지 내에서 수정
	public int deleteUser(UserVO vo) {
		int result = userDAO.deleteUser(vo);
		return result;
	}
	


}
