package com.brs.domain;

import java.util.Date;

/**
ADMIN_NO: NUMBER NOT NULL
ID: VARCHAR2(100) NOT NULL
PW: VARCHAR2(100) NOT NULL
NAME: VARCHAR2(50) NULL
REGDATE: DATE NULL
**/
public class AdminVO {

	private int adminNo;
	private String id;
	private String pw;
	private String name;
	private Date regdate;
	
	public int getAdminNo() {
		return adminNo;
	}
	public void setAdminNo(int adminNo) {
		this.adminNo = adminNo;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	
	@Override
	public String toString() {
		return "AdminVO [adminNo=" + adminNo + ", id=" + id + ", pw=" + pw + ", name=" + name + ", regdate=" + regdate
				+ "]";
	}
	
	
}
