package com.kh.klib.books.model.vo;

import java.sql.Date;

public class Books {
	private int bNo;			// 도서 번호
	// 사진등록을 위한 파일 필드 추가
	private String originFileName;
	private String renameFileName;
	private String bTitle;		// 책 제목
	private String bWriter;		// 저자
	private String bCompany;	// 출판사
	private Date bDate;			// 출판 년도
	private String bContent;	// 줄거리
	private String bStatus;		// 도서 상태
	private String bRecommend;	// 추천
	private Date entryDate;		// 입고 일자
	private String bForm;		// 형태상항
	private String bStandardNo; // 표준 번호
	private String bCallNo;		// 분류 기호
	
	public Books() {}

	public Books(int bNo, String originFileName, String renameFileName, String bTitle, String bWriter, String bCompany,
			Date bDate, String bContent, String bStatus, String bRecommend, Date entryDate, String bForm,
			String bStandardNo, String bCallNo) {
		super();
		this.bNo = bNo;
		this.originFileName = originFileName;
		this.renameFileName = renameFileName;
		this.bTitle = bTitle;
		this.bWriter = bWriter;
		this.bCompany = bCompany;
		this.bDate = bDate;
		this.bContent = bContent;
		this.bStatus = bStatus;
		this.bRecommend = bRecommend;
		this.entryDate = entryDate;
		this.bForm = bForm;
		this.bStandardNo = bStandardNo;
		this.bCallNo = bCallNo;
	}

	public int getbNo() {
		return bNo;
	}

	public void setbNo(int bNo) {
		this.bNo = bNo;
	}

	public String getOriginFileName() {
		return originFileName;
	}

	public void setOriginFileName(String originFileName) {
		this.originFileName = originFileName;
	}

	public String getRenameFileName() {
		return renameFileName;
	}

	public void setRenameFileName(String renameFileName) {
		this.renameFileName = renameFileName;
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

	public String getbForm() {
		return bForm;
	}

	public void setbForm(String bForm) {
		this.bForm = bForm;
	}

	public String getbStandardNo() {
		return bStandardNo;
	}

	public void setbStandardNo(String bStandardNo) {
		this.bStandardNo = bStandardNo;
	}

	public String getbCallNo() {
		return bCallNo;
	}

	public void setbCallNo(String bCallNo) {
		this.bCallNo = bCallNo;
	}

	@Override
	public String toString() {
		return "Books [bNo=" + bNo + ", originFileName=" + originFileName + ", renameFileName=" + renameFileName
				+ ", bTitle=" + bTitle + ", bWriter=" + bWriter + ", bCompany=" + bCompany + ", bDate=" + bDate
				+ ", bContent=" + bContent + ", bStatus=" + bStatus + ", bRecommend=" + bRecommend + ", entryDate="
				+ entryDate + ", bForm=" + bForm + ", bStandardNo=" + bStandardNo + ", bCallNo=" + bCallNo + "]";
	}

	
	
}
