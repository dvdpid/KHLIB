package com.kh.klib.notice.model.vo;

import java.sql.Date;

public class Notice {
	
	private int nNo;
	private String nTitle;
	private String nContent;
	private Date nDate;
	private String nWriter;
	private int nCount;
	private String nStatus;
	
	public Notice() {}
	
	public Notice(int nNo, String nTitle, String nContent, Date nDate, String nWriter, int nCount, String nStatus) {
		super();
		this.nNo = nNo;
		this.nTitle = nTitle;
		this.nContent = nContent;
		this.nDate = nDate;
		this.nWriter = nWriter;
		this.nCount = nCount;
		this.nStatus = nStatus;
	}

	public int getnNo() {
		return nNo;
	}

	public void setnNo(int nNo) {
		this.nNo = nNo;
	}

	public String getnTitle() {
		return nTitle;
	}

	public void setnTitle(String nTitle) {
		this.nTitle = nTitle;
	}

	public String getnContent() {
		return nContent;
	}

	public void setnContent(String nContent) {
		this.nContent = nContent;
	}

	public Date getnDate() {
		return nDate;
	}

	public void setnDate(Date nDate) {
		this.nDate = nDate;
	}

	public String getnWriter() {
		return nWriter;
	}

	public void setnWriter(String nWriter) {
		this.nWriter = nWriter;
	}

	public int getnCount() {
		return nCount;
	}

	public void setnCount(int nCount) {
		this.nCount = nCount;
	}

	public String getnStatus() {
		return nStatus;
	}

	public void setnStatus(String nStatus) {
		this.nStatus = nStatus;
	}

	@Override
	public String toString() {
		return "Notice [nNo=" + nNo + ", nTitle=" + nTitle + ", nContent=" + nContent + ", nDate=" + nDate
				+ ", nWriter=" + nWriter + ", nCount=" + nCount + ", nStatus=" + nStatus + "]";
	}
}
