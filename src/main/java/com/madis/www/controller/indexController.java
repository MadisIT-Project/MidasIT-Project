package com.madis.www.controller;

import java.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class indexController {

	private static final Logger logger = Logger.getLogger("indexController");

	@RequestMapping(value = { "/index", "/" }, method = RequestMethod.GET)
	public String home(HttpServletRequest request) {
		logger.info("logger test");
		System.out.println("---system out test---");

		return "index";
	}
}
