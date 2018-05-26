package com.madis.www.model.dao.impl;


import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.madis.www.model.dao.ReverDao;
import com.madis.www.model.dto.Cusum;

@Repository
public class ReverImpl implements ReverDao {

	private JdbcTemplate jdbcTemplate;

	@Autowired
	public void setDataSource(DataSource dataSource) {
		jdbcTemplate = new JdbcTemplate(dataSource);
	}
	
	private final String REVER_INSERT = "insert into revers (user_id, menu_id, num, date, state) values (?, ?, ?, now(), 0)";
	// private final String REVER_UPDATE = "update cusums set title = ?, content = ?, modified_date = now() where posts.index = ?";
	private final String REVER_DELETE = "delete from revers where revers.index = ?";
	private final String REVER_GET = "select * from revers where revers.index = ?";
	private final String REVER_ALL_LIST = "select * from revers order by revers.index";
	private final String REVER_LIST_BY_USER = "select * from revers where user_id = ? order by revers.index";
	
	@Override
	public void insertRever(Cusum cusum) {
		jdbcTemplate.update(REVER_INSERT, cusum.getUser_id(), cusum.getMenu_id(), cusum.getNum());
	}

	@Override
	public void updateRever(Cusum cusum) {
		// TODO Auto-generated method stub

	}

	@Override
	public void deleteRever(Cusum cusum) {
		jdbcTemplate.update(REVER_DELETE, cusum.getIndex());
	}

	@Override
	public Cusum getRever(Cusum cusum) {
		Object[] args = {cusum.getUser_id()};
		return jdbcTemplate.queryForObject(REVER_GET, args, new CusumRowMapper());
	}

	@Override
	public List<Cusum> getReverAllList(Cusum cusum) {
		return jdbcTemplate.query(REVER_ALL_LIST, new CusumRowMapper());
	}

	@Override
	public List<Cusum> getReverListByUser(Cusum cusum) {
		Object[] args = {cusum.getIndex()};
		return jdbcTemplate.query(REVER_LIST_BY_USER, args, new CusumRowMapper());
	}

}
