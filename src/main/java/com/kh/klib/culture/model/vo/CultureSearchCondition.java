package com.kh.klib.culture.model.vo;

public class CultureSearchCondition {
	private String title;
	private String instructor;
	private String place;
	private String target;
	
	public CultureSearchCondition() {}

	public CultureSearchCondition(String title, String instructor, String place, String target) {
		super();
		this.title = title;
		this.instructor = instructor;
		this.place = place;
		this.target = target;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getInstructor() {
		return instructor;
	}

	public void setInstructor(String instructor) {
		this.instructor = instructor;
	}

	public String getPlace() {
		return place;
	}

	public void setPlace(String place) {
		this.place = place;
	}

	public String getTarget() {
		return target;
	}

	public void setTarget(String target) {
		this.target = target;
	}

	@Override
	public String toString() {
		return "CultureSearchCondition [title=" + title + ", instructor=" + instructor + ", place=" + place
				+ ", target=" + target + "]";
	}
	
	
}
