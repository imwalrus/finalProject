package co.finalproject.farm.app.user.service.impl;

import co.finalproject.farm.app.user.service.UserVO;

public interface UserMapper {
	
	public int idCheck(UserVO vo); //id 중복체크
	
}
