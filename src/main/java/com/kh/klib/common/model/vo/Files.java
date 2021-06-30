package com.kh.klib.common.model.vo;

import java.sql.Date;

public class Files {
	private int fNo;
	private String originName;
	private String changeName;
	private Date uploadDate;
	private int fileLevel;
	private String fStatus;
	private int bNo;	// boardNo
	private int gNo;	// groupNo
	private int cNo;	// cultureNo
	private int bkNo;	// booksNo
	private int qNo;	// qNo
	
	public Files() {}

	public Files(int fNo, String originName, String changeName, Date uploadDate, int fileLevel,
			String fStatus, int bNo, int gNo, int cNo, int bkNo, int qNo) {
		super();
		this.fNo = fNo;
		this.originName = originName;
		this.changeName = changeName;
		this.uploadDate = uploadDate;
		this.fileLevel = fileLevel;
		this.fStatus = fStatus;
		this.bNo = bNo;
		this.gNo = gNo;
		this.cNo = cNo;
		this.bkNo = bkNo;
		this.qNo = qNo;
	}

	public int getfNo() {
		return fNo;
	}

	public void setfNo(int fNo) {
		this.fNo = fNo;
	}

	public String getOriginName() {
		return originName;
	}

	public void setOriginName(String originName) {
		this.originName = originName;
	}

	public String getChangeName() {
		return changeName;
	}

	public void setChangeName(String changeName) {
		this.changeName = changeName;
	}


	public Date getUploadDate() {
		return uploadDate;
	}

	public void setUploadDate(Date uploadDate) {
		this.uploadDate = uploadDate;
	}

	public int getFileLevel() {
		return fileLevel;
	}

	public void setFileLevel(int fileLevel) {
		this.fileLevel = fileLevel;
	}

	public String getfStatus() {
		return fStatus;
	}

	public void setfStatus(String fStatus) {
		this.fStatus = fStatus;
	}

	public int getbNo() {
		return bNo;
	}

	public void setbNo(int bNo) {
		this.bNo = bNo;
	}

	public int getgNo() {
		return gNo;
	}

	public void setgNo(int gNo) {
		this.gNo = gNo;
	}

	public int getcNo() {
		return cNo;
	}

	public void setcNo(int cNo) {
		this.cNo = cNo;
	}

	public int getBkNo() {
		return bkNo;
	}

	public void setBkNo(int bkNo) {
		this.bkNo = bkNo;
	}

	public int getqNo() {
		return qNo;
	}

	public void setqNo(int qNo) {
		this.qNo = qNo;
	}

	@Override
	public String toString() {
		return "Files [fNo=" + fNo + ", originName=" + originName + ", changeName=" + changeName +  ", uploadDate=" + uploadDate + ", fileLevel=" + fileLevel + ", fStatus=" + fStatus
				+ ", bNo=" + bNo + ", gNo=" + gNo + ", cNo=" + cNo + ", bkNo=" + bkNo + ", qNo=" + qNo + "]";
	}
	
	
	
	
	
}
