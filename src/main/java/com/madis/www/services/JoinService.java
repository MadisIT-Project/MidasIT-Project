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
		int cntUserId = userInfoDao.checkId(info);
		System.out.println("checkValidation: " + cntUserId);
		info.setId(String.valueOf(cntUserId));
		
		return info;
	}

}
