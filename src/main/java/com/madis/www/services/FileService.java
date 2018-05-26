package com.madis.www.services;

import java.io.BufferedInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.madis.www.model.dao.FileDao;
import com.madis.www.model.dto.ImageInfo;

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
	
	@Transactional
	public void uploadImageFile(ImageInfo imageInfo, String fname) throws IOException {

		imageInfo.setAttach1_Path(fname + ".jpg");
		
		FileOutputStream fos = new FileOutputStream("C:\\file\\menu\\" + imageInfo.getAttach1_Path());
		InputStream is = imageInfo.getAttachment1().getInputStream();
		BufferedInputStream bis = new BufferedInputStream(is);

		byte[] buffer = new byte[2048];
		while (bis.read(buffer) != -1) {
			fos.write(buffer);
		}
		fos.close();
	}
}
