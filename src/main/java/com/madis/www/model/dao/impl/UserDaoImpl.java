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
	public int createUser(UserInfo info) {
		return 0;
	}

	@Override
	public UserInfo getUserInfo(UserInfo info) {
		return null;
	}

	@Override
	public int checkId(UserInfo info) {
		return this.jdbcTemplate.queryForInt("select count(*) from userinfo where id = ?", info.getId());
	}

}
