package com.kh.klib.member.model.vo;

import java.sql.Date;

public class Member {
	private int no;
	private String id;
	private String pwd;
	private String name;
	private String nickname;
	private Date birthday;
	private String gender;
	private String phone;
	private String email;
	private String address;
	private String uStatus;
	private String admin;
	
	public Member() {}

	public Member(int no, String id, String pwd, String name, String nickname, Date birthday, String gender,
			String phone, String email, String address, String uStatus, String admin) {
		super();
		this.no = no;
		this.id = id;
		this.pwd = pwd;
		this.name = name;
		this.nickname = nickname;
		this.birthday = birthday;
		this.gender = gender;
		this.phone = phone;
		this.email = email;
		this.address = address;
		this.uStatus = uStatus;
		this.admin = admin;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getPhone() {
		return phone;
	}
 
	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getuStatus() {
		return uStatus;
	}

	public void setuStatus(String uStatus) {
		this.uStatus = uStatus;
	}

	public String getAdmin() {
		return admin;
	}

	public void setAdmin(String admin) {
		this.admin = admin;
	}

	@Override
	public String toString() {
		return "Member [no=" + no + ", id=" + id + ", pwd=" + pwd + ", name=" + name + ", nickname=" + nickname
				+ ", birthday=" + birthday + ", gender=" + gender + ", phone=" + phone + ", email=" + email
				+ ", address=" + address + ", uStatus=" + uStatus + ", admin=" + admin + "]";
	}


}