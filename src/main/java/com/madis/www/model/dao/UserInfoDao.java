package com.madis.www.model.dao;

import com.madis.www.model.dto.UserInfo;

public interface UserInfoDao {
	public int createUser(UserInfo info);

	public UserInfo getUserInfo(UserInfo info);
	
	public int checkId(UserInfo info);
}
