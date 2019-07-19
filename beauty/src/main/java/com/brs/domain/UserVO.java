package com.brs.domain;


/**
EMAIL: VARCHAR2(100) NOT NULL
PASSWORD: VARCHAR2(50) NOT NULL
NICK_NAME: VARCHAR2(200) NULL
GENDER: CHAR(2) NOT NULL
AGE: CHAR(2) NOT NULL
SKIN_TYPE: CHAR(2) NOT NULL
 */
public class UserVO {
	
	private String email;
	private String password;
	private String nickName;
	private String gender;
	private String age;
	private String skinType;
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
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
		return "UserVO [email=" + email + ", password=" + password + ", nickName=" + nickName + ", gender=" + gender
				+ ", age=" + age + ", skinType=" + skinType + "]";
	}
	
	
}
