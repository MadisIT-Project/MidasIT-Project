package com.madis.www.model.dao.impl;

import org.springframework.stereotype.Repository;

import com.madis.www.model.dao.UserInfoDao;
import com.madis.www.model.dto.UserInfo;

@Repository
public class UserDaoImpl implements UserInfoDao {

	@Override
	public int createUser(UserInfo info) {
		return 0;
	}

	@Override
	public UserInfo getUserInfo(UserInfo info) {
		return null;
	}

	@Override
	public int checkId(UserInfo info) {
		System.out.println("enter checkId");
		return 0;
	}

}
