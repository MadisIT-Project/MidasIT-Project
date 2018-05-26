package com.madis.www.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/menu")
public class MenuController {

	@RequestMapping(value = { "/menuInfo" })
	public String search() {
		System.out.println("menu info");
		return "menu/menuInfo";
	}
}
