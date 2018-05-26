package com.madis.www.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.madis.www.model.dao.impl.MenuImpl;
import com.madis.www.model.dto.Menu;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	private	MenuImpl menuImpl;
	
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
	public String memberManage() {
		System.out.println("memberManage");
		return "admin/manage/memberManage";
	}
	
	@RequestMapping(value = { "/reservation/reservManage" })
	public String reservManage() {
		System.out.println("reservManage");
		return "admin/reservation/reservManage";
	}
}