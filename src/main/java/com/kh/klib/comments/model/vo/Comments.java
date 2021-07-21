package com.kh.klib.comments.model.vo;

import java.sql.Date;

public class Comments {
	private int cNo;
	private String cContent;
	private String cWriter;
	private Date cDate;
	private String cStatus;
	private int bNo;
	 
	public Comments(int cNo, String cContent, String cWriter, Date cDate, String cStatus, int bNo) {
		super();
		this.cNo = cNo;
		this.cContent = cContent;
		this.cWriter = cWriter;
		this.cDate = cDate;
		this.cStatus = cStatus;
		this.bNo = bNo;
	}

	public Comments() {}

	public int getcNo() {
		return cNo;
	}

	public void setcNo(int cNo) {
		this.cNo = cNo;
	}

	public String getcContent() {
		return cContent;
	}

	public void setcContent(String cContent) {
		this.cContent = cContent;
	}

	public String getcWriter() {
		return cWriter;
	}

	public void setcWriter(String cWriter) {
		this.cWriter = cWriter;
	}

	public Date getcDate() {
		return cDate;
	}

	public void setcDate(Date cDate) {
		this.cDate = cDate;
	}

	public String getcStatus() {
		return cStatus;
	}

	public void setcStatus(String cStatus) {
		this.cStatus = cStatus;
	}

	public int getbNo() {
		return bNo;
	}

	public void setbNo(int bNo) {
		this.bNo = bNo;
	}

	@Override
	public String toString() {
		return "Comments [cNo=" + cNo + ", cContent=" + cContent + ", cWriter=" + cWriter + ", cDate=" + cDate
				+ ", cStatus=" + cStatus + ", bNo=" + bNo + "]";
	}
	
	

}
