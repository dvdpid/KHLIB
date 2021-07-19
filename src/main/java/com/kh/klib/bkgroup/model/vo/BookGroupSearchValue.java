package com.kh.klib.bkgroup.model.vo;

public class BookGroupSearchValue {
	private String name;
	private String place;
	private String book;
	
	public BookGroupSearchValue() {}
	
	public BookGroupSearchValue(String name, String place, String book) {
		super();
		this.name = name;
		this.place = place;
		this.book = book;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getPlace() {
		return place;
	}


	public void setPlace(String place) {
		this.place = place;
	}


	public String getBook() {
		return book;
	}


	public void setBook(String book) {
		this.book = book;
	}


	@Override
	public String toString() {
		return "BookGroupSearchValue [name=" + name + ", place=" + place + ", book=" + book + "]";
	}
	
	
	
	
}
