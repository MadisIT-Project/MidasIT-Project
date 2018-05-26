package com.madis.www.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.madis.www.model.dao.impl.ReverImpl;
import com.madis.www.model.dto.Cusum;

@Controller
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	private	ReverImpl reverImpl;

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
	
	@RequestMapping(value = { "/reservation/insert" })
	public @ResponseBody Map<String, Object> reservation(Cusum cusum) {
		System.out.println("/reservation/insert");
		
		reverImpl.insertRever(cusum);
		
		System.out.println("success");
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", 1);
		
		return resultMap;
	}
}