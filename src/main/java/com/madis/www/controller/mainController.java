package com.madis.www.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class mainController {

	@RequestMapping(value = { "/main", "/" })
	public String main() {
		System.out.println("main test");
		return "/main";
	}
}
