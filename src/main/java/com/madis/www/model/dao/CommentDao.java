package com.madis.www.model.dao;

import java.util.List;

import com.madis.www.model.dto.Comment;

public interface CommentDao {

	// Comment 리스트가져오기
	List<Comment> getCommentList(int index);
	
	// 댓글 달기
	void insertComment(Comment comment);
	
	// delete all comment where p_id = ?
	void deleteAllComment(int p_id);
	
	// delete all comment where p_id = ?
	void deleteComment(int index);
}
