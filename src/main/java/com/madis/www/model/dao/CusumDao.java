package com.madis.www.model.dao;

import java.util.List;

import com.madis.www.model.dto.Cusum;

public interface CusumDao {

	// consumption table insert
	void insertCusum(Cusum cusum);

	// consumption table update
	void updateCusum(Cusum cusum);

	// consumption table delete
	void deleteCusum(Cusum cusum);

	// consumption table get one object
	Cusum getCusum(Cusum cusum);

	// consumption table get all list
	List<Cusum> getCusumAllList(Cusum cusum);
	
	// consumption table get list by user
	List<Cusum> getCusumListByUser(Cusum cusum);

}
