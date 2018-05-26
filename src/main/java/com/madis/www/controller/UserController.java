package com.madis.www.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.madis.www.model.dao.impl.ReverImpl;
import com.madis.www.model.dao.impl.UserDaoImpl;
import com.madis.www.model.dto.Cusum;
import com.madis.www.model.dto.UserInfo;

@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	private UserDaoImpl userImpl;

	@Autowired
	private ReverImpl reverImpl;

	@RequestMapping(value = { "/reservation/reserveInfo" })
	public ModelAndView reserveInfo() {
		System.out.println("reserveInfo");

		ModelAndView mav = new ModelAndView();

		SecurityContext context = SecurityContextHolder.getContext();
		Authentication authentication = context.getAuthentication();

		System.out.println("authentication.getName():" + authentication.getName() + "----");
		String email = authentication.getName();
		UserInfo user = userImpl.getUser(email);
		System.out.println("user.getNo(): " + user.getNo());

		Cusum cusum = new Cusum();
		cusum.setIndex(user.getNo());
		// cusum.setUser_id(user.getNo());

		List<Cusum> info = reverImpl.getReverListByUser(cusum);

		mav.addObject("product", info);

		return mav;
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