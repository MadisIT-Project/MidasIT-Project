package com.madis.www.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/reserve")
public class ReservController {

	@RequestMapping(value = { "/search" })
	public String search() {
		return "reserveinfo";
	}
	
	@RequestMapping(value = { "/admin/search" })
	public String adminSearch() {
		return "managereserve";
	}
}
