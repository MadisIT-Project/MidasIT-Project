package com.madis.www.controller;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.madis.www.model.dto.UserInfo;
import com.madis.www.services.JoinService;

@Controller
@RequestMapping("/join")
public class JoinController {

	@Autowired
	private JoinService joinService;

	@RequestMapping(value="/create",method = RequestMethod.GET)
	public String join() {
		System.out.println("join test");
		return "join/create";
	}

	@RequestMapping(value = "/checkValidation", method=RequestMethod.POST)
	public StringBuffer checkValidation(UserInfo info) {
		
		System.out.println(info.getId());
		JSONObject result = joinService.checkValidation(info);
		
		
		StringBuffer buff = new StringBuffer();
		buff.append("{")
		.append("\"result\":\"").append(1).append("\",")
		.append("\"data\":").append(result == null ? "{}" : result.toString() )
		.append("}");
		
		System.out.println("join Controller checkValidation");
		
		return buff;
	}
}
