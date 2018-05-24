package com.madis.www.model.dao;

import java.util.List;

import com.madis.www.model.dto.Comment;

public interface CommentDao {

	// Comment 리스트가져오기
	List<Comment> getCommentList(int index);
}
