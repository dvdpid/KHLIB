package com.kh.klib.notice.model.vo;

public class NoticeSearchValue {
	private String title;
	private String writer;

	public NoticeSearchValue() {}

	public NoticeSearchValue(String title, String writer) {
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
		return "BoardSearchValue [title=" + title + ", writer=" + writer + "]";
	}

	
	
	
	

	
	

}
