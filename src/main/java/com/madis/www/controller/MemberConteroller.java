package com.madis.www.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/member")
public class MemberConteroller {
	
	@RequestMapping(value = { "/search" })
	public String search() {
		return "membermanage";
	}
}
