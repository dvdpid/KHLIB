package com.kh.klib.common;

import java.sql.Date;

public class Files {
	private int fNo;
	private String originName;
	private String changeName;
	private String filePath;
	private Date uploadDate;
	private int fileLevel;
	private String fStatus;
	private int boardNo;
	private int groupNo;
	private int curtureNo;
	private int bookNo;
	private int qNo;
	
	public Files() {}
	
	public Files(int fNo, String originName, String changeName, String filePath, Date uploadDate, int fileLevel,
			String fStatus, int boardNo, int groupNo, int curtureNo, int bookNo, int qNo) {
		super();
		this.fNo = fNo;
		this.originName = originName;
		this.changeName = changeName;
		this.filePath = filePath;
		this.uploadDate = uploadDate;
		this.fileLevel = fileLevel;
		this.fStatus = fStatus;
		this.boardNo = boardNo;
		this.groupNo = groupNo;
		this.curtureNo = curtureNo;
		this.bookNo = bookNo;
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

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
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

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public int getGroupNo() {
		return groupNo;
	}

	public void setGroupNo(int groupNo) {
		this.groupNo = groupNo;
	}

	public int getCurtureNo() {
		return curtureNo;
	}

	public void setCurtureNo(int curtureNo) {
		this.curtureNo = curtureNo;
	}

	public int getBookNo() {
		return bookNo;
	}

	public void setBookNo(int bookNo) {
		this.bookNo = bookNo;
	}

	public int getqNo() {
		return qNo;
	}

	public void setqNo(int qNo) {
		this.qNo = qNo;
	}

	@Override
	public String toString() {
		return "Files [fNo=" + fNo + ", originName=" + originName + ", changeName=" + changeName + ", filePath="
				+ filePath + ", uploadDate=" + uploadDate + ", fileLevel=" + fileLevel + ", fStatus=" + fStatus
				+ ", boardNo=" + boardNo + ", groupNo=" + groupNo + ", curtureNo=" + curtureNo + ", bookNo=" + bookNo
				+ ", qNo=" + qNo + "]";
	}
	
	
	
	
}
