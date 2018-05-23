package com.madis.www.model.dao;

import java.util.List;

import com.madis.www.model.dto.StaticInfo;

public interface StaticInfoDao {
	
	public List<StaticInfo> getStaticInfo();
	
	public List<StaticInfo> getSearchList(String searchFood);

}
