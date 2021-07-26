package com.kh.klib.bkgroup.model.vo;

import java.sql.Date;

public class GroupSign {
	private int gNo;
	private int uNo;
	private String gsStatus;
	private String gsApproval;
	private Date gsDate;
	private int memberCount;
	
	public GroupSign() {}
	
	
	public GroupSign(int gNo, int memberCount) {
		super();
		this.gNo = gNo;
		this.memberCount = memberCount;
	}



	public GroupSign(int gNo, int uNo, String gsStatus, String gsApproval, Date gsDate) {
		super();
		this.gNo = gNo;
		this.uNo = uNo;
		this.gsStatus = gsStatus;
		this.gsApproval = gsApproval;
		this.gsDate = gsDate;
	}

	

	public GroupSign(int gNo, int uNo, String gsStatus, String gsApproval, Date gsDate, int memberCount) {
		super();
		this.gNo = gNo;
		this.uNo = uNo;
		this.gsStatus = gsStatus;
		this.gsApproval = gsApproval;
		this.gsDate = gsDate;
		this.memberCount = memberCount;
	}






	public int getgNo() {
		return gNo;
	}
	public void setgNo(int gNo) {
		this.gNo = gNo;
	}
	public int getuNo() {
		return uNo;
	}
	public void setuNo(int uNo) {
		this.uNo = uNo;
	}
	public String getGsStatus() {
		return gsStatus;
	}
	public void setGsStatus(String gsStatus) {
		this.gsStatus = gsStatus;
	}
	public String getGsApproval() {
		return gsApproval;
	}
	public void setGsApproval(String gsApproval) {
		this.gsApproval = gsApproval;
	}
	public Date getGsDate() {
		return gsDate;
	}
	public void setGsDate(Date gsDate) {
		this.gsDate = gsDate;
	}



	public int getMemberCount() {
		return memberCount;
	}



	public void setMemberCount(int memberCount) {
		this.memberCount = memberCount;
	}



	@Override
	public String toString() {
		return "GroupSign [gNo=" + gNo + ", uNo=" + uNo + ", gsStatus=" + gsStatus + ", gsApproval=" + gsApproval
				+ ", gsDate=" + gsDate + ", memberCount=" + memberCount + "]";
	}


	
	 
	

}
