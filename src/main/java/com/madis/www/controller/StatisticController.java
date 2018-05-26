package com.madis.www.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/statistic")
public class StatisticController {

	@RequestMapping(value = { "/search" })
	public String search() {
		System.out.println("menu search");
		return "/static/monthbuy";
	}
}
