package com.kh.klib.culture.model.vo;

public class Culture {
	private int cNo;			// 문화마당 번호 
	private String cTitle;		// 제목
	private String cContent;	// 내용
	private int cTotal;			// 모집 인원
	private	String cStartDate;	// 시작 일자
	private String cEndDate;		// 마감 일자
	private String lDate;			// 강의 날짜
	private String lTime;			// 강의 시간
	private String cPlace;		// 장소
	private String cInstructor;	// 강사
	private String cTarget;		// 대상
	private String cDeadLine;	// 마감 상태
	private String cStatus;		// 문화 상태
	
	public Culture() {}

	public Culture(int cNo, String cTitle, String cContent, int cTotal, String cStartDate, String cEndDate,
			String lDate, String lTime, String cPlace, String cInstructor, String cTarget, String cDeadLine,
			String cStatus) {
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
		this.cDeadLine = cDeadLine;
		this.cStatus = cStatus;
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

	public String getcStartDate() {
		return cStartDate;
	}

	public void setcStartDate(String cStartDate) {
		this.cStartDate = cStartDate;
	}

	public String getcEndDate() {
		return cEndDate;
	}

	public void setcEndDate(String cEndDate) {
		this.cEndDate = cEndDate;
	}

	public String getlDate() {
		return lDate;
	}

	public void setlDate(String lDate) {
		this.lDate = lDate;
	}

	public String getlTime() {
		return lTime;
	}

	public void setlTime(String lTime) {
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

	public String getcDeadLine() {
		return cDeadLine;
	}

	public void setcDeadLine(String cDeadLine) {
		this.cDeadLine = cDeadLine;
	}

	public String getcStatus() {
		return cStatus;
	}

	public void setcStatus(String cStatus) {
		this.cStatus = cStatus;
	}

	@Override
	public String toString() {
		return "Culture [cNo=" + cNo + ", cTitle=" + cTitle + ", cContent=" + cContent + ", cTotal=" + cTotal
				+ ", cStartDate=" + cStartDate + ", cEndDate=" + cEndDate + ", lDate=" + lDate + ", lTime=" + lTime
				+ ", cPlace=" + cPlace + ", cInstructor=" + cInstructor + ", cTarget=" + cTarget + ", cDeadLine="
				+ cDeadLine + ", cStatus=" + cStatus + "]";
	}

	
	
}
