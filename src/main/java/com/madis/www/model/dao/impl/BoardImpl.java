package com.madis.www.model.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.madis.www.model.dao.BoardDao;
import com.madis.www.model.dto.Board;

@Repository
public class BoardImpl implements BoardDao {
	
	private JdbcTemplate jdbcTemplate;

	@Autowired
	public void setDataSource(DataSource dataSource) {
		jdbcTemplate = new JdbcTemplate(dataSource);
	}
	
	private final String BOARD_INSERT = "insert into posts (title, content, b_index, u_index, created_date, modified_date) values (?, ?, ?, ?, now(), now())";
	private final String BOARD_UPDATE = "update posts set title = ?, content = ?, modified_date = now() where posts.index = ?";
	private final String BOARD_DELETE = "delete from posts where posts.index = ?";
	private final String BOARD_GET = "select * from posts where posts.index = ?";
	private final String BOARD_LIST = "select * from posts order by posts.index desc";
	/*
	private final String BOARD_LIST_T = "select * from board where title like ? order by seq desc";
	private final String BOARD_LIST_C = "select * from board where content like ? order by seq desc";
	*/
	@Override
	public void insertBoard(Board board) {
		jdbcTemplate.update(BOARD_INSERT, board.getTitle(), board.getContent(), board.getB_index(), board.getU_index());
	}

	@Override
	public void updateBoard(Board board) {
		System.out.println("get in");
		jdbcTemplate.update(BOARD_UPDATE, board.getTitle(), board.getContent(), board.getIndex());
	}

	@Override
	public void deleteBoard(int index) {
		int ss = index;
		jdbcTemplate.update(BOARD_DELETE, ss);
	}

	@Override
	public Board getBoard(int index) {
		Object[] args = {index};
		return jdbcTemplate.queryForObject(BOARD_GET, args, new BoardRowMapper());
	}

	@Override
	public List<Board> getBoardList(Board board) {
		
		/*
		System.out.println("===> Spring JDBC로 getBoardList() 기능 처리");
		Object[] args = {"%" + vo.getSearchKeyword() + "%"};
		if(vo.getSearchCondition().equals("TITLE")) {
			return jdbcTemplate.query(BOARD_LIST_T, args, new BoardRowMapper());
		} else if(vo.getSearchCondition().equals("CONTENT")) {
			return jdbcTemplate.query(BOARD_LIST_C, args, new BoardRowMapper());
		}
		*/
		return jdbcTemplate.query(BOARD_LIST, new BoardRowMapper());
	}

}

class BoardRowMapper implements RowMapper<Board>{
	public Board mapRow(ResultSet rs, int rowNum) throws SQLException {
		Board board = new Board();
		board.setIndex(rs.getInt("posts.index"));
		board.setTitle(rs.getString("title"));
		board.setContent(rs.getString("content"));
		board.setB_index(rs.getInt("b_index"));
		board.setU_index(rs.getInt("u_index"));
		board.setCreated_date(rs.getDate("created_date"));
		board.setModified_date(rs.getDate("modified_date"));
		
		return board;
	}
}