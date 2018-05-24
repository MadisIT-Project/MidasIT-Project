package com.madis.www.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class mapController {

	@RequestMapping("/map")
	public String map() {
		System.out.println("main test");
		return "/map";
	}
}
