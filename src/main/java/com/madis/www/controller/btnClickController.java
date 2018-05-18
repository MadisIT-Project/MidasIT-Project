package com.madis.www.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class btnClickController {
	
	@RequestMapping(value = "/btnClick", method = RequestMethod.GET)
	public String home() {
		System.out.println("test222");
		return "btnClick";
	}
}
