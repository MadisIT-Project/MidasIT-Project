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
	
	private final String COMMENT_INSERT = "insert into comments (content, p_id, u_id, created_date, modified_date) values (?, ?, ?, now(), now())";
	private final String COMMENT_LIST = "select * from comments where p_id = ? order by comments.index desc";
	private final String COMMENT_ALL_DELETE = "delete from comments where p_id = ?";
	private final String COMMENT_DELETE = "delete from comments where comments.index = ?";
	
	@Override
	public void insertComment(Comment comment) {
		jdbcTemplate.update(COMMENT_INSERT, comment.getContent(), comment.getP_id(), comment.getU_id());
	}

	@Override
	public void deleteAllComment(int p_id) {
		jdbcTemplate.update(COMMENT_ALL_DELETE, p_id);
	}

	@Override
	public void deleteComment(int index) {
		jdbcTemplate.update(COMMENT_DELETE, index);
	}

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
