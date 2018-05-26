package com.madis.www.model.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.madis.www.model.dao.MenuDao;
import com.madis.www.model.dto.Menu;

@Repository
public class MenuImpl implements MenuDao {

	private JdbcTemplate jdbcTemplate;

	@Autowired
	public void setDataSource(DataSource dataSource) {
		jdbcTemplate = new JdbcTemplate(dataSource);
	}
	
	private final String MENU_INSERT = "insert into menus (name, price, detail, path) values (?, ?, ?, ?)";
	private final String MENU_UPDATE = "update menus set name = ?, price = ?, detail = ?, path = ? where menus.index = ?";
	private final String MENU_DELETE = "delete from menus where menus.index = ?";
	private final String MENU_GET = "select * from menus where menus.index = ?";
	private final String MENU_ALL_LIST = "select * from menus order by menus.index";

	@Override
	public void insertMenu(Menu menu) {
		jdbcTemplate.update(MENU_INSERT, menu.getName(), menu.getPrice(), menu.getDetail(), menu.getPath());
	}

	@Override
	public void updateMenu(Menu menu) {
		jdbcTemplate.update(MENU_UPDATE, menu.getName(), menu.getPrice(), menu.getDetail(), menu.getPath(), menu.getIndex());
	}

	@Override
	public void deleteMenu(Menu menu) {
		jdbcTemplate.update(MENU_DELETE, menu.getIndex());
	}

	@Override
	public Menu getMenu(Menu menu) {
		Object[] args = {menu.getIndex()};
		return jdbcTemplate.queryForObject(MENU_GET, args, new MenuRowMapper());
	}

	@Override
	public List<Menu> getMenuList(Menu menu) {
		return jdbcTemplate.query(MENU_ALL_LIST, new MenuRowMapper());
	}

}

class MenuRowMapper implements RowMapper<Menu>{
	public Menu mapRow(ResultSet rs, int rowNum) throws SQLException {
		Menu menu = new Menu();
		
		menu.setIndex(rs.getInt("menus.index"));
		menu.setName(rs.getString("name"));
		menu.setPrice(rs.getInt("price"));
		menu.setDetail(rs.getString("detail"));
		menu.setPath(rs.getString("path"));

		return menu;
	}
}
