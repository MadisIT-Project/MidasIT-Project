package com.madis.www.model.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.madis.www.model.dao.CusumDao;
import com.madis.www.model.dto.Cusum;

@Repository
public class CusumImpl implements CusumDao {
	
	private JdbcTemplate jdbcTemplate;

	@Autowired
	public void setDataSource(DataSource dataSource) {
		jdbcTemplate = new JdbcTemplate(dataSource);
	}
	
	private final String CUSUM_INSERT = "insert into cusums (user_id, menu_id, num, date, state) values (?, ?, ?, ?, 100)";
	// private final String CUSUM_UPDATE = "update cusums set title = ?, content = ?, modified_date = now() where posts.index = ?";
	private final String CUSUM_DELETE = "delete from cusums where cusums.index = ?";
	private final String CUSUM_GET = "select * from cusums where cusums.index = ?";
	private final String CUSUM_ALL_LIST = "select * from cusums order by cusums.index";
	private final String CUSUM_LIST_BY_USER = "select * from cusums where user_id = ? order by cusums.index";
	private final String CUSUM_LIST_BY_MONTH = "select * from cusums where DATE_FORMAT(date,'%Y-%m') = ? order by cusums.index";
	
	// 시간대별
	// 요일별
	// 월별 쿼리 받아오기

	@Override
	public void insertCusum(Cusum cusum) {
		jdbcTemplate.update(CUSUM_INSERT, cusum.getUser_id(), cusum.getMenu_id(), cusum.getNum(), cusum.getDate());
	}

	@Override
	public void updateCusum(Cusum cusum) {
		// TODO Auto-generated method stub

	}

	@Override
	public void deleteCusum(Cusum cusum) {
		jdbcTemplate.update(CUSUM_DELETE, cusum.getIndex());
	}

	@Override
	public Cusum getCusum(Cusum cusum) {
		Object[] args = {cusum.getUser_id()};
		return jdbcTemplate.queryForObject(CUSUM_GET, args, new CusumRowMapper());
	}

	@Override
	public List<Cusum> getCusumAllList(Cusum cusum) {
		return jdbcTemplate.query(CUSUM_ALL_LIST, new CusumRowMapper());
	}

	@Override
	public List<Cusum> getCusumListByUser(Cusum cusum) {
		Object[] args = {cusum.getIndex()};
		return jdbcTemplate.query(CUSUM_LIST_BY_USER, args, new CusumRowMapper());
	}

}

class CusumRowMapper implements RowMapper<Cusum>{
	public Cusum mapRow(ResultSet rs, int rowNum) throws SQLException {
		Cusum cusum = new Cusum();
		cusum.setIndex(rs.getInt("cusums.index"));
		cusum.setUser_id(rs.getInt("user_id"));
		cusum.setMenu_id(rs.getInt("menu_id"));
		cusum.setNum(rs.getInt("num"));
		cusum.setDate(rs.getDate("date"));
		cusum.setState(rs.getInt("state"));
		
		return cusum;
	}
}
