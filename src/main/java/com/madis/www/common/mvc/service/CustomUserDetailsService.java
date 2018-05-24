package com.madis.www.common.mvc.service;

import java.util.ArrayList;
import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.madis.www.model.dto.UserInfo;
import com.madis.www.services.JoinService;

@Service
public class CustomUserDetailsService implements UserDetailsService {

	@Autowired
	JoinService joinService;

	@Override
	public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
		UserInfo userInfo = null;
		System.out.println("email: "+email);
		
		try {
			userInfo = joinService.getUserInfo(email);
		} catch (Exception e) {
			e.printStackTrace();
		}

		if (userInfo == null) {
			throw new UsernameNotFoundException("No user found with email" + email);
		}

		Collection<SimpleGrantedAuthority> roles = new ArrayList<SimpleGrantedAuthority>();

		if (userInfo.isAdmin()) {
			System.out.println("admin");
			roles.add(new SimpleGrantedAuthority("ROLE_ADMIN"));
		} else {
			System.out.println("user");
			roles.add(new SimpleGrantedAuthority("ROLE_USER"));
		}

		UserDetails user = new User(userInfo.getEmail(), userInfo.getPassword(), roles);

		return user;
	}
}
