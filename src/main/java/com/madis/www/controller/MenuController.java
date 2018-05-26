package com.madis.www.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/menu")
public class MenuController {

	@RequestMapping(value = { "/search" })
	public String search() {
		System.out.println("menu search");
		return "/menu/menuinfo";
	}
	
	@RequestMapping(value = { "/meanage" })
	public String meanage() {
		System.out.println("menu meanage");
		return "/menu/menumeanage";
	}
}
