package com.madis.www.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.madis.www.common.mvc.model.vo.ResultVO;
import com.madis.www.model.dto.UserInfo;
import com.madis.www.services.JoinService;

@Controller
@RequestMapping("/join")
public class JoinController {

	@Autowired
	private JoinService joinService;

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login() {
		System.out.println("login test");
		return "join/login";
	}

	@RequestMapping(value = "/create", method = RequestMethod.GET)
	public String join() {
		System.out.println("join test");
		return "join/create";
	}

	@RequestMapping(value = "/checkValidation", method = RequestMethod.GET)
	public @ResponseBody ResultVO checkValidation(UserInfo info) {

		System.out.println("-------------");
		System.out.println(info.getId());
		System.out.println("-------------");
		UserInfo userInfo = joinService.checkValidation(info);
		ResultVO result = new ResultVO(userInfo);

		System.out.println("join Controller checkValidation");

		return result;
	}
}
