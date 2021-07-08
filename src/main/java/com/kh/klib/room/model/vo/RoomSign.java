package com.kh.klib.room.model.vo;

import java.util.Date;

public class RoomSign {
	private int rsNo;			// 예약 번호
	private Date inTime;		// 입실 시간
	private Date outTime;		// 퇴실 시간
	private String nickName;	// 닉네임
	private String rStatus;		// 좌석 상태
	private int rNo;			// 좌석 번호
	private int uNo;			// 계정 번호
	
	public RoomSign() {}

	public RoomSign(int rsNo, Date inTime, Date outTime, String nickName, String rStatus, int rNo, int uNo) {
		super();
		this.rsNo = rsNo;
		this.inTime = inTime;
		this.outTime = outTime;
		this.nickName = nickName;
		this.rStatus = rStatus;
		this.rNo = rNo;
		this.uNo = uNo;
	}

	public int getRsNo() {
		return rsNo;
	}

	public void setRsNo(int rsNo) {
		this.rsNo = rsNo;
	}

	public Date getInTime() {
		return inTime;
	}

	public void setInTime(Date inTime) {
		this.inTime = inTime;
	}

	public Date getOutTime() {
		return outTime;
	}

	public void setOutTime(Date outTime) {
		this.outTime = outTime;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public String getrStatus() {
		return rStatus;
	}

	public void setrStatus(String rStatus) {
		this.rStatus = rStatus;
	}

	public int getrNo() {
		return rNo;
	}

	public void setrNo(int rNo) {
		this.rNo = rNo;
	}

	public int getuNo() {
		return uNo;
	}

	public void setuNo(int uNo) {
		this.uNo = uNo;
	}

	@Override
	public String toString() {
		return "RoomSign [rsNo=" + rsNo + ", inTime=" + inTime + ", outTime=" + outTime + ", nickName=" + nickName
				+ ", rStatus=" + rStatus + ", rNo=" + rNo + ", uNo=" + uNo + "]";
	}
}
