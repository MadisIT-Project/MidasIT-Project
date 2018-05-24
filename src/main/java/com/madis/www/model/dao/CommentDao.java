package com.madis.www.model.dao;

import java.util.List;

import com.madis.www.model.dto.Comment;

public interface CommentDao {

	List<Comment> getCommentList(int index);
}
