package com.madis.www.model.dao;

import java.util.Date;
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
	List<Cusum> getCusumAllList();
	
	// consumption table get list by user
	List<Cusum> getCusumListByUser(Cusum cusum);
	
	// 사용자 통계를 위한 Dao
	// 월별
	List<Cusum> getCusumListByMonthForUser(Cusum cusum, String month);
	
	// 기간별
	List<Cusum> getCusumListByBetweenForUser(Cusum cusum, Date s_date, Date e_date);
	
	List<ForStaticDao> getMostMenuByUser(Cusum cusum, String month);

}
