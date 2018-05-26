package com.madis.www.model.dao;

public interface FileDao {
	public int countImageFile(String fname);

	public void imageUpload(String fname);
}
