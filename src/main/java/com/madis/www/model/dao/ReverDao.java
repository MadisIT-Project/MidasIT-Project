package com.madis.www.model.dao;

import java.util.List;

import com.madis.www.model.dto.Cusum;

public interface ReverDao {

	// revers table insert
	void insertRever(Cusum cusum);

	// crevers table update
	void updateRever(Cusum cusum);

	// revers table delete
	void deleteRever(Cusum cusum);

	// revers table get one object
	Cusum getRever(Cusum cusum);
	
	// revers table get one object
	Cusum getIndexRever(int index);
	
	// consumption table get all list
	List<Cusum> getReverAllList(Cusum cusum);

	// consumption table get list by user
	List<Cusum> getReverListByUser(Cusum cusum);
}
