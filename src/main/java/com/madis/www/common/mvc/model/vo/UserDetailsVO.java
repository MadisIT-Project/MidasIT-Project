package com.madis.www.common.mvc.model.vo;

import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;

public class UserDetailsVO extends User {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String name;
	private int age;

	public UserDetailsVO(String username, String password, boolean enabled, boolean accountNonExpired,
			boolean credentialsNonExpired, boolean accountNonLocked,
			Collection<? extends GrantedAuthority> authorities, String name, int age) {
		super(username, password, enabled, accountNonExpired, credentialsNonExpired, accountNonLocked, authorities);
		this.name = name;
		this.age = age;
	}

	@Override
	public String toString() {
		return super.toString() + "; name: " + this.name + "; age: " + this.age;
	}
}
