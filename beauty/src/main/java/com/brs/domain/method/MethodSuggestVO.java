package com.brs.domain.method;

public class MethodSuggestVO {
	int methodNo;
	String skinType;
	String makeUp;
	String weather;
	String dust;
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
	public String getMakeUp() {
		return makeUp;
	}
	public void setMakeUp(String makeUp) {
		this.makeUp = makeUp;
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
		return "MethodSuggestVO [methodNo=" + methodNo + ", skinType=" + skinType + ", makeUp=" + makeUp + ", weather="
				+ weather + ", dust=" + dust + "]";
	}
	
	
}
