package com.madis.www.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.madis.www.common.mvc.model.vo.ResultVO;
import com.madis.www.model.dto.UserInfo;
import com.madis.www.services.JoinService;

@Controller
@RequestMapping("/join")
public class JoinController {

	@Autowired
	private JoinService joinService;

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public ModelAndView login(@RequestParam(value = "error", required = false) String error,
			@RequestParam(value = "logout", required = false) String logout) {

		ModelAndView model = new ModelAndView();

		if (error != null) {
			model.addObject("error", "Invalid username and password!");
		}
		if (logout != null) {
			model.addObject("msg", "You've been logged out successfully.");
		}

		model.setViewName("join/login");

		return model;
	}

	@RequestMapping(value = "/create", method = RequestMethod.GET)
	public String join() {
		System.out.println("join test");
		return "join/create";
	}

	@RequestMapping(value = "/checkValidation", method = RequestMethod.GET)
	public @ResponseBody ResultVO checkValidation(UserInfo info) {

		System.out.println("-------------");
		System.out.println(info.getEmail());
		System.out.println("-------------");
		UserInfo userInfo = joinService.checkValidation(info);
		ResultVO result = new ResultVO(userInfo);

		System.out.println("join Controller checkValidation");

		return result;
	}

	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public @ResponseBody ResultVO register(UserInfo info) {

		System.out.println("-------------");
		System.out.println(info.getEmail());
		System.out.println(info.getAge());
		System.out.println(info.getId());
		System.out.println(info.getName());
		System.out.println(info.getPassword());
		System.out.println("-------------");
		UserInfo userInfo = joinService.creatUser(info);
		ResultVO result = new ResultVO(userInfo);

		return result;
	}
}
