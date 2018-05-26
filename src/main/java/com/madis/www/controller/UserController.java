package com.madis.www.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/user")
public class UserController {

	@RequestMapping(value = { "/reservation/reserveInfo" })
	public String reserveInfo() {
		System.out.println("reserveInfo");
		return "user/reservation/reserveInfo";
	}

	@RequestMapping(value = { "/statistic/statisticInfo" })
	public String statisticInfo() {
		System.out.println("statisticInfo");
		return "user/statistic/statisticInfo";
	}
}