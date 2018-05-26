package com.madis.www.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.madis.www.model.dao.impl.CusumImpl;
import com.madis.www.model.dao.impl.MenuImpl;
import com.madis.www.model.dto.Menu;

@Controller
@RequestMapping("/menu")
public class MenuController {
	
	@Autowired
	private	MenuImpl menuImpl;
	
	@Autowired
	private	CusumImpl cusumImpl;

	@RequestMapping(value = { "/menuInfo" })
	public String search(Model model) {
		System.out.println("menu info");
		
		List<Menu> menuList = menuImpl.getMenuList();
		
		/*
		List<Cusum> cusumList = cusumImpl.getCusumAllList();
		System.out.println("menu info");
		List<Menu> cusumMenuList = new ArrayList<Menu>();
		System.out.println("menu info");
		for (int i=0; i<cusumList.size();i++) {
			Menu temp = new Menu();
			temp.setIndex(cusumList.get(i).getMenu_id());
			temp = menuImpl.getMenu(temp);
			cusumMenuList.add(temp);
			System.out.println(temp.getName());
			System.out.println(temp.getPrice());
		}
		*/
		// Model 정보 저장
		model.addAttribute("menuList", menuList);
		/*
		model.addAttribute("cusumList", cusumList);
		model.addAttribute("cusumMenuList", cusumMenuList);
		*/
		return "/menu/menuInfo";
	}
}
