package com.brs.domain.method;


public class MethodSuggestVO extends MethodVO {
	int methodNo;
	int methodStep;
	String skinType;
	String makeUpDegree;
	String weather;
	String dust;
	
	public int getMethodNo() {
		return methodNo;
	}
	public void setMethodNo(int methodNo) {
		this.methodNo = methodNo;
	}
	public int getMethodStep() {
		return methodStep;
	}
	public void setMethodStep(int methodStep) {
		this.methodStep = methodStep;
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
	public String getWeather() {
		return weather;
	}
	public void setWeather(String weather) {
		this.weather = weather;
	}
	public String getDust() {
		return dust;
	}
	public void setDust(String dust) {
		this.dust = dust;
	}
	
	@Override
	public String toString() {
		return "MethodSuggestVO [methodNo=" + methodNo + ", methodStep=" + methodStep + ", skinType=" + skinType
				+ ", makeUpDegree=" + makeUpDegree + ", weather=" + weather + ", dust=" + dust + "]";
	}
	
}
