package com.kh.klib.board.model.vo;

public class BoardSearchValue {
	private String title;
	private String writer;

	public BoardSearchValue() {}

	public BoardSearchValue(String title, String writer) {
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
