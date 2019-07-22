package com.brs.domain.util;

public class MethodSuggestCriteria extends Criteria{

	private String skinType;
	private String makeUp;
	private String weather;
	private String dust;
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
		return "MethodSuggestCriteria [skinType=" + skinType + ", makeUp=" + makeUp + ", weather=" + weather + ", dust="
				+ dust + "]";
	}
	
}
