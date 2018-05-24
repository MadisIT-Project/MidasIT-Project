package com.madis.www.model.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
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
	
	private RowMapper<UserInfo> userMapper = new RowMapper<UserInfo>() {
		public UserInfo mapRow(ResultSet rs, int rowNum) throws SQLException {
			UserInfo user = new UserInfo();
			user.setEmail(rs.getString("email"));
			user.setAge(Integer.parseInt(rs.getString("age")));
			user.setName(rs.getString("name"));
			user.setPassword(rs.getString("password"));
			user.setAdmin(Boolean.parseBoolean(rs.getString("admin")));
			return user;
		}
	};
			
	@Override
	public void createUser(UserInfo info) {
		this.jdbcTemplate.update("insert into users(email, password, name, age) values(?,?,?,?)", info.getEmail(),
				info.getPassword(), info.getName(), info.getAge());
	}

	@Override
	public int checkEmail(UserInfo info) {
		return this.jdbcTemplate.queryForInt("select count(*) from users where email = ?", info.getEmail());
	}

	@Override
	public UserInfo getUser(String email) {
		return this.jdbcTemplate.queryForObject("select * from users where email = ?", new Object[] { email }, this.userMapper);
	}

}
