package com.madis.www.model.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.madis.www.model.dao.MypageDao;
import com.madis.www.model.dto.ImageInfo;

@Repository
public class MypageDaoImpl implements MypageDao {

	private JdbcTemplate jdbcTemplate;

	@Autowired
	public void setDataSource(DataSource dataSource) {
		jdbcTemplate = new JdbcTemplate(dataSource);
	}

	private RowMapper<ImageInfo> imageMapper = new RowMapper<ImageInfo>() {
		public ImageInfo mapRow(ResultSet rs, int rowNum) throws SQLException {
			ImageInfo info = new ImageInfo();
			info.setImageId(rs.getInt("index"));
			info.setAttach1_Path(rs.getString("path"));
			return info;
		}
	};

	@Override
	public void insertAttachFile(ImageInfo imageInfo) {
		this.jdbcTemplate.update("insert into images(path) values(?)", imageInfo.getAttach1_Path());
	}

	@Override
	public ImageInfo getImagesIndex(ImageInfo imageInfo) {
		return this.jdbcTemplate.queryForObject("select * from images where path = ?",
				new Object[] { imageInfo.getAttach1_Path() }, this.imageMapper);
	}

	@Override
	public void insertUser_Image(ImageInfo imageInfo) {
		this.jdbcTemplate.update("insert into user_image(u_id, image_id) values(?, ?)", imageInfo.getUserId(),
				imageInfo.getImageId());
	}

	@Override
	public int isProfile(ImageInfo imageInfo) {
		return this.jdbcTemplate.queryForInt("select count(*) from images where path=?", imageInfo.getAttach1_Path());
	}

	@Override
	public void update(ImageInfo imageInfo) {
		this.jdbcTemplate.update("update users set name = ?,age = ? where users.index = ? ", imageInfo.getName(),
				imageInfo.getAge(), imageInfo.getUserId());
	}

}
