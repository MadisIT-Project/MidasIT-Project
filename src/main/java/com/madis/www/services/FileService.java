package com.madis.www.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.madis.www.model.dao.FileDao;

@Service("FileService")
public class FileService {

	@Autowired
	private FileDao fileDao;

	@Transactional
	public boolean isImageFile(String fname) {
		int cntFile = fileDao.countImageFile(fname);
		System.out.println("cntFile: " + cntFile);

		if (cntFile == 1) {
			return true;
		}
		return false;
	}
}
