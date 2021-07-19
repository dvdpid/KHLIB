package com.kh.klib.bkgroup.model.vo;

import java.sql.Date;

public class BookGroup {
	private int gNo;
	private String gName;
	private String gIntro;
	private String gTotal;
	private String gContent;
	private String gbTitle;
	private String gbContent;
	private Date gDate;
	private String gPlace;
	private String gDeadline;
	private String gStatus;
	private String gWriter;
	
	public BookGroup() {}

	public BookGroup(int gNo, String gName, String gIntro, String gTotal, String gContent, String gbTitle,
			String gbContent, Date gDate, String gPlace, String gDeadline, String gStatus, String gWriter) {
		super();
		this.gNo = gNo;
		this.gName = gName;
		this.gIntro = gIntro;
		this.gTotal = gTotal;
		this.gContent = gContent;
		this.gbTitle = gbTitle;
		this.gbContent = gbContent;
		this.gDate = gDate;
		this.gPlace = gPlace;
		this.gDeadline = gDeadline;
		this.gStatus = gStatus;
		this.gWriter = gWriter;
	}

	public int getgNo() {
		return gNo;
	}

	public void setgNo(int gNo) {
		this.gNo = gNo;
	}

	public String getgName() {
		return gName;
	}

	public void setgName(String gName) {
		this.gName = gName;
	}

	public String getgIntro() {
		return gIntro;
	}

	public void setgIntro(String gIntro) {
		this.gIntro = gIntro;
	}

	public String getgTotal() {
		return gTotal;
	}

	public void setgTotal(String gTotal) {
		this.gTotal = gTotal;
	}

	public String getgContent() {
		return gContent;
	}

	public void setgContent(String gContent) {
		this.gContent = gContent;
	}

	public String getGbTitle() {
		return gbTitle;
	}

	public void setGbTitle(String gbTitle) {
		this.gbTitle = gbTitle;
	}

	public String getGbContent() {
		return gbContent;
	}

	public void setGbContent(String gbContent) {
		this.gbContent = gbContent;
	}

	public Date getgDate() {
		return gDate;
	}

	public void setgDate(Date gDate) {
		this.gDate = gDate;
	}

	public String getgPlace() {
		return gPlace;
	}

	public void setgPlace(String gPlace) {
		this.gPlace = gPlace;
	}

	public String getgDeadline() {
		return gDeadline;
	}

	public void setgDeadline(String gDeadline) {
		this.gDeadline = gDeadline;
	}

	public String getgStatus() {
		return gStatus;
	}

	public void setgStatus(String gStatus) {
		this.gStatus = gStatus;
	}

	public String getgWriter() {
		return gWriter;
	}

	public void setgWriter(String gWriter) {
		this.gWriter = gWriter;
	}

	@Override
	public String toString() {
		return "BookGroup [gNo=" + gNo + ", gName=" + gName + ", gIntro=" + gIntro + ", gTotal=" + gTotal
				+ ", gContent=" + gContent + ", gbTitle=" + gbTitle + ", gbContent=" + gbContent + ", gDate=" + gDate
				+ ", gPlace=" + gPlace + ", gDeadline=" + gDeadline + ", gStatus=" + gStatus + ", gWriter=" + gWriter
				+ "]";
	}

	
	
	
	
}
