package com.kh.klib.customer.model.vo;

import java.sql.Date;

public class Question {
	
	private int qNo;
	private String qTitle;
	private String qContent;
	private String writer;
	private Date qDate;
	private int qCount;
	private String qStatus;
	private int userNo;
	
	public Question() {
		
	}
	
	public Question(int qNo, String qTitle, String qContent, String writer, Date qDate, int qCount, String qStatus) {
		super();
		this.qNo = qNo;
		this.qTitle = qTitle;
		this.qContent = qContent;
		this.writer = writer;
		this.qDate = qDate;
		this.qCount = qCount;
		this.qStatus = qStatus;
	}
	
	

	public Question(int qNo, String qTitle, String qContent, String writer, Date qDate, int qCount, String qStatus,
			int userNo) {
		super();
		this.qNo = qNo;
		this.qTitle = qTitle;
		this.qContent = qContent;
		this.writer = writer;
		this.qDate = qDate;
		this.qCount = qCount;
		this.qStatus = qStatus;
		this.userNo = userNo;
	}

	public int getqNo() {
		return qNo;
	}
	public void setqNo(int qNo) {
		this.qNo = qNo;
	}
	public String getqTitle() {
		return qTitle;
	}
	public void setqTitle(String qTitle) {
		this.qTitle = qTitle;
	}
	public String getqContent() {
		return qContent;
	}
	public void setqContent(String qContent) {
		this.qContent = qContent;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public Date getqDate() {
		return qDate;
	}
	public void setqDate(Date qDate) {
		this.qDate = qDate;
	}
	public int getqCount() {
		return qCount;
	}
	public void setqCount(int qCount) {
		this.qCount = qCount;
	}
	public String getqStatus() {
		return qStatus;
	}
	public void setqStatus(String qStatus) {
		this.qStatus = qStatus;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	@Override
	public String toString() {
		return "Question [qNo=" + qNo + ", qTitle=" + qTitle + ", qContent=" + qContent + ", writer=" + writer
				+ ", qDate=" + qDate + ", qCount=" + qCount + ", qStatus=" + qStatus + ", userNo=" + userNo + "]";
	}
	
	
	
}
