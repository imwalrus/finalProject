package co.finalproject.farm.app.user.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.finalproject.farm.app.user.service.UserService;
import co.finalproject.farm.app.user.service.UserVO;

@Service
public class UserServiceImpl implements UserService {
	
	@Autowired UserMapper userDAO;
		
	@Override
	public int idCheck(UserVO vo) {
		int result = userDAO.idCheck(vo);
		System.out.println("idcheck result " + result);
		return result;
		
	}

}
