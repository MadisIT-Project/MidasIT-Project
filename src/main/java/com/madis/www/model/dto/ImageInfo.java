package com.madis.www.model.dto;

import org.springframework.web.multipart.MultipartFile;

public class ImageInfo {
	private int userId;
	private int imageId;
	private String name;
	private int age;
	private MultipartFile attachment1;
	private String attach1_Path;

	
	public int getImageId() {
		return imageId;
	}

	public void setImageId(int imageId) {
		this.imageId = imageId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public ImageInfo() {
		this.attach1_Path = "null";
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public MultipartFile getAttachment1() {
		return attachment1;
	}

	public void setAttachment1(MultipartFile attachment1) {
		this.attachment1 = attachment1;
	}

	public String getAttach1_Path() {
		return attach1_Path;
	}

	public void setAttach1_Path(String attach1_Path) {
		this.attach1_Path = attach1_Path;
	}

}
