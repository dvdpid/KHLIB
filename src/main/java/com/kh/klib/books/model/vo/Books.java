package com.kh.klib.books.model.vo;

import java.sql.Date;

public class Books {
	private int bNo;			// 도서 번호
	private String bTitle;		// 책 제목
	private String bWriter;		// 저자
	private String bCompany;	// 출판사
	private Date bDate;			// 출판 년도
	private String bContent;	// 줄거리
	private String bStatus;		// 도서 상태
	private String bRecommend;	// 추천
	private Date entryDate;		// 입고 일자
	private String uNo;			// 계정 번호
	
	public Books() {}

	public Books(int bNo, String bTitle, String bWriter, String bCompany, Date bDate, String bContent, String bStatus,
			String bRecommend, Date entryDate, String uNo) {
		super();
		this.bNo = bNo;
		this.bTitle = bTitle;
		this.bWriter = bWriter;
		this.bCompany = bCompany;
		this.bDate = bDate;
		this.bContent = bContent;
		this.bStatus = bStatus;
		this.bRecommend = bRecommend;
		this.entryDate = entryDate;
		this.uNo = uNo;
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

	public String getbWriter() {
		return bWriter;
	}

	public void setbWriter(String bWriter) {
		this.bWriter = bWriter;
	}

	public String getbCompany() {
		return bCompany;
	}

	public void setbCompany(String bCompany) {
		this.bCompany = bCompany;
	}

	public Date getbDate() {
		return bDate;
	}

	public void setbDate(Date bDate) {
		this.bDate = bDate;
	}

	public String getbContent() {
		return bContent;
	}

	public void setbContent(String bContent) {
		this.bContent = bContent;
	}

	public String getbStatus() {
		return bStatus;
	}

	public void setbStatus(String bStatus) {
		this.bStatus = bStatus;
	}

	public String getbRecommend() {
		return bRecommend;
	}

	public void setbRecommend(String bRecommend) {
		this.bRecommend = bRecommend;
	}

	public Date getEntryDate() {
		return entryDate;
	}

	public void setEntryDate(Date entryDate) {
		this.entryDate = entryDate;
	}

	public String getuNo() {
		return uNo;
	}

	public void setuNo(String uNo) {
		this.uNo = uNo;
	}

	@Override
	public String toString() {
		return "books [bNo=" + bNo + ", bTitle=" + bTitle + ", bWriter=" + bWriter + ", bCompany=" + bCompany
				+ ", bDate=" + bDate + ", bContent=" + bContent + ", bStatus=" + bStatus + ", bRecommend=" + bRecommend
				+ ", entryDate=" + entryDate + ", uNo=" + uNo + "]";
	}
	
}
