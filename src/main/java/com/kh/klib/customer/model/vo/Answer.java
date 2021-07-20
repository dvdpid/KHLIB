package com.kh.klib.customer.model.vo;

import java.sql.Date;

public class Answer {

	private int aNo;
	private String aTitle;
	private String aContent;
	private String writer;
	private Date aDate;
	private String aStatus;
	private int qNo;
	private int userNo;

	public Answer() {

	}

	public Answer(int aNo, String aTitle, String writer, Date aDate, String aStatus, int qNo, int userNo) {
		super();
		this.aNo = aNo;
		this.aTitle = aTitle;
		this.writer = writer;
		this.aDate = aDate;
		this.aStatus = aStatus;
		this.qNo = qNo;
		this.userNo = userNo;
	}

	public int getaNo() {
		return aNo;
	}

	public void setaNo(int aNo) {
		this.aNo = aNo;
	}

	public String getaTitle() {
		return aTitle;
	}

	public void setaTitle(String aTitle) {
		this.aTitle = aTitle;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public Date getaDate() {
		return aDate;
	}

	public void setaDate(Date aDate) {
		this.aDate = aDate;
	}

	public String getaStatus() {
		return aStatus;
	}

	public void setaStatus(String aStatus) {
		this.aStatus = aStatus;
	}

	public int getqNo() {
		return qNo;
	}

	public void setqNo(int qNo) {
		this.qNo = qNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getaContent() {
		return aContent;
	}

	public void setaContent(String aContent) {
		this.aContent = aContent;
	}

	@Override
	public String toString() {
		return "Answer [aNo=" + aNo + ", aTitle=" + aTitle + ", writer=" + writer + ", aDate=" + aDate + ", aStatus="
				+ aStatus + ", qNo=" + qNo + ", userNo=" + userNo + "]";
	}

}
