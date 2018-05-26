package com.madis.www.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.madis.www.model.dao.impl.CusumImpl;
import com.madis.www.model.dao.impl.MenuImpl;
import com.madis.www.model.dao.impl.ReverImpl;
import com.madis.www.model.dao.impl.UserDaoImpl;
import com.madis.www.model.dto.Cusum;
import com.madis.www.model.dto.Menu;
import com.madis.www.model.dto.UserInfo;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	private MenuImpl menuImpl;

	@Autowired
	private UserDaoImpl userImpl;

	@Autowired
	private ReverImpl reverImpl;
	
	@Autowired
	private CusumImpl cusumImpl;

	@RequestMapping(value = { "/menu/menuManage" })
	public String menuManage(Menu menu, Model model) {
		System.out.println("menuManage");

		model.addAttribute("menuList", menuImpl.getMenuList());

		return "admin/menu/menuManage";
	}

	@RequestMapping(value = { "/menu/menuManage/delete" })
	public @ResponseBody Map<String, Object> deleteManage(Menu menu) {
		System.out.println("deletemenu");
		System.out.println(menu.getIndex());

		menuImpl.deleteMenu(menu);
		System.out.println(menu.getIndex());
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", 1);

		return resultMap;
	}

	@RequestMapping(value = { "/menu/menuManage/add" })
	public @ResponseBody Map<String, Object> insertManage(Menu menu) {
		System.out.println("addmenu");
		System.out.println(menu.getIndex());
		menuImpl.insertMenu(menu);
		System.out.println(menu.getIndex());
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", 1);

		return resultMap;
	}

	@RequestMapping(value = { "/menu/menuManage/update" })
	public @ResponseBody Map<String, Object> updateManage(Menu menu) {
		System.out.println("modimenu");
		System.out.println(menu.getIndex());
		menuImpl.updateMenu(menu);
		System.out.println(menu.getIndex());
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", 1);

		return resultMap;
	}

	@RequestMapping(value = { "/manage/memberManage" })
	public String memberManage(Model model) {
		System.out.println("memberManage");

		model.addAttribute("memberList", userImpl.getUserList());
		System.out.println("memberManage");
		return "admin/manage/memberManage";
	}

	@RequestMapping(value = { "/manage/memberManage/add" })
	public @ResponseBody Map<String, Object> addManage(UserInfo user) {
		System.out.println("memberadd");

		userImpl.addUser(user);
		System.out.println(user.getIndex());
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", 1);

		return resultMap;
	}

	@RequestMapping(value = { "/manage/memberManage/update" })
	public @ResponseBody Map<String, Object> updateManage(UserInfo user) {
		System.out.println("memberupdate");

		userImpl.updateUser(user);
		System.out.println(user.getIndex());

		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", 1);

		return resultMap;
	}

	@RequestMapping(value = { "/manage/memberManage/delete" })
	public @ResponseBody Map<String, Object> deleteManage(UserInfo user) {
		System.out.println("deleteMmem");

		System.out.println(user.getNo());
		userImpl.deleteUser(user);

		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", 1);

		return resultMap;
	}

	@RequestMapping(value = { "/reservation/reservManage" })
	public ModelAndView reservManage() {
		System.out.println("reservManage");

		ModelAndView mav = new ModelAndView();

		SecurityContext context = SecurityContextHolder.getContext();
		Authentication authentication = context.getAuthentication();

		String email = authentication.getName();
		UserInfo user = userImpl.getUser(email);

		Cusum cusum = new Cusum();
		cusum.setIndex(user.getNo());

		System.out.println("user.getNo():" + user.getNo());
		List<Cusum> info = null;
		try {
			info = reverImpl.getReverListByUser(cusum);
			mav.addObject("productList", info);

			System.out.println(info.size());
		} catch (Exception e) {
			System.out.println("null");
			mav.addObject("error", true);
		}
		mav.addObject("error", false);
		System.out.println("1111");
		return mav;
	}

	@RequestMapping(value = { "/reservation/nextState" })
	public @ResponseBody Map<String, Object> nextState(@RequestParam("state") int nextState,
			@RequestParam("productId") int productId) {

		System.out.println("enter nextState");
		System.out.println("index: " + nextState);
		System.out.println("productId: " + productId);

		Cusum cusum = new Cusum();
		cusum.setIndex(productId);
		cusum.setState(nextState);
		reverImpl.updateRever(cusum);
		
		if (nextState == 3) {
			cusum = reverImpl.getIndexRever(cusum.getIndex());
			cusumImpl.insertCusum(cusum);
		}

		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", 1);

		return resultMap;
	}
}