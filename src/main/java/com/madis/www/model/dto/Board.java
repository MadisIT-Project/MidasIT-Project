package com.madis.www.model.dto;

import java.sql.Date;

public class Board {

	private int index;
	private String title;
	private String content;
	private int b_index;
	private int u_index;
	private Date created_date;
	private Date modified_date;
	
	public int getIndex() {
		return index;
	}
	public void setIndex(int index) {
		this.index = index;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getB_index() {
		return b_index;
	}
	public void setB_index(int b_index) {
		this.b_index = b_index;
	}
	public int getU_index() {
		return u_index;
	}
	public void setU_index(int u_index) {
		this.u_index = u_index;
	}
	public Date getCreated_date() {
		return created_date;
	}
	public void setCreated_date(Date created_date) {
		this.created_date = created_date;
	}
	public Date getModified_date() {
		return modified_date;
	}
	public void setModified_date(Date modified_date) {
		this.modified_date = modified_date;
	}
	
	
	
}
