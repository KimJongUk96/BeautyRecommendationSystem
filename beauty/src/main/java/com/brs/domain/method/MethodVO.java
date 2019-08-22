package com.brs.domain.method;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
METHOD_NO: NUMBER NOT NULL
SKIN_TYPE: CHAR(1) NULL
MAKEUP_DEGREE: CHAR(1) NULL
METHOD_STEP: NUMBER NULL
SEASON: CHAR(2) NULL
WEATHER: CHAR(2) NULL
DUST: CHAR(2) NULL
REGDATE: DATE NULL
ADMIN_NO: NUMBER NOT NULL (FK)
**/

public class MethodVO extends MethodDetailVO{
	
	private int methodNo;
	private String skinType;
	private String makeUpDegree;
	private int methodStep;
	private String season;
	private String weather;
	private String dust;
	private Date regdate;
	private int adminNo;
	
	private List<MethodDetailVO> detailList = new ArrayList<MethodDetailVO>();
	

	
	public List<MethodDetailVO> getDetailList() {
		return detailList;
	}
	public void setDetailList(List<MethodDetailVO> detailList) {
		this.detailList = detailList;
	}
	public int getMethodNo() {
		return methodNo;
	}
	public void setMethodNo(int methodNo) {
		this.methodNo = methodNo;
	}
	public String getSkinType() {
		return skinType;
	}
	public void setSkinType(String skinType) {
		this.skinType = skinType;
	}
	public String getMakeUpDegree() {
		return makeUpDegree;
	}
	public void setMakeUpDegree(String makeUpDegree) {
		this.makeUpDegree = makeUpDegree;
	}
	public int getMethodStep() {
		return methodStep;
	}
	public void setMethodStep(int methodStep) {
		this.methodStep = methodStep;
	}
	public String getSeason() {
		return season;
	}
	public void setSeason(String season) {
		this.season = season;
	}
	public String getWeather() {
		return weather;
	}
	public void setWeather(String whather) {
		this.weather = whather;
	}
	public String getDust() {
		return dust;
	}
	public void setDust(String dust) {
		this.dust = dust;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public int getAdminNo() {
		return adminNo;
	}
	public void setAdminNo(int adminNo) {
		this.adminNo = adminNo;
	}
	
	@Override
	public String toString() {
		return "MethodVO [methodNo=" + methodNo + ", skinType=" + skinType + ", makeUpDegree=" + makeUpDegree
				+ ", methodStep=" + methodStep + ", season=" + season + ", weather=" + weather + ", dust=" + dust
				+ ", regdate=" + regdate + ", adminNo=" + adminNo + "]";
	}
	
}
