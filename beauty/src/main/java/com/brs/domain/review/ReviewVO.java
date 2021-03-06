package com.brs.domain.review;

import java.util.Date;

/**
REVIEW_NO: NUMBER NOT NULL
RATING: NUMBER NOT NULL
REVIEW_TEXT: VARCHAR2(1000) NULL
COMMAND: CHAR(1) NOT NULL
REGDATE: DATE NULL
PROD_NO: NUMBER NOT NULL (FK)
EMAIL: VARCHAR2(100) NOT NULL (FK)
 */
 
public class ReviewVO{

	private int reviewNo;
	private double rating;
	private String reviewText;
	private String command;
	private Date regdate;
	private int prodNo;
	private String userEmail;
	private String userNickName;
	private String userGender;
	private String userAge;
	private String userSkinType;
	
	public int getReviewNo() {
		return reviewNo;
	}
	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}
	public double getRating() {
		return rating;
	}
	public void setRating(double rating) {
		this.rating = rating;
	}
	public String getReviewText() {
		return reviewText;
	}
	public void setReviewText(String reviewText) {
		this.reviewText = reviewText;
	}
	public String getCommand() {
		return command;
	}
	public void setCommand(String command) {
		this.command = command;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public int getProdNo() {
		return prodNo;
	}
	public void setProdNo(int prodNo) {
		this.prodNo = prodNo;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public String getUserNickName() {
		return userNickName;
	}
	public void setUserNickName(String userNickName) {
		this.userNickName = userNickName;
	}
	public String getUserGender() {
		return userGender;
	}
	public void setUserGender(String userGender) {
		this.userGender = userGender;
	}
	public String getUserAge() {
		return userAge;
	}
	public void setUserAge(String userAge) {
		this.userAge = userAge;
	}
	public String getUserSkinType() {
		return userSkinType;
	}
	public void setUserSkinType(String userSkinType) {
		this.userSkinType = userSkinType;
	}
	
}
