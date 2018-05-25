package com.madis.www.model.dao;

import com.madis.www.model.dto.ImageInfo;

public interface MypageDao {
	public void insertAttachFile(ImageInfo imageInfo);

	public ImageInfo getImagesIndex(ImageInfo imageInfo);

	public void insertUser_Image(ImageInfo imageInfo);

	public int isProfile(ImageInfo imageInfo);
}
