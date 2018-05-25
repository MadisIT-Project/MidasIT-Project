package com.madis.www.model.dao.impl;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.madis.www.model.dao.MypageDao;
import com.madis.www.model.dto.ImageInfo;

@Repository
public class MypageDaoImpl implements MypageDao{

	private JdbcTemplate jdbcTemplate;

	@Autowired
	public void setDataSource(DataSource dataSource) {
		jdbcTemplate = new JdbcTemplate(dataSource);
	}
	
	@Override
	public void insertAttachFile(ImageInfo imageInfo) {
		this.jdbcTemplate.update("insert into images(path) values(?)", imageInfo.getAttach1_Path());
	}

	@Override
	public int getImagesIndex(ImageInfo imageInfo) {
		return this.jdbcTemplate.queryForInt("select index from images where path=?", imageInfo.getAttach1_Path());
	}

	@Override
	public void insertUser_Image(ImageInfo imageInfo) {
		this.jdbcTemplate.update("insert into user_image(u_id, image_id) values(?, ?)", imageInfo.getUserId(), imageInfo.getImageId());
	}

	@Override
	public int isProfile(ImageInfo imageInfo) {
		return this.jdbcTemplate.queryForInt("select count(*) from images where path=?", imageInfo.getAttach1_Path());
	}

}
