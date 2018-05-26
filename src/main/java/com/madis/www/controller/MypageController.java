package com.madis.www.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.madis.www.model.dto.ImageInfo;
import com.madis.www.model.dto.UserInfo;
import com.madis.www.services.JoinService;
import com.madis.www.services.MypageService;
import com.mysql.fabric.Response;

@Controller
@RequestMapping("/mypage")
public class MypageController {
	
	@Autowired
	private MypageService mypageService;
	
	@Autowired
	private JoinService joinService;
	
	@RequestMapping(value = "/profile")
	public ModelAndView join() {
		System.out.println("mypage profile");
		
		ModelAndView mav = new ModelAndView();
		
		
		SecurityContext context = SecurityContextHolder.getContext();
		Authentication authentication = context.getAuthentication();

		String email = authentication.getName();
		UserInfo info = joinService.getUserInfo(email);
		
		System.out.println(info.getName());
		System.out.println(info.getAge());
		
		mav.addObject("name", info.getName());
		mav.addObject("age", info.getAge());

		return mav;
	}
	
	@RequestMapping(value="/upload", method=RequestMethod.POST)
	public String insert (ImageInfo imageInfo, HttpServletResponse response) throws IOException{
		System.out.println("upload logic");

		System.out.println("index: "+imageInfo.getUserId());
		System.out.println("age: "+imageInfo.getAge());
		System.out.println("name: "+imageInfo.getName());
		
		mypageService.insertProfileImage(imageInfo);
		

		response.sendRedirect("/mypage/profile");
		
		return "mypage/profile";
	}
}
