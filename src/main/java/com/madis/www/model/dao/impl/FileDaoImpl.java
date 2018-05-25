package com.madis.www.model.dao.impl;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.madis.www.model.dao.FileDao;

@Repository
public class FileDaoImpl implements FileDao {

	private JdbcTemplate jdbcTemplate;

	@Autowired
	public void setDataSource(DataSource dataSource) {
		jdbcTemplate = new JdbcTemplate(dataSource);
	}

	@Override
	public int countImageFile(String fname) {
		return this.jdbcTemplate.queryForInt("select count(*) from images where path = ?", fname);
	}

}
