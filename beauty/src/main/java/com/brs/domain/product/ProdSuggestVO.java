package com.brs.domain.product;

public class ProdSuggestVO {
	
	private String gender; // PRODUCT TABLE
	private String age;
	private String skinType;
	
	
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) { 
		this.gender = gender;
	}
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	public String getSkinType() {
		return skinType;
	}
	public void setSkinType(String skinType) {
		this.skinType = skinType;
	}
	@Override
	public String toString() {
		return "ProdSuggestVO [gender=" + gender + ", age=" + age + ", skinType=" + skinType + "]";
	}

	
}
