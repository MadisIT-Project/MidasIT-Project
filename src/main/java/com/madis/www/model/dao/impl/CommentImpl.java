package com.madis.www.model.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
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
	
	private final String COMMENT_LIST = "select * from comments where p_id = ? order by comments.index desc";
	
	
	@Override
	public List<Comment> getCommentList(int index){
		Object[] args = {index};
		return jdbcTemplate.query(COMMENT_LIST, args, new CommentRowMapper());
	}
}

class CommentRowMapper implements RowMapper<Comment>{
	public Comment mapRow(ResultSet rs, int rowNum) throws SQLException {
		Comment comment = new Comment();
		
		comment.setIndex(rs.getInt("comments.index"));
		comment.setContent(rs.getString("content"));
		comment.setP_id(rs.getInt("p_id"));
		comment.setU_id(rs.getInt("u_id"));
		comment.setCreated_date(rs.getDate("created_date"));
		comment.setModified_date(rs.getDate("modified_date"));
		
		return comment;
	}
}
