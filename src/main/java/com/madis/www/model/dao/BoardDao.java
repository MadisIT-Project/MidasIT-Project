package com.madis.www.model.dao;

import java.util.List;

import com.madis.www.model.dto.Board;

public interface BoardDao {

	// CRUD 기능의 메소드 구현
	// 글 등록
	void insertBoard(Board board);

	// 글 수정
	void updateBoard(Board board);

	// 글 삭제
	void deleteBoard(int index);

	// 글 상세 조회
	Board getBoard(int index);

	// 글 목록 조회
	List<Board> getBoardList(Board board);
	
}
