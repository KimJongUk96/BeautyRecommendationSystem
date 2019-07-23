package com.brs.domain.util;

public class MethodSuggestCriteria extends SearchCriteria{

	private String skinType;
	private String makeUpDegree;
	private String weather;
	private String dust;
	private String searchType;
	private String keyword;
	
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
	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	
	@Override
	public String toString() {
		return "MethodSuggestCriteria [skinType=" + skinType + ", makeUpDegree=" + makeUpDegree + ", weather=" + weather
				+ ", dust=" + dust + ", searchType=" + searchType + ", keyword=" + keyword + "]";
	}
	
	
	
	
}
