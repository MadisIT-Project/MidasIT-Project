package com.madis.www.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/mypage")
public class MypageController {
	
	@RequestMapping(value = "/profile")
	public String join() {
		System.out.println("mypage profile");
		return "mypage/profile";
	}
}
