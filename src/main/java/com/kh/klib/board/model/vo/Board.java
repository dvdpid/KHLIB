package com.kh.klib.board.model.vo;

import java.sql.Date;

public class Board {
	private int bNo;
	private String bTitle;
	private String bContent;
	private String bWriter;
	private Date bDate;
	private int bCount ;
	private String bStatus;
	
	public Board() {}

	public Board(int bNo, String bTitle, String bContent, String bWriter, Date bDate, int bCount, String bStatus) {
		super();
		this.bNo = bNo;
		this.bTitle = bTitle;
		this.bContent = bContent;
		this.bWriter = bWriter;
		this.bDate = bDate;
		this.bCount = bCount;
		this.bStatus = bStatus;
	}

	 
	
	public int getbNo() {
		return bNo;
	}

	public void setbNo(int bNo) {
		this.bNo = bNo;
	}

	public String getbTitle() {
		return bTitle;
	}

	public void setbTitle(String bTitle) {
		this.bTitle = bTitle;
	}

	public String getbContent() {
		return bContent;
	}

	public void setbContent(String bContent) {
		this.bContent = bContent;
	}

	public String getbWriter() {
		return bWriter;
	}

	public void setbWriter(String bWriter) {
		this.bWriter = bWriter;
	}

	public Date getbDate() {
		return bDate;
	}

	public void setbDate(Date bDate) {
		this.bDate = bDate;
	}

	public int getbCount() {
		return bCount;
	}

	public void setbCount(int bCount) {
		this.bCount = bCount;
	}

	public String getbStatus() {
		return bStatus;
	}

	public void setbStatus(String bStatus) {
		this.bStatus = bStatus;
	}

	@Override
	public String toString() {
		return "Board [bNo=" + bNo + ", bTitle=" + bTitle + ", bContent=" + bContent + ", bWriter=" + bWriter
				+ ", bDate=" + bDate + ", bCount=" + bCount + ", bStatus=" + bStatus + "]";
	}

	
	
}
