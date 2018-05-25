package com.madis.www.model.dao;

import com.madis.www.model.dto.UserInfo;

public interface UserInfoDao {
	public void createUser(UserInfo info);
	
	public int checkEmail(UserInfo info);

	public UserInfo getUser(String email);
	
	public UserInfo getUser2(int index);
}
