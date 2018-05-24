package com.madis.www.common.mvc.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.authentication.SavedRequestAwareAuthenticationSuccessHandler;
import org.springframework.stereotype.Service;

@Service
public class CustomUserAuthenticationSuccessHandler extends SavedRequestAwareAuthenticationSuccessHandler {

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws ServletException, IOException {
		
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		System.out.println(principal.toString());
		
//		Authentication p = (Authentication) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
//		System.out.println(p.getName());
		
		System.out.println("--------");
		System.out.println("SecurityContextHolder.getContext().getAuthentication(): "+SecurityContextHolder.getContext().getAuthentication());
		
		System.out.println("--------");
		System.out.println(request.getParameter("email"));
		System.out.println(request.getParameter("username"));
		System.out.println(request.getParameter("password"));
		System.out.println("--------");
		
		System.out.println("redirect page");
		response.sendRedirect("/main");
		
	}
}
