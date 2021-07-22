package com.kh.klib.admin.model.vo;

public class AdminSearchValue {
	private String title;
	private String writer;

	public AdminSearchValue() {}

	public AdminSearchValue(String title, String writer) {
		super();
		this.title = title;
		this.writer = writer;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getWriter() {
		return writer;
	}
 
	public void setWriter(String writer) {
		this.writer = writer;
	}

	@Override
	public String toString() {
		return "AdminSearchValue [title=" + title + ", writer=" + writer + "]";
	}

	
	
	
	

	
	

}
