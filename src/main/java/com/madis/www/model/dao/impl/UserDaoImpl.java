package com.madis.www.model.dao.impl;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.madis.www.model.dao.UserInfoDao;
import com.madis.www.model.dto.UserInfo;

@Repository
public class UserDaoImpl implements UserInfoDao {

	private JdbcTemplate jdbcTemplate;

	@Autowired
	public void setDataSource(DataSource dataSource) {
		jdbcTemplate = new JdbcTemplate(dataSource);
	}

	@Override
	public void createUser(UserInfo info) {
		this.jdbcTemplate.update("insert into users(email, password, name, age) values(?,?,?,?)", info.getEmail(),
				info.getPassword(), info.getName(), info.getAge());
	}

	@Override
	public int checkEmail(UserInfo info) {
		return this.jdbcTemplate.queryForInt("select count(*) from users where email = ?", info.getEmail());
	}

}
