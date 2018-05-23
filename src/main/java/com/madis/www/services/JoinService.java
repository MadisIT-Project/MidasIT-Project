package com.madis.www.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.madis.www.model.dao.UserInfoDao;
import com.madis.www.model.dto.UserInfo;

@Service("joinService")
public class JoinService {

	@Autowired
	private UserInfoDao userInfoDao;

	@Transactional
	public UserInfo checkValidation(UserInfo info) {
		int cntUserId = userInfoDao.checkEmail(info);
		System.out.println("checkValidation: " + cntUserId);
		
		info.setEmail(String.valueOf(cntUserId));
		
		return info;
	}
	
	@Transactional
	public UserInfo creatUser(UserInfo info) {
		userInfoDao.createUser(info);
		
		return info;
	}

}
