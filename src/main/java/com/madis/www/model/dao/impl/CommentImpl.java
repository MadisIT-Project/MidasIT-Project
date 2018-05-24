package com.madis.www.model.dao.impl;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.madis.www.model.dao.CommentDao;
import com.madis.www.model.dto.Comment;

@Repository
public class CommentImpl implements CommentDao {
	
	private JdbcTemplate jdbcTemplate;

	@Autowired
	public void setDataSource(DataSource dataSource) {
		jdbcTemplate = new JdbcTemplate(dataSource);
	}
	
	@Override
	public List<Comment> getCommentList(int index){
		List<Comment> a = new ArrayList<Comment>();
		return a;
	}
}
