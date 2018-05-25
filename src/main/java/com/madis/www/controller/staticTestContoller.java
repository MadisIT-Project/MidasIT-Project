package com.madis.www.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.madis.www.model.dao.impl.StaticDaoImpl;

@Controller
public class staticTestContoller {
	@Autowired
	private StaticDaoImpl staticDaoImpl;
	
	@RequestMapping(value = "/staticTest", method = RequestMethod.GET)
	public String getBoardList(HttpServletRequest request, Model model){
		String start = request.getParameter("start");
		String end = request.getParameter("end");
		String searchFood = request.getParameter("searchFood");
		
		if (start == null){
			start = "11";
		}
		if (end == null){
			end = "11";
		}
		if (searchFood == null) {
			searchFood = "김치";
		}
		System.out.println("start : " + start);
		
		// Model 정보 저장
		model.addAttribute("start", start); // Model 정보 저장
		model.addAttribute("end", end); // Model 정보 저장
		model.addAttribute("searchFood", searchFood); // Model 정보 저장
		model.addAttribute("staticList", staticDaoImpl.getStaticInfo()); // Model 정보 저장
		model.addAttribute("searchList", staticDaoImpl.getSearchList(searchFood));
		return "staticTest";
	}
	
	@RequestMapping(value = "/test", method = RequestMethod.GET)
	public String getTest(){

		return "board/test";
	}
}
