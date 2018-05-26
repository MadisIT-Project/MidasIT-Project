package com.madis.www.model.dao;

import java.util.List;

import com.madis.www.model.dto.Menu;

public interface MenuDao {
	
	// menu table insert
	void insertMenu(Menu menu);

	// menu table update
	void updateMenu(Menu menu);

	// menu table delete
	void deleteMenu(Menu menu);

	// menu table get one object
	Menu getMenu(Menu menu);

	// menu table get all list
	List<Menu> getMenuList();
	
}
