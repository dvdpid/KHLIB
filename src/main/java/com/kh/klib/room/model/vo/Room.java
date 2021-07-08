package com.kh.klib.room.model.vo;

public class Room {
	private int rNo;
	private String rStatus;
	
	public Room() {}

	public Room(int rNo, String rStatus) {
		super();
		this.rNo = rNo;
		this.rStatus = rStatus;
	}

	public int getrNo() {
		return rNo;
	}

	public void setrNo(int rNo) {
		this.rNo = rNo;
	}

	public String getrStatus() {
		return rStatus;
	}

	public void setrStatus(String rStatus) {
		this.rStatus = rStatus;
	}

	@Override
	public String toString() {
		return "Room [rNo=" + rNo + ", rStatus=" + rStatus + "]";
	}
}
