package com.madis.www.model.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.madis.www.model.dao.StaticInfoDao;
import com.madis.www.model.dto.StaticInfo;

@Repository
public class StaticDaoImpl implements StaticInfoDao {

	private JdbcTemplate jdbcTemplate;

	@Autowired
	public void setDataSource(DataSource dataSource) {
		jdbcTemplate = new JdbcTemplate(dataSource);
	}
	
	private final String BOARD_LIST = "select * from statics order by star desc";
	private final String SEARCH_LIST = "select * from statics where food like ? order by star desc";
	
	@Override
	public List<StaticInfo> getStaticInfo() {
		return jdbcTemplate.query(BOARD_LIST, new StaticRowMapper());
	}
	
	@Override
	public List<StaticInfo> getSearchList(String searchFood) {
		Object[] args = {"%" + searchFood+ "%"};
		return jdbcTemplate.query(SEARCH_LIST, args, new StaticRowMapper());
	}

}

class StaticRowMapper implements RowMapper<StaticInfo>{
	public StaticInfo mapRow(ResultSet rs, int rowNum) throws SQLException {
		StaticInfo si = new StaticInfo();
		si.setSeq(rs.getInt("Seq"));
		si.setFood(rs.getString("food"));
		si.setStar(rs.getFloat("star"));
		return si;
	}
}