package com.kh.klib.culture.model.vo;

import java.util.Date;

public class CultureSign {
	private int uNo;			// 계정 번호
	private int cNo;			// 문화마당 번호
	private String csStatus;	// 신청 여부
	private Date csDate;		// 신청 시간
	private String csApproval;	// 승인 여부
	private int approvalCount;
	
	public CultureSign() {}
	
	public CultureSign(int cNo, int approvalCount) {
		super();
		this.cNo = cNo;
		this.approvalCount = approvalCount;
	}

	public CultureSign(int uNo, int cNo, String csStatus, Date csDate, String csApproval) {
		super();
		this.uNo = uNo;
		this.cNo = cNo;
		this.csStatus = csStatus;
		this.csDate = csDate;
		this.csApproval = csApproval;
	}

	public int getuNo() {
		return uNo;
	}

	public void setuNo(int uNo) {
		this.uNo = uNo;
	}

	public int getcNo() {
		return cNo;
	}

	public void setcNo(int cNo) {
		this.cNo = cNo;
	}

	public String getCsStatus() {
		return csStatus;
	}

	public void setCsStatus(String csStatus) {
		this.csStatus = csStatus;
	}

	public Date getCsDate() {
		return csDate;
	}

	public void setCsDate(Date csDate) {
		this.csDate = csDate;
	}

	public String getCsApproval() {
		return csApproval;
	}

	public void setCsApproval(String csApproval) {
		this.csApproval = csApproval;
	}

	public int getApprovalCount() {
		return approvalCount;
	}

	public void setApprovalCount(int approvalCount) {
		this.approvalCount = approvalCount;
	}
	
	@Override
	public String toString() {
		return "CultureSign [uNo=" + uNo + ", cNo=" + cNo + ", csStatus=" + csStatus + ", csDate=" + csDate
				+ ", csApproval=" + csApproval + ", approvalCount=" + approvalCount + "]";
	}

	
}
