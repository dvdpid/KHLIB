package com.kh.klib.culture.model.vo;

import java.util.Date;

public class Culture {
	private int cNo;			// 문화마당 번호 
	private String cTitle;		// 제목
	private String cContent;	// 내용
	private int cTotal;			// 모집 인원
	private Date cStartDate;	// 시작 일자
	private Date cEndDate;		// 마감 일자
	private Date lDate;			// 강의 시간
	private Date lTime;			// 강의 날짜
	private String cPlace;		// 장소
	private String cInstructor;	// 강사
	private String cTarget;		// 대상
	private String cDateLine;	// 마감 상태
	private String cStatus;		// 문화 상태
	private int uNo;			// 계정 번호
	
	public Culture() {}

	public Culture(int cNo, String cTitle, String cContent, int cTotal, Date cStartDate, Date cEndDate, Date lDate,
			Date lTime, String cPlace, String cInstructor, String cTarget, String cDateLine, String cStatus, int uNo) {
		super();
		this.cNo = cNo;
		this.cTitle = cTitle;
		this.cContent = cContent;
		this.cTotal = cTotal;
		this.cStartDate = cStartDate;
		this.cEndDate = cEndDate;
		this.lDate = lDate;
		this.lTime = lTime;
		this.cPlace = cPlace;
		this.cInstructor = cInstructor;
		this.cTarget = cTarget;
		this.cDateLine = cDateLine;
		this.cStatus = cStatus;
		this.uNo = uNo;
	}

	public int getcNo() {
		return cNo;
	}

	public void setcNo(int cNo) {
		this.cNo = cNo;
	}

	public String getcTitle() {
		return cTitle;
	}

	public void setcTitle(String cTitle) {
		this.cTitle = cTitle;
	}

	public String getcContent() {
		return cContent;
	}

	public void setcContent(String cContent) {
		this.cContent = cContent;
	}

	public int getcTotal() {
		return cTotal;
	}

	public void setcTotal(int cTotal) {
		this.cTotal = cTotal;
	}

	public Date getcStartDate() {
		return cStartDate;
	}

	public void setcStartDate(Date cStartDate) {
		this.cStartDate = cStartDate;
	}

	public Date getcEndDate() {
		return cEndDate;
	}

	public void setcEndDate(Date cEndDate) {
		this.cEndDate = cEndDate;
	}

	public Date getlDate() {
		return lDate;
	}

	public void setlDate(Date lDate) {
		this.lDate = lDate;
	}

	public Date getlTime() {
		return lTime;
	}

	public void setlTime(Date lTime) {
		this.lTime = lTime;
	}

	public String getcPlace() {
		return cPlace;
	}

	public void setcPlace(String cPlace) {
		this.cPlace = cPlace;
	}

	public String getcInstructor() {
		return cInstructor;
	}

	public void setcInstructor(String cInstructor) {
		this.cInstructor = cInstructor;
	}

	public String getcTarget() {
		return cTarget;
	}

	public void setcTarget(String cTarget) {
		this.cTarget = cTarget;
	}

	public String getcDateLine() {
		return cDateLine;
	}

	public void setcDateLine(String cDateLine) {
		this.cDateLine = cDateLine;
	}

	public String getcStatus() {
		return cStatus;
	}

	public void setcStatus(String cStatus) {
		this.cStatus = cStatus;
	}

	public int getuNo() {
		return uNo;
	}

	public void setuNo(int uNo) {
		this.uNo = uNo;
	}

	@Override
	public String toString() {
		return "Culture [cNo=" + cNo + ", cTitle=" + cTitle + ", cContent=" + cContent + ", cTotal=" + cTotal
				+ ", cStartDate=" + cStartDate + ", cEndDate=" + cEndDate + ", lDate=" + lDate + ", lTime=" + lTime
				+ ", cPlace=" + cPlace + ", cInstructor=" + cInstructor + ", cTarget=" + cTarget + ", cDateLine="
				+ cDateLine + ", cStatus=" + cStatus + ", uNo=" + uNo + "]";
	}
	
	
}