package com.kh.klib.books.model.vo;

public class SearchCondition {
	private String writer;
	private String company;
	private String title;
	private String content;

	public SearchCondition() {
	}

	public SearchCondition(String writer, String company, String title, String content) {
		super();
		this.writer = writer;
		this.company = company;
		this.title = title;
		this.content = content;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
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

	public String getCompany() {
		return company;
	}

	public void setCompany(String company) {
		this.company = company;
	}

	@Override
	public String toString() {
		return "SearchCondition [writer=" + writer + ", company=" + company + ", title=" + title + ", content="
				+ content + "]";
	}

}
