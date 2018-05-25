package com.madis.www.services;

import java.io.BufferedInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.madis.www.model.dao.MypageDao;
import com.madis.www.model.dto.ImageInfo;

@Service("mypageService")
public class MypageService {

	@Autowired
	MypageDao mypageDao;

	@Transactional
	public int insertProfileImage(ImageInfo imageInfo) throws IOException {

		String name = imageInfo.getAttachment1().getOriginalFilename();

		System.out.println("name:" + name);

		System.out.println("imageInfo.getUserId(): " + imageInfo.getUserId());

		
		imageInfo.setAttach1_Path(imageInfo.getUserId() + ".jpg");
		System.out.println("path: "+imageInfo.getAttach1_Path());
		
		int isProfile = mypageDao.isProfile(imageInfo);
		System.out.println("isProfile: " + isProfile);
		if (isProfile == 0) {
			mypageDao.insertAttachFile(imageInfo);
			ImageInfo image = mypageDao.getImagesIndex(imageInfo);
			System.out.println("imageIndex: " + image.getImageId());
			
			imageInfo.setImageId(image.getImageId());
			mypageDao.insertUser_Image(imageInfo);
		}

		FileOutputStream fos = new FileOutputStream("C:\\file\\profile\\" + imageInfo.getAttach1_Path());
		InputStream is = imageInfo.getAttachment1().getInputStream();
		BufferedInputStream bis = new BufferedInputStream(is);

		byte[] buffer = new byte[2048];
		while (bis.read(buffer) != -1) {
			fos.write(buffer);
		}
		fos.close();

		return 0;
	}
}
