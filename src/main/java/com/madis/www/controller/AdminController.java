package com.madis.www.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@RequestMapping(value = { "/menu/menuManage" })
	public String menuManage() {
		System.out.println("menuManage");
		return "admin/menu/menuManage";
	}

	@RequestMapping(value = { "/manage/memberManage" })
	public String memberManage() {
		System.out.println("memberManage");
		return "admin/manage/memberManage";
	}
	
	@RequestMapping(value = { "/reservation/reservManage" })
	public String reservManage() {
		System.out.println("reservManage");
		return "admin/reservation/reservManage";
	}
}