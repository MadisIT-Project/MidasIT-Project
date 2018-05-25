package com.madis.www.controller;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.madis.www.model.dto.ImageInfo;
import com.madis.www.services.MypageService;

@Controller
@RequestMapping("/mypage")
public class MypageController {
	
	@Autowired
	private MypageService mypageService;
	
	@RequestMapping(value = "/profile")
	public String join() {
		System.out.println("mypage profile");
		return "mypage/profile";
	}
	
	@RequestMapping(value="/upload", method=RequestMethod.POST)
	public String insert (ImageInfo imageInfo) throws IOException{
		System.out.println("upload logic");

		System.out.println("index: "+imageInfo.getUserId());
		System.out.println("age: "+imageInfo.getAge());
		System.out.println("name: "+imageInfo.getName());
		
		mypageService.insertProfileImage(imageInfo);
		
		return "mypage/profile";
	}
}
